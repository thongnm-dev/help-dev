package source.generator.common;

import com.github.javaparser.ast.NodeList;
import com.github.javaparser.ast.stmt.BlockStmt;
import com.github.javaparser.ast.stmt.CatchClause;

public interface IMethodTemplate {
    BlockStmt getBody();

    BlockStmt getTryStmt();

    NodeList<CatchClause> getCatchStmt();

    BlockStmt getFinallyStmt();
}
