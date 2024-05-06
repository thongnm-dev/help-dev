package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;

import java.util.ArrayList;
import java.util.List;

public class LambdaExprValidator implements Validator {
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {
        List<CheckResult> results = new ArrayList<>();
        return results;
    }
}
