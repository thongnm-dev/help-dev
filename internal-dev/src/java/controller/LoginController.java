package Controller;

import common.BaseController;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;

@Named
@SessionScoped
public class LoginController extends BaseController {

    public String init() throws Exception {

        return "";
    }
}
