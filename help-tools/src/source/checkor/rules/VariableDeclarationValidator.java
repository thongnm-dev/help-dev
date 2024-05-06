package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.expr.VariableDeclarationExpr;
import org.apache.commons.lang3.StringUtils;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;
import source.utils.Const;

import java.util.ArrayList;
import java.util.List;

public class VariableDeclarationValidator implements Validator {
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {
        List<CheckResult> results = new ArrayList<>();

        List<VariableDeclarationExpr> declarators = cu.findAll(VariableDeclarationExpr.class);

        declarators.parallelStream()
                .forEach(declarator -> {
                    declarator.getVariables().parallelStream().forEach(variable -> {
                        // The variable declaration should be defined with the first character being 'w'
                        if (!StringUtils.startsWith(variable.getNameAsString(), Const.Prefix.VARIABLE_PREFIX)) {
                            CheckResult result = CheckResult.builder()
                                    .errorLine(declarator.getBegin().get().line)
                                    .contentError(variable.getNameAsString())
                                    .errorMsg("Biến instance khai báo phải bắt đầu ”w”").build();

                            results.add(result);
                        }

                    });
                });
        return results;
    }
}
