package model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TableModel {
    
    private Long id;
    
    private String physical;
    
    private String logical;
    
    private String logical_v;
    
    private Long projectId;
}
