package model;

import java.math.BigDecimal;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
}
