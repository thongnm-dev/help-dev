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
            put("RULE", "/WorkingRule.xhtml");
            put("DBTOOLS", "/DbToolBelt.xhtml");
            put("MST", "/Mst.xhtml");
            put("SCR_TOOL", "/SourceToolBelt.xhtml");
            put("SQLBUILDER", "/SqlBuilder.xhtml");
            put("SQL_TOOL", "/SqlToolBelt.xhtml");
            put("TABLE", "/Table.xhtml");
            put("TABLE_COL", "/TableColumn.xhtml");

        }
    };

    public static final int DEFAULT_MAX_RECORD_OF_FILE = 100000;

    public static final String TABLE_FROM_LAYOUT = "0";

    public static final String TABLE_FROM_DDL = "1";

    public static final String OPTION_SETTING = "OPTION_SETTING";

    public static final String OPTION_RANDOM = "OPTION_RANDOM";
    
    public static final String OPTION_SQL = "OPTION_SQL";

    public static class Setting {

        public static final String SEQ = "1";

        public static final String FIX = "2";

        public static final String RANDOM = "3";

        public static final String RANGE = "4";
    }

    public static class Random {

        public static final String ALPHA = "1";

        public static final String NUM = "2";

        public static final String ALPHA_NUM = "3";
    }

    public class DateFormat {

        public static final String NENDO_FORMAT = "yyyy";

        public static final String YM_FORMAT = "yyyyMM";

        public static final String YMD_FORMAT = "yyyyMMdd";

        public static final String DATETIME_FORMAT = "yyyyMMddhhmmss";

    }
    
    public class Extension {
        /**
         * csv
         */
        public static final String CSV = "csv";
    }
    
    public class Sql {
        
        public static final String SEL = "0";
        
        public static final String INS = "1";
        
        public static final String UPD = "2";
        
        public static final String DEL = "3";
        
        public static final String CNT = "4";
    }
}
