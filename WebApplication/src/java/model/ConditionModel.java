package model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ConditionModel {
    
    private boolean isOn;

    private String operation;

    private Item column_one;

    private String condition;

    private Item column_two;
}
