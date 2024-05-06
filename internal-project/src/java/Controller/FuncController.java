package Controller;

import Common.BaseController;
import Common.Const;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.DataModel;
import javax.inject.Named;
import Model.FuncIf;
import lombok.Getter;
import lombok.Setter;
import org.primefaces.model.FilterMeta;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortMeta;

@Named
@SessionScoped
public class FuncController extends BaseController {

    private final String SRC_ID = "FUNC";

    private List<FuncIf> listData = null;

    private DataModel<FuncIf> items;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    public DataModel<FuncIf> getItems() {

        return !canSearch ? items : items == null ? items = new LazyDataModel<FuncIf>() {
            @Override
            public int count(Map<String, FilterMeta> map) {
                return listData.size();
            }

            @Override
            public List<FuncIf> load(int pFirst, int pPageSize, Map<String, SortMeta> pSortField, Map<String, FilterMeta> pFilters) {
                List<FuncIf> wResultList = listData.stream()
                        .skip(pFirst)
                        .limit(pPageSize)
                        .collect(Collectors.toList());

                return wResultList;
            }

        } : items;

    }

    public String init() throws Exception {

        return Const.SCR_INFO.get(SRC_ID);
    }

    private boolean initData() {

        return true;
    }

    public void search() {

    }
}
