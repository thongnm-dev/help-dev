package controller;

import common.BaseController;
import common.BaseLazyDataModel;
import common.Const;
import common.MessageUtils;
import entity.TableColumnIF;
import gateway.TableColumnGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.model.DataModel;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.Getter;
import lombok.Setter;
import model.TableColumnModel;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeMap;

@Named("tableColumnController")
@SessionScoped
public class TableColumnController extends BaseController {
    
    private final String SRC_ID = "TABLE_COL";
    
    @Getter
    private String tableName;
    
    @Getter
    private String tableLogical;
    
    private List<TableColumnModel> tableColumns = null;

    @Inject
    private TableColumnGateway tblColumnGateway;

    private DataModel<TableColumnModel> items;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    public DataModel<TableColumnModel> getItems() {
        return !canSearch ? items : items == null ? items = new BaseLazyDataModel(tableColumns) : items;
    }
    
    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }

        return Const.SCR_INFO.get(SRC_ID);
    }
    
    private boolean initData() throws Exception {
        
        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");
            String target = this.<String>getScrFromSession(SRC_ID, "pTarget");
            Long wTableId = this.<Long>getScrFromSession(SRC_ID, "pTableId");
            String wTblPhysical = this.<String>getScrFromSession(SRC_ID, "pTblPhysical");
            
            tableColumns = new ArrayList<>();
            if (StringUtils.equals(Const.TABLE_FROM_LAYOUT, target)) {
                ModelMapper modelMapper = new ModelMapper();
                tblColumnGateway.GetTableColumns(wProjectId, wTableId).stream()
                        .forEach(wRow -> {

                            TypeMap<TableColumnIF, TableColumnModel> typeMap = modelMapper.typeMap(TableColumnIF.class, TableColumnModel.class);

                            typeMap.addMappings(mapper -> {
                                mapper.map(tableCol -> tableCol.getId(), TableColumnModel::setId);
                                mapper.map(tableCol -> tableCol.getPhysical(), TableColumnModel::setPhysical);
                                mapper.map(tableCol -> tableCol.getLogical(), TableColumnModel::setLogical);
                                mapper.map(tableCol -> tableCol.getLogicalVn(), TableColumnModel::setLogical_v);
                            });

                            tableColumns.add(typeMap.map(wRow));
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
                tblColumnGateway.GetTableColumns(manager, "essnewmoela", wTblPhysical).stream()
                        .forEach(wRow -> {
                            TableColumnModel model = new TableColumnModel();
                            try {
                                Map<String, Object> row = new HashMap<>();

                                for (Map.Entry entry : wRow.entrySet()) {
                                    row.put(((Object) entry.getKey()).toString(), entry.getValue());
                                }

                                BeanUtils.populate(model, row);

                                tableColumns.add(model);
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
        
        return true;
    }
}