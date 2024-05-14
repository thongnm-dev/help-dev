package Controller;

import common.BaseController;
import common.BaseLazyDataModel;
import common.Const;
import common.MessageUtils;
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
import gateway.TableColumnGateway;
import jakarta.faces.model.DataModel;
import java.util.HashMap;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.stream.Collectors;
import model.TableColumnModel;
import model.TableModel;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeMap;
import org.modelmapper.config.Configuration;

@Named
@SessionScoped
public class TableController extends BaseController {

    private final String SRC_TABLE = "TABLE";

    private final String SRC_TABLE_COL = "TABLE_COL";

    @Getter
    @Setter
    private String target = "0";

    private List<TableModel> tables = null;

    private DataModel<TableModel> tableItems;

    @Inject
    private TableGateway tableGateway;

    private List<TableColumnModel> columns = null;

    private DataModel<TableColumnModel> columnItems;

    @Inject
    private TableColumnGateway tblColumnGateway;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    @Getter
    private String tableName;

    @Getter
    private String tableLogical;

    /**
     *
     * @return
     */
    public DataModel<TableModel> getTableItems() {
        return canSearch ? tableItems = new BaseLazyDataModel(tables) : tableItems;
    }

    /**
     *
     * @return
     */
    public DataModel<TableColumnModel> getColumnItems() {
        return canSearch ? columnItems = new BaseLazyDataModel(columns) : columnItems;
    }

    /**
     *
     * @return @throws Exception
     */
    public String initTable() throws Exception {

        columns = new ArrayList<>();
        canSearch = true;
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
     * @return @throws Exception
     */
    public String initColumn() throws Exception {

        canSearch = true;
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
    private boolean initDataTable() throws Exception {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_COL, "pProjectId");

            tables = new ArrayList<>();
            
            ModelMapper modelMapper = new ModelMapper();
            TypeMap<TableIF, TableModel> typeMap = modelMapper.createTypeMap(TableIF.class, TableModel.class);

            tables = tableGateway.GetTables(wProjectId).stream()
                    .map(wRow -> typeMap.map(wRow))
                    .collect(Collectors.toList());

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

                tables =  tableGateway.GetTables(wProjectId).stream()
                        .map(wRow -> typeMap.map(wRow))
                        .collect(Collectors.toList());
            } else {

                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, "jdbc:postgresql://localhost:5432/dev");
                        put(EntityManagerProperties.JDBC_USER, "beuser");
                        put(EntityManagerProperties.JDBC_PASSWORD, "admin@123");
                        put("eclipselink.jdbc.bind-parameters", "false");
                    }
                };

                try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); 
                        EntityManager manager = emf.createEntityManager()) {

                    // Retrieve all tables
                    tableGateway.GetTables(manager, "public").stream()
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
                                    System.out.println("Controller.TableController.search()");
                                }
                            });
                }

            }
            setCanSearch(true);

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
    private boolean initDataColumn() throws Exception {

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

                columns = tblColumnGateway.GetTableColumns(wProjectId, tableName).stream()
                        .map(wRow -> typeMap.map(wRow))
                        .collect(Collectors.toList());
            } else {

                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, "jdbc:postgresql://localhost:5432/dev");
                        put(EntityManagerProperties.JDBC_USER, "beuser");
                        put(EntityManagerProperties.JDBC_PASSWORD, "admin@123");
                        put("eclipselink.jdbc.bind-parameters", "false");
                    }
                };

                try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties); 
                        EntityManager manager = emf.createEntityManager()) {

                    // Retrieve all tables
                    tblColumnGateway.GetTableColumns(manager, "public", wTblPhysical).stream()
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
            setCanSearch(true);

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }

        return true;
    }

    public String back() {
        return redirect(getBackScr((String) getSession().get(C_SESSION_KEY_SCR)));
    }
}
