package controller;

import common.BaseController;
import common.Const;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;

@Named
@SessionScoped
public class TaskController extends BaseController {
    private final String SRC_ID = "TASK";
    
    public String init() {
        
        return Const.SCR_INFO.get(SRC_ID);
    }
}
