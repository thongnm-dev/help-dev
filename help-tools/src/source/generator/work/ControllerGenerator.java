package source.generator.work;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.Modifier;
import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
import com.github.javaparser.ast.body.FieldDeclaration;
import com.github.javaparser.ast.body.MethodDeclaration;
import com.github.javaparser.ast.comments.JavadocComment;
import com.github.javaparser.ast.comments.LineComment;
import com.github.javaparser.ast.expr.AssignExpr;
import com.github.javaparser.ast.expr.Expression;
import com.github.javaparser.ast.expr.StringLiteralExpr;
import com.github.javaparser.ast.stmt.BlockStmt;
import com.github.javaparser.ast.stmt.IfStmt;
import com.github.javaparser.ast.stmt.ReturnStmt;
import com.github.javaparser.ast.type.TypeParameter;
import com.github.javaparser.utils.SourceRoot;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import source.utils.Const;
import source.generator.common.IMethodTemplate;
import source.generator.common.MethodTemplate;
import source.generator.common.Generator;
import source.generator.common.AbstractGenerator;
import source.generator.model.MethodModel;
import source.generator.model.VariableModel;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class ControllerGenerator extends AbstractGenerator {

    /**
     * Flag check screen type
     */
    @Setter
    private boolean isMainWindow = true;

    /**
     * Class inherit
     */
    @Setter
    private String classExtends = "";

    @Setter
    private List<MethodModel> methodModels;

    @Setter
    private List<VariableModel> variableDeclares;

    private final IMethodTemplate publicTemplate;

    private final IMethodTemplate privateTemplate;

    public ControllerGenerator(Path pPath
            , String pPgCd
            , String pPgName
            , String pAuthor
            , String classExtends
            , List<MethodModel> methodModels
            , List<VariableModel> variableDeclares
            , boolean isMainWindow) {

        setPathResource(pPath);
        setPgCd(pPgCd);
        setPgName(pPgName);
        setAuthor(pAuthor);
        this.classExtends = classExtends;
        this.methodModels = methodModels;
        this.variableDeclares = variableDeclares;
        this.isMainWindow = isMainWindow;

        setSourceRoot(new SourceRoot(pPath));

        // load template
        Pair<IMethodTemplate, IMethodTemplate> templatePair = loadTemplate();

        privateTemplate = templatePair.getLeft();
        publicTemplate = templatePair.getRight();
    }

    @Override
    public void generate() {
        super.generate();

        // add generate information into target class
        addGeneral();
        // add variables into target class
        addVariableField();
        // add init method from template into target class
        addInitMethod();
        // add method into target class
        addMethods();
        // setting file name
        getCompilationUnit().setStorage(Paths.get("C:\\output", getPgCd(), getClassName()));
        // save file
        getCompilationUnit().getStorage().ifPresent(CompilationUnit.Storage::save);

    }

    @Override
    protected String getSkeletonType() {
        return Const.CONTROLLER;
    }

    @Override
    protected String extendsClass() {
        return classExtends;
    }

    /**
     * add generate information into class applicable target
     */
    private void addGeneral() {

        getCompilationUnit().addImport(StringUtils.join("gateway.", getSubPackage(), ".", getPackageBusiness(), ".", getGatewayClass()));

        Optional<ClassOrInterfaceDeclaration> declaration = Optional.ofNullable(getClassDeclaration());

        // add all properties necessary
        declaration.ifPresent(stmt -> {
            // add comment group for variable instance
            List<String> wComments = new ArrayList<>();
            wComments.add("**************************************************************");
            wComments.add("（定数）");
            wComments.add("**************************************************************");
            wComments.forEach(line -> stmt.addOrphanComment(new LineComment(line)));

            // add KINO
            FieldDeclaration KINO_CD = stmt.addFieldWithInitializer(new TypeParameter("String")
                    , "KINO_CD"
                    , new StringLiteralExpr(getPgCd())
                    , Modifier.Keyword.PRIVATE);
            KINO_CD.setComment(new JavadocComment("機能コード"));
            KINO_CD.setFinal(true);
            KINO_CD.setStatic(true);

            // add field with applicable object
            addFinalVariable();

            // add comment group for variable instance
            wComments.clear();
            wComments.add("**************************************************************");
            wComments.add("（変数）");
            wComments.add("**************************************************************");
            wComments.forEach(line -> stmt.addOrphanComment(new LineComment(line)));

            // Add gateway and setup
            FieldDeclaration gateway = stmt.addPrivateField(getGatewayClass(), "gateway");
            gateway.addAnnotation("EJB");
            gateway.setComment(new JavadocComment(StringUtils.join(getPgName(), "ゲートウェイ")));

            // add properties UserInfo
            FieldDeclaration UserInfo = stmt.addPrivateField("UserInfo", "myUser");
            UserInfo.setComment(new JavadocComment("ユーザ情報"));

            // add properties PathInfo
            FieldDeclaration PathInfo = stmt.addPrivateField("PathInfo", "myPath");
            PathInfo.setComment(new JavadocComment("パス情報"));
        });
    }

    /**
     * add all final static variables has been defined into class applicable target
     */
    private void addFinalVariable() {
        List<VariableModel> variableModelsFilter = variableDeclares.stream().filter((x) -> x.isFinal() && x.isStatic()).collect(Collectors.toList());

        if (!variableModelsFilter.isEmpty()) {
            variableModelsFilter.forEach((x) -> {
                FieldDeclaration fieldDeclaration = getClassDeclaration()
                        .addFieldWithInitializer(new TypeParameter(x.getDataType())
                                , x.getVariableName()
                                , new StringLiteralExpr(x.getDefaultValue())
                                , getModifier(x.getModifier()));
                fieldDeclaration.setComment(new JavadocComment(x.getComment()));
                fieldDeclaration.setFinal(true);
                fieldDeclaration.setStatic(true);
            });
        }
    }

    /**
     * Add variables has been defined into class applicable target
     */
    private void addVariableField() {
        List<VariableModel> variableModelsFilter = variableDeclares.stream().filter((x) -> !(x.isFinal() && x.isStatic())).collect(Collectors.toList());

        if (!variableModelsFilter.isEmpty()) {
            variableModelsFilter.forEach((x) -> {
                FieldDeclaration fieldDeclaration = getClassDeclaration()
                        .addFieldWithInitializer(new TypeParameter(x.getDataType())
                                , x.getVariableName()
                                , new StringLiteralExpr(x.getDefaultValue())
                                , getModifier(x.getModifier()));
                fieldDeclaration.setComment(new JavadocComment(x.getComment()));

                if (x.isHasAnnotationGetterAndSetter()) {
                    fieldDeclaration.addAnnotation("Getter");
                    fieldDeclaration.addAnnotation("Setter");
                }
            });
        }
    }

    /**
     * add init method into applicable controller class
     */
    private void addInitMethod()  {
        IMethodTemplate initTemplateMethod = null;

        if (isMainWindow) {
            initTemplateMethod = new MethodTemplate(getSourceRoot().parse("", "TempMainwindowInitMethod.txt"));
        } else {
            initTemplateMethod = new MethodTemplate(getSourceRoot().parse("", "TempSubwindowInitMethod.txt"));
        }

        // add header comment
        List<String> wComments = new ArrayList<>();
        wComments.add("-------------------------------------------------------------------------");
        wComments.add(StringUtils.join(Const.ModifierString.get(Const.ACCESS_MODIFIER.PUBLIC), "初期処理"));
        wComments.add("-------------------------------------------------------------------------");
        wComments.forEach(line -> getClassDeclaration().addOrphanComment(new LineComment(line)));

        // add java doc function
        StringBuilder comments = new StringBuilder();
        comments.append("初期処理").append(Const.NEW_LINE);
        comments.append("@return 遷移先").append(Const.NEW_LINE);
        comments.append("@throws java.lang.Exception").append(Const.NEW_LINE);

        MethodDeclaration methodDeclaration = getClassDeclaration().addMethod("init", Modifier.Keyword.PUBLIC);
        methodDeclaration.setType("String");
        methodDeclaration.addThrownException(new TypeParameter("Exception"));
        methodDeclaration.setBody(initTemplateMethod.getBody());
        methodDeclaration.setComment(new JavadocComment(comments.toString()));

        methodDeclaration.getBody().ifPresent(stmt -> {
            if (stmt.isTryStmt()) {

                   BlockStmt tryBlock = stmt.asTryStmt().getTryBlock().clone();
                    tryBlock.getStatements().forEach(x -> {

                    if (x.isIfStmt()) {
                        if (((IfStmt)x).getCondition().isBooleanLiteralExpr()) {

                            Expression assignExpr = new AssignExpr();

                            assignExpr.addOrphanComment(new LineComment("**********************************************"));

                        }
                    }
                    System.out.println(x);
                });
            }

            stmt.addStatement(new ReturnStmt( new StringLiteralExpr(StringUtils.join("/", getSubPackage(), "/", getPgCd(), ".xhtml"))));
        });
    }

    /**
     * Add all methods has been defined into class applicable target
     */
    private void addMethods() {
        methodModels.forEach(method -> {
            makeHeaderMethod(method.getShortComment(), method.getIsPublic());
            IMethodTemplate template = method.getIsPublic() ? publicTemplate : privateTemplate;
            makeMethod(method, template);
        });
    }

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private boolean isMainWindow = true;

        private String classExtends = "";

        private Path pathResource = null;

        private String pgCd = "";

        private String pgName = "";

        private String author = "";

        private List<MethodModel> methodModels = new ArrayList<>();

        private List<VariableModel> variableDeclares = new ArrayList<>();

        public Builder() {}

        public Builder pathResource(Path path) {
            pathResource = path;
            return this;
        }

        public Builder isMainWindow(boolean flag) {

            this.isMainWindow = flag;
            return this;
        }

        public Builder author(String author) {

            this.author = author;
            return this;
        }

        public Builder pgCd(String pgCd) {

            this.pgCd = pgCd;
            return this;
        }

        public Builder pgName(String pgName) {

            this.pgName = pgName;
            return this;
        }

        public Builder classExtend(String classExt) {

            this.classExtends = classExt;
            return this;
        }

        public Builder methods(List<MethodModel> methods) {

            this.methodModels = methods;
            return this;
        }

        public Builder variables(List<VariableModel> variables) {

            this.variableDeclares = variables;
            return this;
        }

        public Generator build() {

            return new ControllerGenerator(pathResource, pgCd, pgName, author, classExtends, methodModels, variableDeclares, isMainWindow);
        }
    }
}
