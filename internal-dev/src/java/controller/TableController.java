package Controller;

import common.BaseController;
import common.BaseLazyDataModel;
import common.Const;
import common.MessageUtils;
import gateway.TableGateway;
import java.util.List;
import java.util.Map;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import lombok.Getter;
import lombok.Setter;
import entity.TableIF;
import jakarta.faces.model.DataModel;
import java.util.HashMap;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import model.TableModel;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeMap;

@Named
@SessionScoped
public class TableController extends BaseController {

    private final String SRC_TABLE = "TABLE";

    private final String SRC_TABLE_COL = "TABLE_COL";

    @Getter
    @Setter
    private String target = "0";

    private List<TableModel> tables = null;

    @Inject
    private TableGateway tableGateway;

    private DataModel<TableModel> items;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    public DataModel<TableModel> getItems() {
        return !canSearch ? items : items == null ? items = new BaseLazyDataModel(tables) : items;
    }

    public String init() throws Exception {

        tables = new ArrayList<>();
        target = "0";
        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_TABLE));
        }

        return Const.SCR_INFO.get(SRC_TABLE);
    }

    private boolean initData() throws Exception {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_COL, "pProjectId");

            tables = new ArrayList<>();
            ModelMapper modelMapper = new ModelMapper();

            tableGateway.GetTables(wProjectId).stream()
                    .forEach(wRow -> {

                        TypeMap<TableIF, TableModel> typeMap = modelMapper.typeMap(TableIF.class, TableModel.class);

                        typeMap.addMappings(mapper -> {
                            mapper.map(table -> table.getId(), TableModel::setId);
                            mapper.map(table -> table.getPhysical(), TableModel::setPhysical);
                            mapper.map(table -> table.getLogical(), TableModel::setLogical);
                            mapper.map(table -> table.getLogicalVn(), TableModel::setLogical_v);
                            mapper.map(table -> table.getProject().getId(), TableModel::setProjectId);
                        });

                        tables.add(typeMap.map(wRow));
                    });
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
                tableGateway.GetTables(wProjectId).stream()
                        .forEach(wRow -> {

                            TypeMap<TableIF, TableModel> typeMap = modelMapper.typeMap(TableIF.class, TableModel.class);

                            typeMap.addMappings(mapper -> {
                                mapper.map(table -> table.getId(), TableModel::setId);
                                mapper.map(table -> table.getPhysical(), TableModel::setPhysical);
                                mapper.map(table -> table.getLogical(), TableModel::setLogical);
                                mapper.map(table -> table.getLogicalVn(), TableModel::setLogical_v);
                                mapper.map(table -> table.getProject().getId(), TableModel::setProjectId);
                            });

                            tables.add(typeMap.map(wRow));
                        });
            } else {

                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put(EntityManagerProperties.JDBC_URL, "jdbc:postgresql://192.168.10.64:5432/ESS");
                        put(EntityManagerProperties.JDBC_USER, "mowner01");
                        put(EntityManagerProperties.JDBC_PASSWORD, "mowner01");
                        put("eclipselink.jdbc.bind-parameters", "false");
                    }
                };

                EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties);
                EntityManager manager = emf.createEntityManager();

                // Retrieve all tables
                tableGateway.GetTables(manager, "essnewmoela").stream()
                        .forEach(wRow -> {
                            TableModel model = new TableModel();
                            try {
                                Map<String, Object> row = new HashMap<>();

                                for (Map.Entry entry : wRow.entrySet()) {
                                    row.put(((Object) entry.getKey()).toString(), entry.getValue());
                                }

                                BeanUtils.populate(model, row);

                                model.setProjectId(wProjectId);
                                tables.add(model);
                            } catch (Exception e) {
                                System.out.println("Controller.TableController.search()");
                            }
                        });

                manager.close();
                emf.close();

            }
            setCanSearch(true);

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    public String showDetail(TableModel table) {

        setScrIFToSession(SRC_TABLE_COL, "pProjectId", table.getProjectId());
        setScrIFToSession(SRC_TABLE_COL, "pTarget", target);
        setScrIFToSession(SRC_TABLE_COL, "pTableId", table.getId());
        setScrIFToSession(SRC_TABLE_COL, "pTblPhysical", table.getPhysical());
        setScrIFToSession(SRC_TABLE_COL, "pTblLogical", table.getLogical());

        setBackScreenIdToSession(SRC_TABLE_COL, Const.SCR_INFO.get(SRC_TABLE));
        
        return redirect(Const.SCR_INFO.get(SRC_TABLE_COL));
    }
}
