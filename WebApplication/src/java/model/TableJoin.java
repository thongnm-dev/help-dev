package model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TableJoin {

    private String physical;

    private String logical;

    private String alias;

    private String join;

    private String where;
    
    private boolean isfrom;
}
