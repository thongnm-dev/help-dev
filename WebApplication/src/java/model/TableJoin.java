package model;

import controller.SqlBuilderController;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TableJoin {

    private SqlBuilderController.TableItem tableItem;

    private String alias;

    private String join;

    private String where;
    
    private boolean isfrom;
}
