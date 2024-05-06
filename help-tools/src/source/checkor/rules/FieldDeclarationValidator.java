package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.Modifier;
import com.github.javaparser.ast.body.FieldDeclaration;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;

import java.util.ArrayList;
import java.util.List;

public class FieldDeclarationValidator implements Validator {
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {
        List<CheckResult> results = new ArrayList<>();

        List<FieldDeclaration> fields = cu.findAll(FieldDeclaration.class);

        fields.parallelStream().forEach(field -> {

             List<Modifier> modifiers = field.getModifiers();

             boolean isStatic = modifiers.stream().anyMatch(modifier -> Modifier.Keyword.STATIC.equals(modifier.getKeyword()));
             boolean isFinal = modifiers.stream().anyMatch(modifier -> Modifier.Keyword.FINAL.equals(modifier.getKeyword()));

            // check Final variable
            if (isFinal && isStatic) {

                boolean hasLowercase = field.getVariables().stream().anyMatch(variable -> !variable.getNameAsString().equals(variable.getNameAsString().toUpperCase()));

                if (hasLowercase) {
                    CheckResult result = CheckResult.builder()
                            .errorLine(field.getBegin().get().line)
                            .contentError(field.toString())
                            .errorMsg("Biến static khai báo phải UPPERCASE").build();

                    results.add(result);
                }
            }

            if ((isFinal && !isStatic) || (!isFinal && isStatic)) {
                CheckResult result = CheckResult.builder()
                        .errorLine(field.getBegin().get().line)
                        .contentError(field.toString())
                        .errorMsg("Biến khai báo là static thì cũng bao gồm final. Ngược lại.").build();

                results.add(result);
            }

            // check existing comment
            if (!field.hasJavaDocComment()) {
                CheckResult result = CheckResult.builder()
                        .errorLine(field.getBegin().get().line)
                        .contentError(field.toString())
                        .errorMsg("Biến khai báo phải có comment").build();

                results.add(result);
            }
        });

        return results;
    }
}