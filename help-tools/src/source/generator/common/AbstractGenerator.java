package source.generator.common;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.Modifier;
import com.github.javaparser.ast.NodeList;
import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
import com.github.javaparser.ast.body.MethodDeclaration;
import com.github.javaparser.ast.body.Parameter;
import com.github.javaparser.ast.comments.JavadocComment;
import com.github.javaparser.ast.comments.LineComment;
import com.github.javaparser.ast.stmt.ReturnStmt;
import com.github.javaparser.ast.type.ClassOrInterfaceType;
import com.github.javaparser.ast.type.TypeParameter;
import com.github.javaparser.utils.SourceRoot;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import source.generator.model.MethodModel;
import source.utils.Const;

import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;


public abstract class AbstractGenerator implements Generator {

    @Getter
    private CompilationUnit compilationUnit = null;

    @Setter
    @Getter
    private SourceRoot sourceRoot = null;

    @Getter
    private ClassOrInterfaceDeclaration classDeclaration = null;

    @Setter
    @Getter
    private Path pathResource = null;

    @Setter
    @Getter
    private String pgCd = "";

    @Setter
    @Getter
    private String pgName = "";

    @Setter
    @Getter
    private String author = "";

    /**
     * Skeleton type generate
     *
     * @return type generate
     */
    protected abstract String getSkeletonType();

    protected String getDescription() {
        return Const.SHORT_DESCRIPTIONS_LICENCE_HEADER.get(getSkeletonType());
    }

    protected abstract String extendsClass();

    protected String modelClass() {
        return StringUtils.join(pgCd, Const.MODEL);
    }

    /**
     * full applicable controller class name
     *
     * @return controller class name
     */
    protected String getClassName() {
        return StringUtils.join(pgCd, getSkeletonType(), ".java");
    }

    /**
     * full applicable gateway class name
     *
     * @return gateway class name
     */
    protected String getGatewayClass() {
        return StringUtils.join(pgCd, Const.GATEWAY);
    }

    protected String getSubPackage() {
        return StringUtils.split(pgCd, "_")[0];
    }

    protected String getPackageBusiness() {
        String[] wArrays = StringUtils.split(pgCd, "_");

        return StringUtils.substring(wArrays[wArrays.length - 1], 0, 2);
    }

    @Override
    public void generate() {

        switch (getSkeletonType()) {
            case Const.CONTROLLER:
                compilationUnit = sourceRoot.parse("", "TemplateController.txt");
                break;
            case Const.GATEWAY:
                compilationUnit = sourceRoot.parse("", "TemplateGateway.txt");
                break;
            case Const.MODEL:
                compilationUnit = sourceRoot.parse("", "TemplateModel.txt");
                break;
        }

        // set license header
        compilationUnit.setComment(new JavadocComment(makeLicencesHeader(pgCd, pgName, author)));
        // add package
        compilationUnit.setPackageDeclaration(StringUtils.join(getSkeletonType().toLowerCase(), ".", getSubPackage(), ".", getPackageBusiness()));
        // add import inherit
        compilationUnit.addImport(StringUtils.join("common.", getSkeletonType().toLowerCase(), ".", extendsClass()));
        // Get class define
        Optional<ClassOrInterfaceDeclaration> declaration = compilationUnit.findFirst(ClassOrInterfaceDeclaration.class);
        // rename java class
        declaration.ifPresent(this::changeClassName);
        // change extended class
        declaration.ifPresent(this::setExtendedClass);
        // make java doc class
        declaration.ifPresent(this::makeJavaDocClass);
        declaration.ifPresent(stmt -> classDeclaration = stmt);
    }

