package source.utils;

import com.github.javaparser.ast.comments.LineComment;
import com.github.javaparser.ast.expr.MethodCallExpr;
import com.github.javaparser.ast.expr.NameExpr;
import com.github.javaparser.ast.stmt.BlockStmt;

import java.util.ArrayList;
import java.util.List;

public class Cmm {

    public static void makeInsertLogL4(BlockStmt stmt) {

        List<String> comments = new ArrayList<String>();
        comments.add("**********************************************");
        comments.add("ログ出力処理(L4)  SQL出力");
        comments.add("**********************************************");

        comments.forEach(cmt -> {
            stmt.addOrphanComment(new LineComment(cmt));
        });

         List<String> params = new ArrayList<String>();

        params.add("getEntityManager()");
        params.add("pUser");
        params.add("Cmn.Log_Syusyu_LV.L4");
        params.add("Cmn.Kino_LV.L3");
        params.add("pKinoCd");
        params.add("wQuery.toString()");

        stmt.addStatement(makeMethodCallExpr("Cmn.InsertLog", params));
    }

    public static MethodCallExpr makeMethodCallExpr(String pName, List<String> pParams) {
        MethodCallExpr callExpr = new MethodCallExpr();

        callExpr.setName(pName);

        pParams.forEach(param -> {
            callExpr.addArgument(new NameExpr(param));
        });

        return callExpr;
    }
}
