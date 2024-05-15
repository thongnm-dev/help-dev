package model;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.commons.lang3.StringUtils;

@Getter
@Setter
@ToString
public class DbTableColumnModel {

    private Long id;

    private String physical;

    private String data_type;

    private boolean pk;

    private boolean nullable;

    private String logical;
    
    private String setting;
    
    private String random;
    
    private String param;
    
    private String ref;
    
    private BigDecimal incre;
    
    private boolean disable_random_otp = true;
    
    private boolean disable_param = true;
    
    private boolean disable_ref = true;
    
    private boolean disable_incre = true;
    
    public boolean isNumeric() {
        List<String> numerics = Arrays.asList("numeric", "bigint");
        return numerics.stream().anyMatch(character -> StringUtils.contains(data_type, character));
    }
    
    public boolean isDate() {
        return StringUtils.contains(data_type, "date");
    }
    
    public boolean isCharacter() {
        List<String> characters = Arrays.asList("varchar", "text", "character");
        return characters.stream().anyMatch(character -> StringUtils.contains(data_type, character));
    }
}
