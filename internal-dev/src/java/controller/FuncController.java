package Controller;

import common.BaseController;
import common.BaseLazyDataModel;
import common.Const;
import java.util.List;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import entity.FuncIf;
import lombok.Getter;
import lombok.Setter;
import org.primefaces.model.LazyDataModel;

@Named
@SessionScoped
public class FuncController extends BaseController {

    private final String SRC_ID = "FUNC";

    private List<FuncIf> listData = null;

    private LazyDataModel<FuncIf> items;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;

    public LazyDataModel<FuncIf> getItems() {

        return !canSearch ? items : items == null ? items = new BaseLazyDataModel(listData) : items;
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
