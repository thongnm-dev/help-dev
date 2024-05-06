package source.generator.model;

import lombok.Data;

@Data
public class FieldModel {

    private String dataType;

    private String paramName;

    private String comment;

    private String defaultValue;
}
