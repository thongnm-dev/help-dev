package Controller;

import common.BaseController;
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
import jakarta.faces.context.FacesContext;
import jakarta.faces.model.DataModel;
import java.util.HashMap;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.stream.Collectors;
import model.TableModel;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.persistence.config.EntityManagerProperties;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeMap;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortMeta;
import org.primefaces.model.FilterMeta;
import org.primefaces.model.filter.FilterConstraint;
import org.primefaces.util.LocaleUtils;

@Named
@SessionScoped
public class TableController extends BaseController {

    private final String SRC_TABLE = "TABLE";

    private final String SRC_TABLE_DTL = "TABLE_DTL";

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
        return !canSearch ? items : items == null ? items = new LazyDataModel<TableModel>() {
            @Override
            public int count(Map<String, FilterMeta> filterBy) {
                return (int) tables.stream().filter(row -> filter(ctx().facesContext(), filterBy.values() ,row)).count();
            }

            @Override
            public List<TableModel> load(int pFirst, int pPageSize, Map<String, SortMeta> sort, Map<String, FilterMeta> filter) {
                List<TableModel> wResultList = tables.stream()
                        .skip(pFirst)
                        .filter(row -> filter(ctx().facesContext(), filter.values() ,row))
                        .limit(pPageSize)
                        .collect(Collectors.toList());

                return wResultList;
            }

            private boolean filter(FacesContext context, Collection<FilterMeta> filterBy, TableModel model) {
                boolean matching = true;

                for (FilterMeta filter : filterBy) {
                    FilterConstraint constraint = filter.getConstraint();
                    Object filterValue = filter.getFilterValue();

                    try {

                        Field field = model.getClass().getDeclaredField(filter.getField());
                        field.setAccessible(true);
                        
                        matching = constraint.isMatching(context, field.get(model), filterValue, LocaleUtils.getCurrentLocale());
                    } catch (Exception e) {
                        matching = false;
                    }

                    if (!matching) {
                        break;
                    }
                }

                return matching;

            }
        } : items;
    }

    public String initTable() throws Exception {

        tables = new ArrayList<>();
        target = "0";
        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_TABLE));
        }

        return Const.SCR_INFO.get(SRC_TABLE);
    }

    public String initTableDtl() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_TABLE_DTL));
        }

        return Const.SCR_INFO.get(SRC_TABLE_DTL);
    }

    private boolean initData() throws Exception {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_DTL, "pProjectId");

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

    public void search() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_DTL, "pProjectId");
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
                        put(EntityManagerProperties.JDBC_URL, "jdbc:postgresql://localhost:5432/dev");
                        put(EntityManagerProperties.JDBC_USER, "beuser");
                        put(EntityManagerProperties.JDBC_PASSWORD, "admin@123");
                        put("eclipselink.jdbc.bind-parameters", "false");
                    }
                };

                EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnit", properties);
                EntityManager manager = emf.createEntityManager(properties);

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

        return redirect(Const.SCR_INFO.get("TABLE_DTL"));
    }
}
