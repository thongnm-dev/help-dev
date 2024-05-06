package Controller;

import Common.BaseController;
import Common.Const;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named
@SessionScoped
public class TaskController extends BaseController {

    private final String SRC_ID = "TASK";

    public String init() throws Exception {

        return Const.SCR_INFO.get(SRC_ID);
    }
}
