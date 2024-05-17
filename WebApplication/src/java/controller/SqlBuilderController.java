package controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import common.SelectItemFactory;
import entity.PrmIF;
import gateway.PrmGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.model.SelectItem;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.Setter;
import model.TableJoin;

@Named
@SessionScoped
public class SqlBuilderController extends BaseController {

    private final String SRC_ID = "SQLBUILDER";

    @Getter
    private SelectItem[] sqlItems = null;

    @Getter
    @Setter
    private List<String> tableSql;

    @Inject
    private PrmGateway prmGateway;
    
    @Getter
    private List<TableJoin> tableJoins;

    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }
        
        getSession().put(C_SESSION_KEY_SCR, SRC_ID);
        
        return Const.SCR_INFO.get(SRC_ID);
    }

    /**
     * init data
     *
     * @return @throws Exception
     */
    private boolean initData() throws Exception {

        try {

            tableSql = new ArrayList<>();

            List<PrmIF> sqls = prmGateway.GetPrms(Const.OPTION_SQL).stream().collect(Collectors.toList());

            sqlItems = SelectItemFactory.INSTANCE.create(sqls, false,
                    (row) -> row.getPrmId(),
                    (row) -> row.getPrmValue());

            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    /**
     * perform click back
     *
     * @return
     */
    public String back() {
        return redirect(getBackScr((String) getSession().get(C_SESSION_KEY_SCR)));
    }
}
