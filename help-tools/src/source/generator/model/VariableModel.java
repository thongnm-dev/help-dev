package source.generator.model;

import lombok.Data;

@Data
public class VariableModel {

    /**
     * Modifier
     */
    private String modifier;

    /**
     * Data type
     */
    private String dataType;

    /**
     * Variable name
     */
    private String variableName;

    /**
     * Comment
     */
    private String comment;

    /**
     * final flag
     */
    private boolean isFinal = false;

    /**
     * static flag
     */
    private boolean isStatic = false;

    /**
     * flag anotation Getter-Setter
     */
    private boolean hasAnnotationGetterAndSetter = false;

    /**
     * Default value
     */
    private String defaultValue;
}
