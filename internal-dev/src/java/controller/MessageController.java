package Controller;

import common.BaseController;
import common.Const;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;

@Named
@SessionScoped
public class MessageController extends BaseController {

    private final String SRC_ID = "MSG";

    public String init() throws Exception {

        return Const.SCR_INFO.get(SRC_ID);
    }
}