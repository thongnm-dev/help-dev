package source.checkor.common;

import com.github.javaparser.ast.CompilationUnit;
import source.checkor.model.CheckResult;

import java.util.List;

public interface AbsCollector {

    List<CheckResult> doCheck(CompilationUnit cu);
}
