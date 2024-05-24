package model;

import java.util.ArrayList;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TableJoin {

    private Item join;

    private String alias;
    
    private List<Item> columns = new ArrayList<>();
        
    private List<ConditionModel> whereJoins = new ArrayList<>();
}
