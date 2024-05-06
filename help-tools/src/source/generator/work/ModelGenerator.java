package source.generator.work;

import com.github.javaparser.ast.Modifier;
import com.github.javaparser.ast.body.FieldDeclaration;
import com.github.javaparser.ast.comments.JavadocComment;
import com.github.javaparser.ast.type.TypeParameter;
import lombok.Setter;
import source.generator.common.AbstractGenerator;
import source.generator.model.FieldModel;
import source.utils.Const;

import java.util.ArrayList;
import java.util.List;

@Setter
public class ModelGenerator extends AbstractGenerator {

    private List<FieldModel> fields = new ArrayList<>();

    @Override
    protected String getSkeletonType() {
        return Const.MODEL;
    }

    @Override
    protected String extendsClass() {
        return "EcEntity";
    }

    @Override
    public void generate() {
        fields.forEach(field -> {
            FieldDeclaration declaration = getClassDeclaration()
                    .addFieldWithInitializer(new TypeParameter(field.getDataType()), field.getParamName(), null, Modifier.Keyword.PRIVATE);
            declaration.setComment(new JavadocComment(field.getComment()));
        });
    }
}
