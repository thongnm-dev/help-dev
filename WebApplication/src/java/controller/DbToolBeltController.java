package controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import common.SelectItemFactory;
import entity.DbConection;
import entity.PrmIF;
import entity.ProjectIF;
import entity.TableIF;
import factory.DataFactory;
import gateway.PrmGateway;
import gateway.ProjectGateway;
import gateway.TableColumnGateway;
import gateway.TableGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.context.FacesContext;
import jakarta.faces.model.SelectItem;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;
import jp.co.enecom.ma_tanaka.time.MtDate;
import lombok.Getter;
import lombok.Setter;
import model.DbTableColumnModel;
import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.primefaces.shaded.commons.io.FilenameUtils;

@Named
@SessionScoped
public class DbToolBeltController extends BaseController {

    private final String SRC_ID = "DBTOOLS";

    @Getter
    @Setter
    private BigDecimal record = null;

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

    @Getter
    @Setter
    private String tableTarget;

    @Inject
    private TableGateway tableGateway;

    @Inject
    private TableColumnGateway tblColumnGateway;

    @Inject
    private PrmGateway prmGateway;
    
    @Getter
    private StreamedContent fileDownload;
    
    public boolean getDisable() {
        return StringUtils.isBlank(tableTarget);
    }

    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }

        return Const.SCR_INFO.get(SRC_ID);
    }

    /**
     * init data
     * @return @throws Exception
     */
    private boolean initData() throws Exception {

        try {
            columns = new ArrayList<>();

            tableTarget = "";

            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

            List<TableIF> tables = tableGateway.GetTables(wProjectId).stream().collect(Collectors.toList());

            tableItems = SelectItemFactory.INSTANCE.create(tables, true,
                    (tableIf) -> tableIf.getPhysical(),
                    (tableIf) -> StringUtils.join(tableIf.getPhysical(), "【", tableIf.getLogical(), "】"));

            List<PrmIF> settings = prmGateway.GetPrms(Const.OPTION_SETTING).stream().collect(Collectors.toList());

            settingItems = SelectItemFactory.INSTANCE.create(settings, true,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

            List<PrmIF> randoms = prmGateway.GetPrms(Const.OPTION_RANDOM).stream().collect(Collectors.toList());

            randomItems = SelectItemFactory.INSTANCE.create(randoms, true,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

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
                    put(EntityManagerProperties.JDBC_URL, dbConection.getDbHost());
                    put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                    put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                }
            };

            try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); EntityManager manager = emf.createEntityManager()) {

                // Retrieve all tables
                tblColumnGateway.GetTableColumns(manager, dbConection.getDbSchema(), tableTarget).stream()
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
     * @return 
     */
    public String back() {
        return redirect(getBackScr((String) getSession().get(C_SESSION_KEY_SCR)));
    }

    /**
     * perform click execute
     * @return 
     */
    public String exec() {
        Path wTempFolderPath = null;
        try {

            if (!checkData()) {
                addErrorMsg(MessageUtils.getMessage("E0002"));
                return null;
            }
            String wSystemDate = MtDate.now().format(Const.DateFormat.DATETIME_FORMAT);
            wTempFolderPath = Files.createTempDirectory(wSystemDate);
            int wStart = 0;

            List<String> csvHeader = columns.stream()
                    .map(column -> column.getPhysical())
                    .toList();

            while (wStart < record.intValue()) {
                int wEnd = Math.min(wStart + Const.DEFAULT_MAX_RECORD_OF_FILE, record.intValue());

                String wFilename = StringUtils.join(tableTarget, "「", wStart + 1, "～", wEnd, "」.", Const.Extension.CSV);

                Path csvFilePath = Paths.get(wTempFolderPath.toString(), wFilename);
                try (Writer writer = Files.newBufferedWriter(csvFilePath);) {

                    CSVPrinter wPrinter = new CSVPrinter(writer, CSVFormat.DEFAULT.withHeader(StringUtils.join(csvHeader, ",")));

                    for (int i = wStart; i < wEnd; i++) {
                        final int index = i;
                        List<String> wDataGenerated = new ArrayList<>();

                        for (DbTableColumnModel model : columns) {
                            Map<String, Object> params = new HashMap<>();
                            params.put("no", index);
                            params.put("column_name", model.getPhysical());
                            params.put("data_type", model.getData_type());
                            params.put("setting", model.getSetting());
                            params.put("random", model.getRandom());
                            params.put("param", model.getParam());
                            params.put("ref", model.getRef());
                            params.put("sequence", model.getIncre());

                            wDataGenerated.add(DataFactory.INSTANCE.perform(params));
                        }

                        wPrinter.printRecord(StringUtils.join(wDataGenerated, ","));
                    }
                }
                wStart = wEnd;
            }

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

                InputStream stream = Files.newInputStream(fileZip.toPath());

                fileDownload = DefaultStreamedContent.builder()
                                    .name(tableTarget)
                                    .contentType("application/zip")
                                    .stream(() -> stream)
                                    .build();
            } else {
                Path fileTarget = Files.walk(wTempFolderPath).filter(Files::isRegularFile).findFirst().get();
                InputStream stream = Files.newInputStream(fileTarget);
                fileDownload = DefaultStreamedContent.builder()
                                    .name(tableTarget)
                                    .contentType("text/csv")
                                    .stream(() -> stream)
                                    .build();
                        
            }

        } catch (Exception e) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        } finally {
            if (wTempFolderPath != null) {
                try {
                    Files.delete(wTempFolderPath);
                } catch (IOException ex) {
                    addErrorMsg(MessageUtils.getMessage("E0001"));
                }
            }
        }

        return null;
    }

    /**
     * select option setting change
     */
    public void settingOptsChange() {

        FacesContext context = ctx().facesContext();

        DbTableColumnModel currentItem = context.getApplication().evaluateExpressionGet(context, "#{item}", DbTableColumnModel.class);

        if (Objects.nonNull(currentItem)) {
            currentItem.setDisable_random_otp(true);
            currentItem.setDisable_param(true);
            currentItem.setDisable_ref(StringUtils.isNotBlank(currentItem.getSetting()));
            currentItem.setDisable_incre(StringUtils.isNotBlank(currentItem.getSetting()));

            switch (currentItem.getSetting()) {
                case Const.Setting.SEQ -> {
                    currentItem.setDisable_ref(false);
                    currentItem.setDisable_incre(false);
                }
                case Const.Setting.FIX -> {
                    currentItem.setDisable_ref(false);
                }
                case Const.Setting.RANDOM -> {
                    if (currentItem.isNumeric()) {
                        currentItem.setDisable_random_otp(true);
                        currentItem.setRandom(Const.Random.NUM);
                    } else {
                        currentItem.setDisable_random_otp(currentItem.isDate());
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
    
    public boolean checkData() {
        return true;
    }
}
