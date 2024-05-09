package Controller;

import common.BaseController;
import common.BaseLazyDataModel;
import common.Const;
import common.MessageUtils;
import gateway.TableGateway;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import lombok.Getter;
import lombok.Setter;
import entity.TableIF;
import java.util.HashMap;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.apache.commons.lang3.StringUtils;
import org.primefaces.model.LazyDataModel;

@Named
@SessionScoped
public class TableController extends BaseController {

    private final String SRC_TABLE = "TABLE";

    private final String SRC_TABLE_DTL = "TABLE_DTL";

    @Getter
    @Setter
    private String target = "0";

    private List<TableIF> tables = null;

    @Inject
    private TableGateway tableGateway;

    private LazyDataModel<TableIF> items;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    public LazyDataModel<TableIF> getItems() {
        return !canSearch ? items : items == null ? items = new BaseLazyDataModel(tables) : items;
    }

    public String initTable() throws Exception {

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

            tables = tableGateway.GetTables(wProjectId).stream().collect(Collectors.toList());
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public void search() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_DTL, "pProjectId");

            if (StringUtils.equals(Const.TABLE_FROM_LAYOUT, target)) {
                tables = tableGateway.GetTables(wProjectId).stream().collect(Collectors.toList());
            } else {

                final Map<String, String> properties = new HashMap<String, String>() {
                    {
                        put("jakarta.persistence.provider", "org.eclipse.persistence.jpa.PersistenceProvider");
                        put("jakarta.persistence.jdbc.driver", "org.postgresql.Driver");
                        put("jakarta.persistence.jdbc.url", "jdbc:postgresql://192.168.10.64:5432/ESS");
                        put("jakarta.persistence.jdbc.user", "mowner01");
                        put("jakarta.persistence.jdbc.password", "mowner01");
                    }
                };

                EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit", properties);
                EntityManager manager = emf.createEntityManager();

                // Retrieve all tables
                tables = tableGateway.GetTables(manager, "essnewmoela").stream().collect(Collectors.toList());

                manager.close();
                emf.close();
            }

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    public String showDetail(TableIF table) {

        return redirect(Const.SCR_INFO.get("TABLE_DTL"));
    }
}
