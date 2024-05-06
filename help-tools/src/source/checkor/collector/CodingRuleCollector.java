package source.checkor.collector;

import com.github.javaparser.ast.CompilationUnit;
import source.checkor.common.AbsCollector;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;
import source.checkor.rules.*;

import java.util.ArrayList;
import java.util.List;

public class CodingRuleCollector implements AbsCollector {

    @Override
    public List<CheckResult> doCheck(CompilationUnit cu) {
        List<CheckResult> checkResults = new ArrayList<>();
         List<Validator> validators = init();

         validators.parallelStream().forEach(validator -> {
             checkResults.addAll(validator.valid(cu));
         });

         return checkResults;
    }

    private List<Validator> init() {
        List<Validator> validators = new ArrayList<>();

        // check java doc license header class
        validators.add(new ClassDeclarationValidator());
        // check package import never used
        validators.add(new ImportDeclarationValidator());
        // check field declaration must be correct (have comment, parameter match rule)
        validators.add(new FieldDeclarationValidator());
        // check method must be declared comment, parameter
        validators.add(new MethodDeclarationValidator());
        // check variable declaration must be correct
        validators.add(new VariableDeclarationValidator());
        // check if statement must be defined comment
        validators.add(new IfStatementValidator());
        // check param in lambda Expr must be correct
        validators.add(new LambdaExprValidator());
        // check Vietnamese character
        validators.add(new VietnameseCharactersValidator());

        return validators;
    }
}
