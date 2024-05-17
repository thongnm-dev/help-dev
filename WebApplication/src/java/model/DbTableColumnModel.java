package model;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
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
    
    private String max_length;

    private boolean pk;

    private boolean nullable;

    private String logical;
    
    private Integer numeric_precision;
    
    private Integer numeric_scale;
    
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
    
    public boolean isDateTime() {
        List<String> datetimes = Arrays.asList("date", "timestamp");
        return datetimes.stream().anyMatch(character -> StringUtils.contains(data_type, character));
    }
    
    public boolean isCharacter() {
        List<String> characters = Arrays.asList("varchar", "text", "character");
        return characters.stream().anyMatch(character -> StringUtils.contains(data_type, character));
    }
    
    public String getData_type() {
        
        if (isNumeric()) {
            if (Objects.nonNull(numeric_precision)) {
                if (Objects.nonNull(numeric_scale) && numeric_scale > 0) {
                    return StringUtils.join(data_type, " (", numeric_precision, ",", numeric_scale, ")");
                }
                return StringUtils.join(data_type, " (", numeric_precision, ")");
            }
        }
        return data_type;
    }
}
