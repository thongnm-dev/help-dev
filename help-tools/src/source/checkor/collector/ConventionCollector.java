package source.checkor.collector;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.printer.lexicalpreservation.LexicalPreservingPrinter;
import source.checkor.common.AbsCollector;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;
import source.checkor.rules.ClassDeclarationValidator;

import java.util.ArrayList;
import java.util.List;

public class ConventionCollector implements AbsCollector {
    @Override
    public List<CheckResult> doCheck(CompilationUnit cu) {

        List<CheckResult> checkResults = new ArrayList<>();

        CompilationUnit unit = LexicalPreservingPrinter.setup(cu);

        LexicalPreservingPrinter.print(unit);
        return checkResults;
    }

    private List<Validator> init() {
        List<Validator> validators = new ArrayList<>();
        // check java doc license header class
        validators.add(new ClassDeclarationValidator());

        return validators;
    }
}
