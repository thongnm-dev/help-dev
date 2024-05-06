
package Cmn;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * 定数クラス
 */
public class Const {

    /**
     * セッションキー（エラー情報）
     */
    public static final String C_SESSION_KEY_ERRMSG = "errMsg";

    public static final String C_SESSION_KEY_RESULTMSG = "resultMsg";

    public static final String CHECK_KEY_MSGID = "messageID";

    public static final String CHECK_KEY_COMPONENTID = "componentID";

    /**
     * 主キー
     */
    public static final String PRIMARY_KEY = "PK";

    /**
     * フラグオン
     */
    public static final String FLG_ON = "1";

    /**
     * フラグオフ
     */
    public static final String FLG_OFF = "0";

    /**
     * 半角スペース
     */
    public static final String HALF_SPACE = " ";

    /**
     * デフォルトの数値
     */
    public static final String DEFAULT_NUMERIC = "0";

    /**
     * 全角スペース
     */
    public static final String FULL_SPACE = "　";

    /**
     * スラッシュ
     */
    public static final String SLASH = "/";

    /**
     * アンダースコア
     */
    public static final String UNDERSCORE = "_";

    /**
     * ダッシュ
     */
    public static final String DASH = "-";

    /**
     * 改行文字
     */
    public static final String LINE_BREAK = "\n";

    /**
     * ドット (.) 区切り記号
     */
    public static final String DOT_SEPARATOR = "\\.";

    /**
     * カンマ (.) 区切り文字
     */
    public static final String COMMA_SEPARATOR = "\\,";

    /**
     * 英字
     */
    public static final String SAMPLE_ALPHABET = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz";

    /**
     * 数字
     */
    public static final String SAMPLE_NUMBER = "0123456789";

    /**
     * 英数字
     */
    public static final String SAMPLE_ENGLISH_CHARACTERS = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz0123456789";

    public static final int DEFAULT_MAX_RECORD_OF_FILE = 100000;

    public static final int DEFAULT_MAX_CHARACTER_LENGTH = 255;

    public static final int DEFAULT_CHARACTER_LENGTH = 1;

    public static final String NUMERIC_SPARATOR = ".";

    public static final int NUMERIC_SPARATOR_LENGTH = NUMERIC_SPARATOR.length();

    public static final Pattern CSV_SPECIAL_CHARACTER_FOR_PARAMETER_PATTERN = Pattern.compile("[\"'\\n\\r\\t]");

    public static final Pattern CSV_SPECIAL_CHARACTER_PATTERN = Pattern.compile("[,;\"'\\n\\r\\t]");

    public static final Pattern IS_INTEGER_PATTERN = Pattern.compile("-?[0-9]+");

    public static final Pattern IS_NUMERIC_PATTERN = Pattern.compile("-?[0-9]+(\\.[0-9]+)?");

    public static final Pattern YEAR = Pattern.compile("^\\d{4}$");
    public static final Pattern YEAR_MONTH = Pattern.compile("^\\d{4}(0[1-9]|1[0-2])$");
    public static final Pattern YEAR_MONTH_DD = Pattern.compile("^\\d{4}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])$");
    public static final Pattern YEAR_MONTH_DD_HH = Pattern.compile("^(?:(?:19|20)\\d\\d)(?:0[1-9]|1[0-2])(?:0[1-9]|[1-2]\\d|3[01])(?:[01]\\d|2[0-3])$");
    public static final Pattern YEAR_MONTH_DD_HH_MM = Pattern.compile("^(?:(?:19|20)\\d\\d)(?:0[1-9]|1[0-2])(?:0[1-9]|[1-2]\\d|3[01])(?:[01]\\d|2[0-3])(?:[0-5]\\d)$");
    public static final Pattern YEAR_MONTH_DD_HH_MM_SS = Pattern.compile("^(?:(?:19|20)\\d\\d)(?:0[1-9]|1[0-2])(?:0[1-9]|[1-2]\\d|3[01])(?:0[1-9]|1[0-2])(?:[0-5]\\d)(?:[0-5]\\d)$");

