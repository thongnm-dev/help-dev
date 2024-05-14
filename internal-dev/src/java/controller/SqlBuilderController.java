package controller;

import common.Const;
import jakarta.enterprise.context.SessionScoped;
import java.io.Serializable;
import javax.inject.Named;

@Named
@SessionScoped
public class SqlBuilderController implements Serializable {

    private final String SRC_ID = "SQLBUILDER";

    public String init() throws Exception {

//        if (!initData()) {
//            addErrorMsg(MessageUtils.getMessage("E0001"));
//            return redirect(getBackScr(SRC_ID));
//        }
        return Const.SCR_INFO.get(SRC_ID);
    }
}
