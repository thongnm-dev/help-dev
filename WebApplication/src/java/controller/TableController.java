package controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import common.SelectItemFactory;
import entity.DbConection;
import entity.PrmIF;
import entity.ProjectIF;
import entity.TableColumnIF;
import gateway.TableGateway;
import java.util.List;
import java.util.Map;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import lombok.Getter;
import lombok.Setter;
import entity.TableIF;
import gateway.PrmGateway;
import gateway.ProjectGateway;
import jakarta.faces.model.SelectItem;
import java.util.HashMap;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.stream.Collectors;
import model.TableColumnModel;
import model.TableModel;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeMap;
import org.modelmapper.config.Configuration;
import org.primefaces.PrimeFaces;

@Named
@SessionScoped
public class TableController extends BaseController {

    private final String SRC_TABLE = "TABLE";

    private final String SRC_TABLE_COL = "TABLE_COL";

    @Getter
    @Setter
    private String target = "0";

    @Getter
    private String tableName;

    @Getter
    private String tableLogical;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    private SelectItem[] targeItems = null;

    @Getter
    private SelectItem[] sqlItems = null;

    @Getter
    @Setter
    private List<String> selectedSqls = new ArrayList<>();

    @Getter
    private List<TableModel> tables = null;

    @Getter
    @Setter
    private TableModel selection = null;

    @Getter
    private List<TableColumnModel> columns = null;

    @Inject
    private TableGateway tableGateway;

    @Inject
    private ProjectGateway projectGateway;

    @Inject
    private PrmGateway prmGateway;
        
    @Getter
    private List<ColumnModel> columnsLayout = null;
    
    @Getter
    private List<ColumnModel> columnsDDL = null;