    public class TypeSet {

        /**
         * 連番
         */
        public static final String SEQUENTIAL_VAL = "SEQ";

        public static final String SEQUENTIAL_LABEL = "連番";

        /**
         * 固定値
         */
        public static final String FIXED_VAL = "FIXED";

        public static final String FIXED_LABEL = "固定値";

        /**
         * 乱数値
         */
        public static final String RANDOM_VAL = "RANDOM";
        public static final String RANDOM_LABEL = "乱数値";

        /**
         * 指定値
         */
        public static final String SPECIFIED_VAL = "SPEC";
        public static final String SPECIFIED_LABEL = "指定値";

    }

    /**
     * データ型
     */
    public class DataType {

        /**
         * character varying
         */
        public static final String VARCHAR_TYPE = "character varying";

        /**
         * text
         */
        public static final String TEXT_TYPE = "text";

        /**
         * numeric
         */
        public static final String NUMERIC_TYPE = "numeric";

        /**
         * bigint
         */
        public static final String BIGINT_TYPE = "bigint";
    }

    /**
     * コンポーネントID
     */
    public class ComponentID {

        /**
         * testForm
         */
        public static final String FORM_ID = "testForm";

        /**
         * columnTable
         */
        public static final String COLUMN_TABLE = "columnTable";

        /**
         * typeSet
         */
        public static final String TYPE_SET = "typeSet";

        /**
         * randomValueOpts
         */
        public static final String RANDOM_OPTIONS = "randomValueOpts";

        /**
         * parameter
         */
        public static final String PARAMETER = "parameter";

        /**
         * criteriaSet
         */
        public static final String CRITERIA_SET = "criteriaSet";

        /**
         * incremental
         */
        public static final String INCREMENTAL = "incremental";

    }

    public class RandomOptions {

        /**
         * 英字
         */
        public static final String ALPHABET = "ALPHA";
        public static final String ALPHABET_LABEL = "英字";

        /**
         * 数字
         */
        public static final String NUMBER = "NUMBER";
        public static final String NUMBER_LABEL = "数字";

        /**
         * 英数字
         */
        public static final String ENGLISH_CHARACTERS = "CHAR";
        public static final String ENGLISH_CHARACTERS_LABEL = "英数字";
    }

    /**
     * 拡張子
     */
    public class Extension {

        /**
         * pdf
         */
        public static final String PDF = "pdf";

        /**
         * xls
         */
        public static final String XLS = "xls";

        /**
         * xlsx
         */
        public static final String XLSX = "xlsx";

        /**
         * xlsm
         */
        public static final String XLSM = "xlsm";

        /**
         * json
         */
        public static final String JSON = "json";

        /**
         * jpeg
         */
        public static final String JPEG = "jpeg";

        /**
         * txt
         */
        public static final String TXT = "txt";

        /**
         * csv
         */
        public static final String CSV = "csv";

        /**
         * zip
         */
        public static final String ZIP = "zip";
    }

    public static final String DELIMITER_LIST = " ,";

    public static final String DEFAULT_DELIMITER = ",";

    /**
     * 日時形式
     */
    public class DateFormat {

        public static final String NENDO_FORMAT = "yyyy";

        public static final String YM_FORMAT = "yyyyMM";

        public static final String YMD_FORMAT = "yyyyMMdd";

        public static final String DATETIME_FORMAT = "yyyyMMddhhmmss";

    }

    /**
     * 列名を対応する日付形式に関連付けるためのマップ
     */
    public static final Map<String, String> DATE_FORMATS = new HashMap<>();

    static {
        DATE_FORMATS.put("nendo", DateFormat.NENDO_FORMAT);
        DATE_FORMATS.put("ym", DateFormat.YM_FORMAT);
        DATE_FORMATS.put("ymd", DateFormat.YMD_FORMAT);
        DATE_FORMATS.put("date", DateFormat.DATETIME_FORMAT);
    }

