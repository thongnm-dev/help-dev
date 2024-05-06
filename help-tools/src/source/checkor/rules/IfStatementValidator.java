package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.stmt.IfStmt;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;

import java.util.ArrayList;
import java.util.List;

public class IfStatementValidator implements Validator {
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {

        List<CheckResult> results = new ArrayList<>();

        List<IfStmt> ifStmts = cu.findAll(IfStmt.class);

        ifStmts.parallelStream()
                .forEach(ifStmt -> {
                    if (ifStmt.getComment().isPresent()) {
                        CheckResult result = CheckResult.builder()
                                .errorLine(ifStmt.getBegin().get().line)
                                .contentError(ifStmt.toString())
                                .errorMsg("Mỗi statement IF cần phải có comment").build();

                        results.add(result);
                    }
                });
        return results;
    }
}