package model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TableColumnModel {
    
    private Long id;
    
    private String physical;
    
    private String data_type;
    
    private String max_length;
    
    private boolean is_pk;
    
    private boolean nullable;
    
    private String logical;
    
    private String logical_v;
}
