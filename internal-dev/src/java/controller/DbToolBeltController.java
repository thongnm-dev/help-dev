package Controller;

import common.BaseController;
import common.Const;
import common.MessageUtils;
import common.SelectItemFactory;
import entity.TableColumnIF;
import entity.TableIF;
import gateway.TableColumnGateway;
import gateway.TableGateway;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.model.SelectItem;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import java.util.List;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.Setter;
import model.DbTableColumnModel;
import org.apache.commons.lang3.StringUtils;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeMap;

@Named
@SessionScoped
public class DbToolBeltController extends BaseController {

    private final String SRC_ID = "DBTOOLS";

    @Getter
    private SelectItem[] tableItems = null;
    
    
    @Getter
    private SelectItem[] settingItems = null;
    
    
    @Getter
    private SelectItem[] randomItems = null;
    

    @Getter
    private List<DbTableColumnModel> columns;

    @Getter
    @Setter
    private String tableTarget;

    @Inject
    private TableGateway tableGateway;

    @Inject
    private TableColumnGateway tblColumnGateway;

    public String init() throws Exception {

        if (!initData()) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
            return redirect(getBackScr(SRC_ID));
        }

        return Const.SCR_INFO.get(SRC_ID);
    }

    /**
     *
     * @return @throws Exception
     */
    private boolean initData() throws Exception {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");

            List<TableIF> tables = tableGateway.GetTables(wProjectId).stream().collect(Collectors.toList());

            tableItems = SelectItemFactory.INSTANCE.create(tables, true,
                     (tableIf) -> tableIf.getPhysical(),
                     (tableIf) -> StringUtils.join(tableIf.getPhysical(), "【", tableIf.getLogical(), "】"));
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public void load() {

        try {
            Long wProjectId = this.<Long>getScrFromSession(SRC_ID, "pProjectId");
            ModelMapper modelMapper = new ModelMapper();
            TypeMap<TableColumnIF, DbTableColumnModel> typeMap = modelMapper.createTypeMap(TableColumnIF.class, DbTableColumnModel.class);

            columns = tblColumnGateway.GetTableColumns(wProjectId, tableTarget).stream()
                    .map(wRow -> typeMap.map(wRow))
                    .collect(Collectors.toList());

        } catch (Exception ex) {
            addErrorMsg(MessageUtils.getMessage("E0001"));
        }
    }
}
