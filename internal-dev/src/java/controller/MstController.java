package Controller;

import common.BaseController;
import common.BaseLazyDataModel;
import common.Const;
import gateway.MstGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.model.DataModel;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import model.MstModel;

@Named
@SessionScoped
public class MstController extends BaseController {

    private final String SRC_ID = "MST";

    private List<MstModel> tables = null;

    @Inject
    private MstGateway mstGateway;

    private DataModel<MstModel> items;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;
    
    public DataModel<MstModel> getItems() {
        return !canSearch ? items : items == null ? items = new BaseLazyDataModel(tables) : items;
    }

    public String init() throws Exception {

        return Const.SCR_INFO.get(SRC_ID);
    }

    public void search() {

    }
}
