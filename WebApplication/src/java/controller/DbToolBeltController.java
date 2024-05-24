package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import common.BaseController;
import common.Const;
import common.MessageUtils;
import common.SelectItemFactory;
import entity.DbConection;
import entity.PrmIF;
import entity.ProjectIF;
import entity.SettingIF;
import factory.DataFactory;
import gateway.PrmGateway;
import gateway.ProjectGateway;
import gateway.TableGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.faces.model.SelectItem;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.Writer;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import jp.co.enecom.ma_tanaka.time.MtDate;
import lombok.Getter;
import lombok.Setter;
import model.DbTableColumnModel;
import model.TableModel;
import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.QuoteMode;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.primefaces.shaded.commons.io.FilenameUtils;

@Named
@SessionScoped
public class DbToolBeltController extends BaseController {

    private final String SRC_ID = "DBTOOLS";

    @Getter
    @Setter
    private String tableTarget;

    @Getter
    @Setter
    private BigDecimal record = BigDecimal.ZERO;

    @Getter
    @Setter
    private boolean settingDefault = false;

    @Getter
    @Setter
    private boolean autoFullsize = false;

    @Getter
    @Setter
    private boolean autoFillMaxLength = false;

    @Getter
    private SelectItem[] tableItems = null;

    @Getter
    private SelectItem[] settingItems = null;

    @Getter
    private SelectItem[] randomItems = null;

    @Getter
    private List<DbTableColumnModel> columns;

    @Inject
    private ProjectGateway projectGateway;

    @Inject
    private TableGateway tableGateway;

    @Inject
    private PrmGateway prmGateway;

    private Map<String, Object> columnHistorySetting = new HashMap<>();

    private Map<String, Object> columnFullSizeSetting = new HashMap<>();

