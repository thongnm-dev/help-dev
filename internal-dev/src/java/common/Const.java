
package common;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author thongnm
 */
public class Const {

    public static final Map<String, String> SCR_INFO = new HashMap<String, String>() {
        {
            put("DBTOOLS", "/DbToolBelt.xhtml");
            put("MST", "/Mst.xhtml");
            put("SCR_TOOL", "/SourceToolBelt.xhtml");
            put("SQLBUILDER", "/SqlBuilder.xhtml");
            put("SQL_TOOL", "/SqlToolBelt.xhtml");            
            put("TABLE", "/Table.xhtml");
            put("TABLE_COL", "/TableColumn.xhtml");
            

        }
    };

    public static final String TABLE_FROM_LAYOUT = "0";

    public static final String TABLE_FROM_DDL = "1";

}