    /**
     * PostgreSQL データ型の名前とデフォルトの長さ
     */
    public static class DataTypes {

        public static final Map<String, String> NUMERIC_MAX_VALUES = new HashMap<>();

        static {
            NUMERIC_MAX_VALUES.put("smallint", "32767");
            NUMERIC_MAX_VALUES.put("integer", "2147483647");
            NUMERIC_MAX_VALUES.put("bigint", "9223372036854775807");
            NUMERIC_MAX_VALUES.put("decimal", "9223372036854775807");
            NUMERIC_MAX_VALUES.put("numeric", "9223372036854775807");
            NUMERIC_MAX_VALUES.put("real", "8388607");
            NUMERIC_MAX_VALUES.put("double precision", "9223372036854775807");
            NUMERIC_MAX_VALUES.put("smallserial", "32767");
            NUMERIC_MAX_VALUES.put("serial", "2147483647");
            NUMERIC_MAX_VALUES.put("bigserial", "9223372036854775807");
        }

        /**
         * PostgreSQL 数値データ型の名前とデフォルトの長さ
         */
        public static final Map<String, Integer> NUMERIC_TYPES = new HashMap<>();

        static {
            NUMERIC_TYPES.put("smallint", NUMERIC_MAX_VALUES.get("smallint").length());
            NUMERIC_TYPES.put("integer", NUMERIC_MAX_VALUES.get("integer").length());
            NUMERIC_TYPES.put("bigint", NUMERIC_MAX_VALUES.get("bigint").length());
            NUMERIC_TYPES.put("decimal", NUMERIC_MAX_VALUES.get("decimal").length());
            NUMERIC_TYPES.put("numeric", NUMERIC_MAX_VALUES.get("numeric").length());
            NUMERIC_TYPES.put("real", NUMERIC_MAX_VALUES.get("real").length());
            NUMERIC_TYPES.put("double precision", NUMERIC_MAX_VALUES.get("double precision").length());
            NUMERIC_TYPES.put("smallserial", NUMERIC_MAX_VALUES.get("smallserial").length());
            NUMERIC_TYPES.put("serial", NUMERIC_MAX_VALUES.get("serial").length());
            NUMERIC_TYPES.put("bigserial", NUMERIC_MAX_VALUES.get("bigserial").length());
        }

        /**
         * PostgreSQL 文字データ型の名前とデフォルトの長さ
         */
        public static final Map<String, Integer> CHARACTER_TYPES = new HashMap<>();

        static {
            CHARACTER_TYPES.put("character", DEFAULT_CHARACTER_LENGTH);
            CHARACTER_TYPES.put("character varying", DEFAULT_MAX_CHARACTER_LENGTH);
            CHARACTER_TYPES.put("text", DEFAULT_MAX_CHARACTER_LENGTH);
        }

        /**
         * PostgreSQL 日時データ型の名前とデフォルトの長さ
         */
        public static final Map<String, Integer> DATE_TIME_TYPES = new HashMap<>();

        static {
            DATE_TIME_TYPES.put("date", DEFAULT_MAX_CHARACTER_LENGTH);
            DATE_TIME_TYPES.put("time", DEFAULT_MAX_CHARACTER_LENGTH);
            DATE_TIME_TYPES.put("timestamp", DEFAULT_MAX_CHARACTER_LENGTH);
        }

        /**
         * PostgreSQL ブールデータ型の名前とデフォルトの長さ
         */
        public static final Map<String, Integer> BOOLEAN_TYPE = new HashMap<>();

        static {
            BOOLEAN_TYPE.put("boolean", Integer.MIN_VALUE);
        }
    }

    public class Charset {

        public static final String SHIFTJIS = "SHIFT-JIS";
    }
}
