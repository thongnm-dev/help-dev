package model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TableJoin {

    private String table_name;

    private String join;

    private String alias;

    private String where;

    @Getter
    @Setter
    public class Item {

        private String physical;

        private String logical;
    }
}