    /**
     *
     * @return @throws Exception
     */
    public String initTable() throws Exception {

        columns = new ArrayList<>();
        target = "0";
        if (!initDataTable()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_TABLE));
        }

        getSession().put(C_SESSION_KEY_SCR, SRC_TABLE);
        return Const.SCR_INFO.get(SRC_TABLE);
    }

    /**
     *
     * @return
     */
    public String initColumn() {

        tables = new ArrayList<>();
        if (!initDataColumn()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_TABLE_COL));
        }

        getSession().put(C_SESSION_KEY_SCR, SRC_TABLE_COL);
        return Const.SCR_INFO.get(SRC_TABLE_COL);
    }

    /**
     *
     * @return @throws Exception
     */
    private boolean initDataTable() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_COL, "pProjectId");

            tables = new ArrayList<>();

            ModelMapper modelMapper = new ModelMapper();
            TypeMap<TableIF, TableModel> typeMap = modelMapper.createTypeMap(TableIF.class, TableModel.class);

            tables = tableGateway.GetTables(wProjectId).stream()
                    .map(wRow -> typeMap.map(wRow))
                    .collect(Collectors.toList());

            List<PrmIF> targets = prmGateway.GetPrms(Const.OPTION_TARGET).stream().collect(Collectors.toList());

            targeItems = SelectItemFactory.INSTANCE.create(targets, false,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

            List<PrmIF> sqls = prmGateway.GetPrms(Const.OPTION_SQL).stream().collect(Collectors.toList());

            sqlItems = SelectItemFactory.INSTANCE.create(sqls, false,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    /**
     * Retrieve data from db
     */
    public void search() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_COL, "pProjectId");
            tables = new ArrayList<>();
            if (StringUtils.equals(Const.TABLE_FROM_LAYOUT, target)) {
                ModelMapper modelMapper = new ModelMapper();
                modelMapper.getConfiguration().setFieldAccessLevel(Configuration.AccessLevel.PUBLIC);

                TypeMap<TableIF, TableModel> typeMap = modelMapper.createTypeMap(TableIF.class, TableModel.class);

                tables = tableGateway.GetTables(wProjectId).stream()
                        .map(wRow -> typeMap.map(wRow))
                        .collect(Collectors.toList());
            } else {

                ProjectIF projectInfo = projectGateway.GetById(wProjectId);
                DbConection dbConection = projectInfo.getDbConnection();
                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, dbConection.getDbUrl());
                        put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                        put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                    }
                };

                try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); EntityManager manager = emf.createEntityManager()) {

                    // Retrieve all tables
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
                }

            }

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    /**
     *
     * @param table
     * @return
     */
    public String showDetail(TableModel table) {

        setScrIFToSession(SRC_TABLE_COL, "pProjectId", table.getProject_id());
        setScrIFToSession(SRC_TABLE_COL, "pTarget", target);
        setScrIFToSession(SRC_TABLE_COL, "pTableId", table.getId());
        setScrIFToSession(SRC_TABLE_COL, "pTblPhysical", table.getPhysical());
        setScrIFToSession(SRC_TABLE_COL, "pTblLogical", table.getLogical());

        setBackScreenIdToSession(SRC_TABLE_COL, Const.SCR_INFO.get(SRC_TABLE));

        return redirect(Const.SCR_INFO.get(SRC_TABLE_COL));
    }

    /**
     *
     * @return @throws Exception
     */
    private boolean initDataColumn() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_COL, "pProjectId");
            String wTarget = this.<String>getScrFromSession(SRC_TABLE_COL, "pTarget");
            String wTblPhysical = this.<String>getScrFromSession(SRC_TABLE_COL, "pTblPhysical");

            tableName = wTblPhysical;
            tableLogical = this.<String>getScrFromSession(SRC_TABLE_COL, "pTblLogical");

            columns = new ArrayList<>();
            if (StringUtils.equals(Const.TABLE_FROM_LAYOUT, wTarget)) {
                ModelMapper modelMapper = new ModelMapper();
                TypeMap<TableColumnIF, TableColumnModel> typeMap = modelMapper.createTypeMap(TableColumnIF.class, TableColumnModel.class);

                columns = tableGateway.GetTableColumns(wProjectId, tableName).stream()
                        .map(wRow -> typeMap.map(wRow))
                        .collect(Collectors.toList());
            } else {

                ProjectIF projectInfo = projectGateway.GetById(wProjectId);
                DbConection dbConection = projectInfo.getDbConnection();
                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, dbConection.getDbUrl());
                        put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                        put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                    }
                };

                try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); EntityManager manager = emf.createEntityManager()) {

                    // Retrieve all tables
                    tableGateway.GetTableColumns(manager, dbConection.getDbSchema(), wTblPhysical).stream()
                            .forEach(wRow -> {
                                TableColumnModel model = new TableColumnModel();
                                try {
                                    Map<String, Object> row = new HashMap<>();

                                    for (Map.Entry entry : wRow.entrySet()) {
                                        row.put(((Object) entry.getKey()).toString(), entry.getValue());
                                    }

                                    BeanUtils.populate(model, row);

                                    columns.add(model);
                                } catch (Exception e) {
                                    System.out.println("Controller.TableController.search()");
                                }
                            });

                }
            }

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }

        return true;
    }

    /**
     * back
     *
     * @return
     */
    public String back() {
        return redirect(getBackScr((String) getSession().get(C_SESSION_KEY_SCR)));
    }

    /**
     * exec
     */
    public void exec() {

    }

    /**
     * ShowForm
     *
     * @param url
     * @return
     */
    public String ShowForm(String url) {

        Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_COL, "pProjectId");
        String wScrUrl = Const.SCR_INFO.get(url);

        setScrIFToSession(url, "pProjectId", wProjectId);
        setScrIFToSession(url, "pTarget", target);
        setScrIFToSession(url, "pTableId", selection.getId());
        setScrIFToSession(url, "pTblPhysical", selection.getPhysical());
        setScrIFToSession(url, "pTblLogical", selection.getLogical());

        setBackScreenIdToSession(url, Const.SCR_INFO.get(SRC_TABLE));

        return redirect(wScrUrl);
    }

    public void compare() {
        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_COL, "pProjectId");

            Map<String, Object> fromLayout = new LinkedHashMap<>();
            tableGateway.GetTableColumns(wProjectId, selection.getPhysical())
                    .stream()
                    .forEach(wRow -> {
                        fromLayout.put(wRow.getPhysical(), wRow.getData_type());
                    });

            ProjectIF projectInfo = projectGateway.GetById(wProjectId);
            DbConection dbConection = projectInfo.getDbConnection();
            final Map<String, String> properties = new HashMap<String, String>() {
                {
                    put(EntityManagerProperties.JDBC_URL, dbConection.getDbUrl());
                    put(EntityManagerProperties.JDBC_USER, dbConection.getDbUsr());
                    put(EntityManagerProperties.JDBC_PASSWORD, dbConection.getDbPass());
                }
            };

            Map<String, Object> fromDDL = new LinkedHashMap<>();
            try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties);
                    EntityManager manager = emf.createEntityManager()) {

                tableGateway.GetTableColumns(manager, dbConection.getDbSchema(), selection.getPhysical())
                        .stream()
                        .forEach(wRow -> {
                            fromDDL.put((String) wRow.get("physical"), wRow.get("data_type"));
                        });
            }
            
            columnsLayout = new ArrayList<>();
            columnsDDL = new ArrayList<>();
            for (Map.Entry<String, Object> entry : fromLayout.entrySet()) {
                String dataTypeFromDDL = (String) fromDDL.getOrDefault(entry.getKey(), StringUtils.EMPTY);
                String dataTypeFromLayout = (String) entry.getValue();
                if (StringUtils.contains((String) entry.getValue(), "varchar")) {
                    dataTypeFromLayout = StringUtils.replace(dataTypeFromLayout, "varchar", "character varying");
                }
                
                ColumnModel modelLayout = new ColumnModel() {
                    {
                        setColumnName(entry.getKey());
                        setDataType((String) entry.getValue());
                    }
                };
                
                ColumnModel modelDDL = new ColumnModel() {
                    {
                        setColumnName(entry.getKey());
                        setDataType((String) entry.getValue());
                    }
                };
                modelLayout.setNotMatched(!StringUtils.equals(dataTypeFromDDL, dataTypeFromLayout));
                modelDDL.setNotMatched(!StringUtils.equals(dataTypeFromDDL, dataTypeFromLayout));
                columnsLayout.add(modelLayout);
                columnsDDL.add(modelDDL);                
            }
            
            if (columnsLayout.stream().anyMatch(row -> row.isNotMatched())) {
                PrimeFaces.current().executeScript("PF('dialogResult').show()");
            }
        } catch (Exception e) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }
    
    @Getter
    @Setter
    public class ColumnModel {
        private boolean notMatched; 
        private String columnName;
        private String dataType;
    }
}
