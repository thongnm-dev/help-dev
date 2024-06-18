package common;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/**
 *
 * @author thongnm
 */
public class Const {

    public static final Map<String, String> SCR_INFO = new HashMap<String, String>() {
        {
            put("TASK", "/Task.xhtml");
            put("NOTE", "/Note.xhtml");
            
            put("DBTOOLS", "/DbToolBelt.xhtml");
            put("MST", "/Mst.xhtml");
            put("SCR_TOOL", "/SourceToolBelt.xhtml");
            put("SQLBUILDER", "/SqlBuilder.xhtml");
            put("SQL_TOOL", "/SqlToolBelt.xhtml");
            put("TABLE", "/Table.xhtml");
            put("TABLE_COL", "/TableColumn.xhtml");
            put("DOMAIN", "/Domain.xhtml");

        }
    };

    public static final int DEFAULT_MAX_RECORD_OF_FILE = 100000;

    public static final String TABLE_FROM_LAYOUT = "0";

    public static final String TABLE_FROM_DDL = "1";

    public static final String OPTION_SETTING = "OPTION_SETTING";

    public static final String OPTION_RANDOM = "OPTION_RANDOM";

    public static final String OPTION_SQL = "OPTION_SQL";

    public static final String OPTION_TARGET = "OPTION_TARGET";

    public static final String OPTION_MST_DATA = "OPTION_MST_DATA";

    public static final Pattern YEAR = Pattern.compile("^\\d{4}$");
    public static final Pattern YEAR_MONTH = Pattern.compile("^\\d{4}(0[1-9]|1[0-2])$");
    public static final Pattern YEAR_MONTH_DD = Pattern.compile("^\\d{4}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])$");
    public static final Pattern YEAR_MONTH_DD_HH = Pattern.compile("^(?:(?:19|20)\\d\\d)(?:0[1-9]|1[0-2])(?:0[1-9]|[1-2]\\d|3[01])(?:[01]\\d|2[0-3])$");
    public static final Pattern YEAR_MONTH_DD_HH_MM = Pattern.compile("^(?:(?:19|20)\\d\\d)(?:0[1-9]|1[0-2])(?:0[1-9]|[1-2]\\d|3[01])(?:[01]\\d|2[0-3])(?:[0-5]\\d)$");
    public static final Pattern YEAR_MONTH_DD_HH_MM_SS = Pattern.compile("^(?:(?:19|20)\\d\\d)(?:0[1-9]|1[0-2])(?:0[1-9]|[1-2]\\d|3[01])(?:0[1-9]|1[0-2])(?:[0-5]\\d)(?:[0-5]\\d)$");

    public static class Setting {

        public static final String DEF = "0";

        public static final String SEQ = "1";

        public static final String FIX = "2";

        public static final String RANDOM = "3";

        public static final String RANGE = "4";
    }

    public static class Random {

        public static final String ALPHA = "1";

        public static final String NUM = "2";

        public static final String ALPHA_NUM = "3";

        public static final String FULL_SIZE = "4";
    }

    public class DateFormat {

        public class None {

            public static final String DATE = "yyyyMMdd";

            public static final String DATETIME = "yyyyMMddhhmmss";
        }

        public class Format {

            public static final String DATE = "yyyy/MM/dd";

            public static final String DATETIME = "yyyy/MM/dd HH:mm:ss";

        }

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

    public class Data {
        public static final String FILE = "0";
        
        public static final String DB = "1";
        
        public static final String COLUMN_HISTORY = "HISTORY";
        
        public static final String TABLE_MST = "TABLE_MST";
        
        public static final String DEFAULT_LENGTH_FULLSIZE = "31";
    }
}