    /**
     * get system date
     *
     * @return sysdate
     */
    protected String getSysDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
        return format.format(new Date());
    }

    /**
     * load template method public and private
     *
     * @return template
     */
    protected Pair<IMethodTemplate, IMethodTemplate> loadTemplate() {
        IMethodTemplate publicTemp = new MethodTemplate(sourceRoot.parse("", "TempPublicMethod.txt"));
        IMethodTemplate privateTemp = new MethodTemplate(sourceRoot.parse("", "TemplatePrivateMethod.txt"));

        return Pair.of(privateTemp, publicTemp);
    }

    /**
     * make java doc licence header of applicable class
     *
     * @param pPgCd   applicable class
     * @param pPgName program description
     * @param pAuthor author
     * @return licence
     */
    protected String makeLicencesHeader(String pPgCd, String pPgName, String pAuthor) {

        return StringUtils.join("機能名称： ", pPgCd, getSkeletonType()) + Const.NEW_LINE +
                StringUtils.join("新規作成： Energia Communications ", pAuthor) + Const.NEW_LINE +
                StringUtils.join("機能概要： ", pPgName, getDescription()) + Const.NEW_LINE +
                "使用方法：" + Const.NEW_LINE +
                "前提条件：" + Const.NEW_LINE +
                StringUtils.join("更新履歴： Rev001 - ", getSysDate(), " - ALX ", pAuthor, "    新規作成") + Const.NEW_LINE;
    }

    /**
     * Make short description for functionality
     *
     * @param pContent content
     * @param isPublic flag public
     */
    protected void makeHeaderMethod(String pContent, boolean isPublic) {
        List<String> wComments = new ArrayList<>();
        wComments.add("-------------------------------------------------------------------------");
        wComments.add(StringUtils.join(Const.ModifierString.get(isPublic ? Const.ACCESS_MODIFIER.PUBLIC : Const.ACCESS_MODIFIER.PRIVATE), pContent));
        wComments.add("-------------------------------------------------------------------------");

        wComments.forEach(line -> classDeclaration.addOrphanComment(new LineComment(line)));
    }

    /**
     * Setup inherit class
     *
     * @param pClass class
     */
    protected void setExtendedClass(ClassOrInterfaceDeclaration pClass) {

        NodeList<ClassOrInterfaceType> extendedClass = new NodeList<>();

        ClassOrInterfaceType classOrInterfaceType = new ClassOrInterfaceType();

        classOrInterfaceType.setName(extendsClass());

        extendedClass.add(classOrInterfaceType);

        pClass.setExtendedTypes(extendedClass);
    }

    /**
     * make java doc class
     *
     * @param pClass class
     */
    private void makeJavaDocClass(ClassOrInterfaceDeclaration pClass) {

        StringBuilder sb = new StringBuilder();

        Const.JAVA_DOC_CLASS.get(getSkeletonType()).forEach((x) -> {
            sb.append(StringUtils.join(pgName, x)).append(Const.NEW_LINE);
        });

        pClass.setComment(new JavadocComment(sb.toString()));
    }

    /**
     * change java class with applicable object
     *
     * @param pClass Class
     */
    private void changeClassName(ClassOrInterfaceDeclaration pClass) {
        pClass.setName(StringUtils.join(pgCd, getSkeletonType()));
    }

    /**
     * create method inside Java class by specification information
     *
     * @param methodModel Method information
     * @param template    Template method
     */
    protected void makeMethod(MethodModel methodModel, IMethodTemplate template) {
        MethodDeclaration methodDeclaration = classDeclaration.addMethod(methodModel.getMethodName(), getModifier(methodModel.getModifier()));

        methodDeclaration.setType(methodModel.getReturnType());
        methodDeclaration.setBody(template.getBody());

        StringBuilder sbParams = new StringBuilder();
        sbParams.append(methodModel.getShortComment()).append(Const.NEW_LINE);

        // when the parameter is existed, perform add parameter for method
        if (!methodModel.getParams().isEmpty()) {
            methodModel.getParams().forEach(param -> {
                sbParams.append(StringUtils.join("@param ", param.getParamName(), " ", param.getComment()));
                methodDeclaration.addParameter(new Parameter(new TypeParameter(param.getDataType()), param.getParamName()));
            });
        }

        if (!"void".equals(methodModel.getReturnType())) {
            methodDeclaration.getBody().ifPresent(stmt -> stmt.addStatement(new ReturnStmt()));
        }

        sbParams.append(StringUtils.SPACE).append(Const.NEW_LINE);
        methodDeclaration.setComment(new JavadocComment(sbParams.toString()));
    }

    /**
     * Mapping access modifier
     *
     * @param pModifier modifier
     * @return modifier
     */
    protected Modifier.Keyword getModifier(String pModifier) {
        switch (pModifier) {
            case "public":
                return Modifier.Keyword.PUBLIC;
            case "private":
                return Modifier.Keyword.PRIVATE;
            case "protected":
                return Modifier.Keyword.PROTECTED;
            default:
                return Modifier.Keyword.DEFAULT;
        }
    }
}
