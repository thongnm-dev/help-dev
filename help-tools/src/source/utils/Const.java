package source.utils;

import java.util.*;

public class Const {
    /**
     * Controller
     */
    public final static String CONTROLLER = "Controller";

    /**
     * Gateway
     */
    public final static String GATEWAY = "Gateway";

    /**
     * Model
     */
    public final static String MODEL = "Model";

    /**
     * Newline
     */
    public final static String NEW_LINE = "\r\n";

    public final static Map<String, String> ModifierString = new HashMap<String, String>() {
        {
            put(ACCESS_MODIFIER.PUBLIC, "（メソッド）");
            put(ACCESS_MODIFIER.PRIVATE, "（内部処理）");
        }
    };

    public final static Map<String, List<String>> JAVA_DOC_CLASS = new HashMap<String, List<String>>() {
        {
            put(CONTROLLER, Arrays.asList("コントローラクラス", "のコントローラクラス"));
            put(GATEWAY, Arrays.asList("せゲートウェイ", "のゲートウェイ"));
            put(MODEL, Arrays.asList("画面表示情報クラス", "の画面表示情報クラス"));
        }
    };

    public final static Map<String, String> SHORT_DESCRIPTIONS_LICENCE_HEADER = new HashMap<String, String>() {
        {
            put(CONTROLLER, "画面で行うビジネスロジックを定義する");
            put(GATEWAY, "画面で必要とするデータアクセスを定義する");
            put(MODEL, "画面表示情報クラス");
        }
    };

    public static class Prefix {
        public static final String VARIABLE_PREFIX = "w";
    }

    public static class ACCESS_MODIFIER {

        /**
         * Access modifier: Private
         */
        public static final String PRIVATE = "PRIVATE";

        /**
         * Access modifier: Public
         */
        public static final String PUBLIC = "PUBLIC";

    }
}
