package controller;

import common.BaseController;
import common.Const;
import gateway.MstGateway;
import jakarta.enterprise.context.SessionScoped;
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

    @Getter
    private List<MstModel> items = null;

    @Inject
    private MstGateway mstGateway;

    @Getter
    @Setter
    private int pageFirstItem = 0;

    @Getter
    @Setter
    private int rowsPerPage = 25;

    @Getter
    @Setter
    private boolean canSearch = false;
    
    public String init() throws Exception {

        return Const.SCR_INFO.get(SRC_ID);
    }

    public void search() {

    }
}
