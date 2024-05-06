package Controller;

import Common.BaseController;
import Common.Const;
import Common.MessageUtils;
import Gateway.TableGateway;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.DataModel;
import javax.inject.Inject;
import javax.inject.Named;
import lombok.Getter;
import lombok.Setter;
import Model.TableIF;
import org.apache.commons.lang3.StringUtils;
import org.primefaces.model.FilterMeta;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortMeta;

@Named
@SessionScoped
public class TableController extends BaseController {

    private final String SRC_TABLE = "TABLE";

    private final String SRC_TABLE_DTL = "TABLE_DTL";
    
    @Getter
    @Setter
    private String target = "0";

    @Getter
    @Setter
    private String physical = StringUtils.EMPTY;

    @Getter
    @Setter
    private String logical = StringUtils.EMPTY;

    private List<TableIF> tables = null;

    @Inject
    private TableGateway tableGateway;

    private DataModel<TableIF> items;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    public DataModel<TableIF> getItems() {

        return !canSearch ? items : items == null ? items = new LazyDataModel<TableIF>() {
            @Override
            public int count(Map<String, FilterMeta> map) {
                return tables.size();
            }

            @Override
            public List<TableIF> load(int pFirst, int pPageSize, Map<String, SortMeta> pSortField, Map<String, FilterMeta> pFilters) {
                List<TableIF> wResultList = tables.stream()
                        .skip(pFirst)
                        .limit(pPageSize)
                        .collect(Collectors.toList());

                return wResultList;
            }

        } : items;

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
            tables = tableGateway.GetAll(wProjectId).stream().collect(Collectors.toList());
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public void search() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_TABLE_DTL, "pProjectId");
            Map<String, Object> params = new HashMap<>();
            params.put("project", wProjectId);
            if (StringUtils.isNotBlank(physical)) {
                params.put("physical", physical);
            }
            if (StringUtils.isNotBlank(logical)) {
                params.put("logical", logical);
            }
            tables = tableGateway.GetTables(params).stream().collect(Collectors.toList());
        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }

    public String showDetail(TableIF table) {

        return redirect(Const.SCR_INFO.get("TABLE_DTL"));
    }
}
