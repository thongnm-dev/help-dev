package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.ImportDeclaration;
import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
import com.github.javaparser.ast.body.VariableDeclarator;
import com.github.javaparser.ast.expr.AnnotationExpr;
import com.github.javaparser.ast.expr.NameExpr;
import com.github.javaparser.ast.type.Type;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ImportDeclarationValidator implements Validator  {
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {
        List<CheckResult> results = new ArrayList<>();
        List<ImportDeclaration> importDeclarations = cu.getImports();
        List<String> Checks = new ArrayList<>();
        importDeclarations.stream()
                .filter(importDeclaration -> !importDeclaration.isAsterisk()) // bỏ qua nếu import là import *
                .filter(importDeclaration -> { // bỏ qua nếu import sử dụng theo dạng annotation. Vd: @Session
                    String identifier = importDeclaration.getName().getIdentifier();

                    List<AnnotationExpr> annotationExpressions = cu.findAll(AnnotationExpr.class);

                    return annotationExpressions.stream().noneMatch(annotationExpr -> annotationExpr.getNameAsString().equals(identifier));
                })
                .filter(importDeclaration -> { // bỏ qua nếu import sử dụng theo dạng type. Vd: CheckResult results;
                    String identifier = importDeclaration.getName().getIdentifier();

                    List<Type> types = cu.findAll(Type.class);

                    return types.stream().noneMatch(type -> type.asString().equals(identifier));
                })
                .filter(importDeclaration -> { // bỏ qua nếu import sử dụng theo dạng static. Vd: Math.min();
                    String identifier = importDeclaration.getName().getIdentifier();

                    List<NameExpr> nameExpressions = cu.findAll(NameExpr.class);

                    return nameExpressions.stream().noneMatch(nameExpr -> nameExpr.getNameAsString().equals(identifier));
                })
                // bỏ qua class imoport has bên extended
                .filter(importDeclaration -> {
                    List<ClassOrInterfaceDeclaration> declarations = cu.findAll(ClassOrInterfaceDeclaration.class);
                    String identifier = importDeclaration.getName().getIdentifier();
                    for (ClassOrInterfaceDeclaration declaration : declarations) {
                        return !declaration.getExtendedTypes().get(0).getNameAsString().equals(identifier);
                    }

                    return declarations.stream().noneMatch(declaration -> declaration.getExtendedTypes().get(0).getNameAsString().equals(identifier));
                })
                .filter(importDeclaration -> {
                    List<VariableDeclarator> declarators = cu.findAll(VariableDeclarator.class);
                    String identifier = importDeclaration.getName().getIdentifier();

                    boolean check = declarators.stream().noneMatch(declaration -> declaration.getTypeAsString().contains(identifier));

                    if (Arrays.asList("ArrayList", "List").contains(identifier) && check) {
                        Checks.addAll(Arrays.asList("ArrayList", "List"));
                    }

                    if (Arrays.asList("HashMap", "Map").contains(identifier) && check) {
                        Checks.addAll(Arrays.asList("HashMap", "Map"));
                    }
                    return check;
                })
                .forEach(importDeclaration -> {
                    String identifier = importDeclaration.getName().getIdentifier();
                    if (!Checks.contains(identifier)) {
                        CheckResult result = CheckResult.builder()
                                .errorLine(importDeclaration.getBegin().get().line)
                                .contentError(importDeclaration.getNameAsString())
                                .errorMsg("Package import không được sử dụng.").build();

                        results.add(result);
                    }
                });

        return results;
    }
}
