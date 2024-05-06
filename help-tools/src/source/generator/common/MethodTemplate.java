package source.generator.common;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.NodeList;
import com.github.javaparser.ast.body.MethodDeclaration;
import com.github.javaparser.ast.stmt.BlockStmt;
import com.github.javaparser.ast.stmt.CatchClause;
import com.github.javaparser.ast.stmt.TryStmt;

import java.util.Optional;

public class MethodTemplate implements IMethodTemplate {

    private BlockStmt bodyStmt;

    private BlockStmt tryStmt;

    private NodeList<CatchClause> catchStmt;

    private BlockStmt finallyStmt;

    @Override
    public BlockStmt getBody() {
        return bodyStmt;
    }

    @Override
    public BlockStmt getTryStmt() {
        return tryStmt;
    }

    @Override
    public NodeList<CatchClause> getCatchStmt() {
        return catchStmt;
    }

    @Override
    public BlockStmt getFinallyStmt() {
        return finallyStmt;
    }

    public MethodTemplate(CompilationUnit cu) {
        Optional<MethodDeclaration> declaration = cu.findFirst(MethodDeclaration.class);

        if (declaration.isPresent()) {
            MethodDeclaration methodDeclaration = declaration.get();

            if (methodDeclaration.getBody().isPresent()) {
                bodyStmt = methodDeclaration.getBody().get();

                Optional<TryStmt> bodyTryStmt = bodyStmt.findFirst(TryStmt.class);

                bodyTryStmt.ifPresent(stmt -> tryStmt = stmt.getTryBlock());
                bodyTryStmt.ifPresent(stmt -> catchStmt = stmt.getCatchClauses());
                bodyTryStmt.flatMap(TryStmt::getFinallyBlock).ifPresent(stmtFinally -> finallyStmt = stmtFinally);

            }
        }
    }
}
