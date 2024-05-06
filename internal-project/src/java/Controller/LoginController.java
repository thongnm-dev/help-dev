package Controller;

import Common.BaseController;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named
@SessionScoped
public class LoginController extends BaseController {

    public String init() throws Exception {

        return "";
    }
}