    public boolean getDisable() {
        return StringUtils.isBlank(tableTarget);
    }

    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }

        getSession().put(C_SESSION_KEY_SCR, SRC_ID);
        return Const.SCR_INFO.get(SRC_ID);
    }

    /**
     * init data
     *
     * @return @throws Exception
     */
    private boolean initData() throws Exception {

        try {

            clearData();

            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

            tableTarget = this.<String>getScrFromSession(SRC_ID, "pTblPhysical");

            ProjectIF projectInfo = projectGateway.GetById(wProjectId);
            DbConection dbConection = projectInfo.getDbConnection();

            final Map<String, String> properties = new HashMap<String, String>() {
                {
                    put(EntityManagerProperties.JDBC_URL, dbConection.getDbUrl());
                    put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                    put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                }
            };

            try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties);
                    EntityManager manager = emf.createEntityManager()) {

                List<TableModel> tables = new ArrayList<>();
                tableGateway.GetTables(manager, dbConection.getDbSchema()).stream()
                        .forEach(wRow -> {
                            TableModel model = new TableModel();
                            try {
                                Map<String, Object> row = new HashMap<>();

                                for (Map.Entry entry : wRow.entrySet()) {
                                    row.put(((Object) entry.getKey()).toString(), entry.getValue());
                                }

                                BeanUtils.populate(model, row);

                                model.setProject_id(wProjectId);
                                tables.add(model);
                            } catch (Exception e) {
                                addErrorMsg(MessageUtils.getMessage("E0001"));
                            }
                        });

                tableItems = SelectItemFactory.INSTANCE.create(tables, true,
                        (tableIf) -> tableIf.getPhysical(),
                        (tableIf) -> StringUtils.join(tableIf.getPhysical(), "【", tableIf.getLogical(), "】"));

            }

            List<PrmIF> settings = prmGateway.GetPrms(Const.OPTION_SETTING).stream().collect(Collectors.toList());

            settingItems = SelectItemFactory.INSTANCE.create(settings, true,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

            List<PrmIF> randoms = prmGateway.GetPrms(Const.OPTION_RANDOM).stream().collect(Collectors.toList());

            randomItems = SelectItemFactory.INSTANCE.create(randoms, true,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

            if (StringUtils.isNotBlank(tableTarget)) {
                load();
            }
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    /**
     * perform load column info according table target
     */
    public void load() {

        columns = new ArrayList<>();
        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

            ProjectIF projectInfo = projectGateway.GetById(wProjectId);
            DbConection dbConection = projectInfo.getDbConnection();
            final Map<String, String> properties = new HashMap<String, String>() {
                {
                    put(EntityManagerProperties.JDBC_URL, dbConection.getDbUrl());
                    put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                    put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                }
            };

            try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); 
                    EntityManager manager = emf.createEntityManager()) {

                // Retrieve all tables
                tableGateway.GetTableColumns(manager, dbConection.getDbSchema(), tableTarget).stream()
                        .forEach(wRow -> {
                            DbTableColumnModel model = new DbTableColumnModel();
                            try {
                                Map<String, Object> row = new HashMap<>();

                                for (Map.Entry entry : wRow.entrySet()) {
                                    row.put(((Object) entry.getKey()).toString(), entry.getValue());
                                }

                                BeanUtils.populate(model, row);

                                columns.add(model);
                            } catch (Exception e) {
                                addErrorMsg(MessageUtils.getMessage("E0001"));
                            }
                        });

            }

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    /**
     * perform click back
     *
     * @return
     */
    public String back() {
        return redirect(getBackScr((String) getSession().get(C_SESSION_KEY_SCR)));
    }

    public void handleChangeDefault() {
        try {

            if (settingDefault) {
                Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

                Optional<SettingIF> settingOtp = projectGateway.GetColumnHistory(wProjectId);

                settingOtp.ifPresent(setting -> {
                    try {
                        ObjectMapper mapper = new ObjectMapper();
                        columnHistorySetting = mapper.readValue(setting.getSetting(), Map.class);
                    } catch (JsonProcessingException e) {
                        addErrorMsg(e.getMessage());
                    }
                });

                int maxLengthCheck = Integer.parseInt(columnFullSizeSetting.getOrDefault("max_length_default", "31").toString());
                for (DbTableColumnModel columnModel : columns) {
                    columnModel.setSetting(Const.Setting.RANDOM);

                    if (columnModel.isNumeric()) {
                        columnModel.setRandom(Const.Random.NUM);
                        columnModel.setDisable_random(true);
                        columnModel.setDisable_param(true);
                        columnModel.setDisable_fixed(true);
                        columnModel.setDisable_sequence(true);
                    } else if (columnModel.isDateTime() && !columnHistorySetting.containsKey(columnModel.getPhysical())) {
                        columnModel.setRandom(Const.Random.NUM);
                        columnModel.setDisable_random(true);
                        columnModel.setDisable_param(false);
                        columnModel.setDisable_fixed(true);
                        columnModel.setDisable_sequence(true);
                    } else if (!columnHistorySetting.containsKey(columnModel.getPhysical())) {
                        columnModel.setRandom(Const.Random.ALPHA_NUM);
                        columnModel.setDisable_random(false);
                        columnModel.setDisable_param(false);
                        columnModel.setDisable_fixed(true);
                        columnModel.setDisable_sequence(true);

                        if (StringUtils.isNotBlank(columnModel.getMax_length())) {
                            if (Integer.parseInt(columnModel.getMax_length()) > maxLengthCheck) {
                                columnModel.setSetting(Const.Setting.DEF);
                                columnModel.setFixed(columnModel.getLogical());
                                columnModel.setDisable_random(true);
                                columnModel.setDisable_fixed(false);
                                columnModel.setDisable_sequence(false);
                                columnModel.setRandom(StringUtils.EMPTY);
                            }
                        }
                    } else if (columnHistorySetting.containsKey(columnModel.getPhysical())) {
                        columnModel.setSetting(Const.Setting.FIX);
                        columnModel.setDisable_random(true);
                        columnModel.setDisable_param(true);
                        columnModel.setDisable_fixed(false);
                        columnModel.setFixed((String) columnHistorySetting.getOrDefault(columnModel.getPhysical(), StringUtils.EMPTY));

                    }
                }
            }
        } catch (Exception e) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    public void handleFillMaxLength() {
        try {

            if (autoFillMaxLength) {
                for (DbTableColumnModel columnModel : columns) {
                    if (columnModel.isCharacter()) {
                        columnModel.setFillMaxlength(autoFillMaxLength);
                    }
                }
            }
        } catch (Exception e) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    /**
     * perform click execute
     *
     * @return
     */
    public String exec() {
        Path wTempFolderPath = null;
        try {

            if (!checkData()) {
                addErrorMsg(MessageUtils.getMessage("E0002"));
                return null;
            }

            String wSystemDate = MtDate.now().format(Const.DateFormat.None.DATETIME);
            wTempFolderPath = Files.createTempDirectory(wSystemDate);
            int wStart = 0;

            String[] csvHeader = columns.stream()
                    .map(column -> column.getPhysical())
                    .toArray(String[]::new);

            while (wStart < record.intValue()) {
                int wEnd = Math.min(wStart + Const.DEFAULT_MAX_RECORD_OF_FILE, record.intValue());

                String wFilename = StringUtils.join(tableTarget, "「", wStart + 1, "～", wEnd, "」.", Const.Extension.CSV);

                Path csvFilePath = Paths.get(wTempFolderPath.toString(), wFilename);
                try (Writer writer = Files.newBufferedWriter(csvFilePath);) {

                    CSVPrinter wPrinter = new CSVPrinter(writer, CSVFormat.DEFAULT.withHeader(csvHeader).withQuoteMode(QuoteMode.NON_NUMERIC));

                    for (int i = wStart; i < wEnd; i++) {
                        final int index = i + 1;
                        List<Object> wDataGenerated = new ArrayList<>();

                        for (DbTableColumnModel model : columns) {
                            Map<String, Object> params = new HashMap<>();
                            params.put("rowNum", index);
                            params.put("column_name", model.getPhysical());
                            params.put("data_type", model.getData_type());
                            params.put("setting", model.getSetting());
                            params.put("random", model.getRandom());
                            params.put("param", model.getParam());
                            params.put("fixed", model.getFixed());
                            params.put("sequence", model.getSequence());

                            if (model.isNumeric()) {
                                params.put("numeric", new HashMap<String, Object>() {
                                    {
                                        params.put("precision", model.getNumeric_precision());
                                        params.put("scale", model.getNumeric_scale());
                                    }
                                });
                            }

                            if (model.isCharacter()) {
                                int maxLengthCheck = Integer.parseInt(columnFullSizeSetting.getOrDefault("max_length_default", "31").toString());
                                Map<String, Object> value = new HashMap<>();
                                params.put("character", value);
                                value.put("fill_max_length", model.isFillMaxlength());
                                value.put("max_length", Integer.valueOf(model.getMax_length()));

                                if (StringUtils.isNotBlank(model.getMax_length())) {
                                    if (Integer.parseInt(model.getMax_length()) > maxLengthCheck) {
                                        value.put("full_size", autoFullsize);
                                    }
                                }
                            }

                            if (model.isDateTime()) {
                                params.put("datetime", new HashMap<String, Object>());
                            }

                            wDataGenerated.add(DataFactory.INSTANCE.perform(params));
                        }

                        wPrinter.printRecord(wDataGenerated.stream().toArray());
                    }
                }
                wStart = wEnd;
            }

            FacesContext wContext = FacesContext.getCurrentInstance();
            ExternalContext wExternalContext = wContext.getExternalContext();

            HttpServletResponse wResponse = (HttpServletResponse) wExternalContext.getResponse();
            wResponse.reset();

            if ((wStart - Const.DEFAULT_MAX_RECORD_OF_FILE) > 0) {
                File fileZip = new File(wTempFolderPath.toFile(), tableTarget);
                ZipFile wZipFile = new ZipFile(fileZip);
                wZipFile.setCharset(Charset.forName("MS932"));

                Files.walk(wTempFolderPath)
                        .filter(Files::isRegularFile)
                        .filter(wPath -> "CSV".equals(FilenameUtils.getExtension(wPath.toString()).toUpperCase()))
                        .forEach((Path wPath) -> {
                            try {
                                ZipParameters wZipParameter = new ZipParameters();
                                wZipParameter.setFileNameInZip(wPath.toFile().getName());
                                wZipFile.addFile(wPath.toFile(), wZipParameter);
                            } catch (ZipException ex) {
                                addErrorMsg(MessageUtils.getMessage("E0001"));
                            }
                        });

                wResponse.setContentType("application/zip");
                wResponse.setHeader("Content-Disposition",
                        StringUtils.join("attachment;filename=", URLEncoder.encode(tableTarget + ".zip", "UTF-8")));
                wResponse.getOutputStream().write(Files.readAllBytes(fileZip.toPath()));
                wContext.responseComplete();
            } else {
                Path fileTarget = Files.walk(wTempFolderPath).filter(Files::isRegularFile).findFirst().get();

                wResponse.setContentType("text/csv");
                wResponse.setHeader("Content-Disposition", StringUtils.join("attachment;filename=", URLEncoder.encode(tableTarget + ".csv", "UTF-8")));
                wResponse.getOutputStream().write(Files.readAllBytes(fileTarget));
                wContext.responseComplete();
            }
        } catch (Exception e) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        } finally {
            try {
                if (wTempFolderPath != null) {
                    FileUtils.deleteDirectory(wTempFolderPath.toFile());
                }
            } catch (Exception e) {
                addErrorMsg(MessageUtils.getMessage("E0001"));
            }
        }

        return null;
    }

    public void clear() {
        clearData();
    }

    /**
     * select option setting change
     */
    public void settingOptsChange() {

        FacesContext context = ctx().facesContext();

        DbTableColumnModel currentItem = context.getApplication().evaluateExpressionGet(context, "#{item}", DbTableColumnModel.class);

        if (Objects.nonNull(currentItem)) {
            currentItem.setDisable_random(true);
            currentItem.setDisable_param(true);
            currentItem.setDisable_fixed(StringUtils.isNotBlank(currentItem.getSetting()));
            currentItem.setDisable_sequence(StringUtils.isNotBlank(currentItem.getSetting()));

            switch (currentItem.getSetting()) {
                case Const.Setting.DEF -> {
                    currentItem.setFixed(currentItem.getLogical());
                    currentItem.setRandom(StringUtils.EMPTY);
                    currentItem.setDisable_random(true);
                    currentItem.setDisable_fixed(false);
                    currentItem.setDisable_sequence(false);
                }
                case Const.Setting.SEQ -> {
                    currentItem.setDisable_fixed(false);
                    currentItem.setDisable_sequence(false);
                }
                case Const.Setting.FIX -> {
                    currentItem.setDisable_fixed(false);
                }
                case Const.Setting.RANDOM -> {
                    if (currentItem.isNumeric()) {
                        currentItem.setDisable_random(true);
                        currentItem.setRandom(Const.Random.NUM);

                    } else {
                        currentItem.setDisable_random(currentItem.isDateTime());
                    }

                    currentItem.setDisable_param(Const.Random.NUM.equals(currentItem.getRandom()));
                }
                case Const.Setting.RANGE -> {
                    currentItem.setRandom(StringUtils.EMPTY);
                    currentItem.setDisable_param(false);
                }
            }
        }
    }

    /**
     * select option random change
     */
    public void randomOptsChange() {

        FacesContext context = ctx().facesContext();

        DbTableColumnModel currentItem = context.getApplication().evaluateExpressionGet(context, "#{item}", DbTableColumnModel.class);

        if (Objects.nonNull(currentItem)) {
            currentItem.setDisable_param(!Const.Random.NUM.equals(currentItem.getRandom()));
        }
    }

    private boolean checkData() {
        return true;
    }

    private void clearData() {
        columns = new ArrayList<>();

        record = null;
        tableTarget = "";
        settingDefault = false;
        autoFullsize = false;
        autoFillMaxLength = false;

    }

    public boolean getDisplayExec() {
        return StringUtils.isNotBlank(tableTarget);
    }
}
