package source.generator.model;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class MethodModel {

    /**
     * Method modifier
     */
    private String modifier;

    /**
     * Method name
     */
    private String methodName;

    /**
     * Return value
     */
    private String returnType;

    /**
     * Description
     */
    private String comment;

    /**
     * Short description
     */
    private String shortComment;

    /**
     * Parameter
     */
    private List<FieldModel> params;

    private List<String> bodyInlines = new ArrayList<>();

    public boolean getIsPublic() {
        return "public".equals(modifier);
    }
}
