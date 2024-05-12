
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
            put("BUG", "/Bug.xhtml");
            put("SCR_CHK", "/CheckSource.xhtml");
            put("UT_CHK", "/CheckUnitTest.xhtml");
            put("RPT", "/DailyReport.xhtml");
            put("DBTOOLS", "/DbToolBelt.xhtml");
            put("DIC", "/Dictionary.xhtml");
            put("FUNC", "/Function.xhtml");
            put("MSG", "/Message.xhtml");
            put("NOTE", "/Note.xhtml");
            put("PROJECT", "/Project.xhtml");
            put("SCR_TOOL", "/SourceToolBelt.xhtml");
            put("SQL_TOOL", "/SqlToolBelt.xhtml");
            put("TABLE", "/Table.xhtml");
            put("MSTCD", "/Mst.xhtml");
            put("TABLE_DTL", "/TableDetail.xhtml");
            put("TASK", "/Task.xhtml");
            put("TASK_DTL", "/TaskDetail.xhtml");
            put("TRAINING", "/Training.xhtml");
            put("URS_GUIDE", "/UserGuide.xhtml");

        }
    };

    public static final String TABLE_FROM_LAYOUT = "0";

    public static final String TABLE_FROM_DDL = "1";

}
