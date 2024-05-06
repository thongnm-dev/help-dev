package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.body.MethodDeclaration;
import com.github.javaparser.ast.nodeTypes.NodeWithSimpleName;
import com.github.javaparser.javadoc.JavadocBlockTag;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MethodDeclarationValidator implements Validator {
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {
        List<CheckResult> results = new ArrayList<>();

        List<MethodDeclaration> methods = cu.findAll(MethodDeclaration.class);

        methods.parallelStream()
                .forEach(method -> {

                    // check comment
                    if (!method.hasJavaDocComment()) {

                        CheckResult result = CheckResult.builder()
                                .errorLine(method.getBegin().get().line)
                                .contentError(method.getNameAsString())
                                .errorMsg("Method khai báo phải có comment").build();

                        results.add(result);

                    // check matches parameter in javadoc and parameter declare at target method
                    } else {
                        List<String> zParams = new ArrayList<>(method.getParameters().stream().map(NodeWithSimpleName::getNameAsString).collect(Collectors.toList()));
                        method.getJavadoc().ifPresent(javadoc -> {
                            javadoc.getBlockTags().forEach(blockTag -> {
                                blockTag.getName().ifPresent(name -> {
                                    if (blockTag.getType().equals(JavadocBlockTag.Type.PARAM) && zParams.get(0).equals(name)) {
                                        zParams.remove(0);
                                    }
                                });
                            });
                        });

                        // If the parameter list isn't empty
                        if (!zParams.isEmpty()) {
                            CheckResult result = CheckResult.builder()
                                    .errorLine(method.getBegin().get().line)
                                    .contentError(method.getNameAsString())
                                    .errorMsg("Paramter Javadoc khai báo không khớp với method").build();

                            results.add(result);
                        }
                    }
                });

        return results;
    }
}
