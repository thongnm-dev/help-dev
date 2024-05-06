package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;

import java.util.List;
import java.util.stream.Collectors;

public class ClassDeclarationValidator implements Validator {
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {
        List<CheckResult> results;

        List<ClassOrInterfaceDeclaration> classes = cu.findAll(ClassOrInterfaceDeclaration.class);

        results = classes.parallelStream()
                .filter(zclass -> !zclass.hasJavaDocComment())
                .map(zclass -> CheckResult.builder()
                                        .errorLine(zclass.getBegin().get().line)
                                        .contentError(zclass.getNameAsString())
                                        .errorMsg("Class khai báo phải có Javadoc Header").build())
                .collect(Collectors.toList());
        return results;
    }
}
