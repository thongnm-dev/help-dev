package model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DomainModel {

    private String table_physical;

    private String table_logical;

    private String physical;

    private String data_type;

    private boolean pk;

    private boolean nullable;

    private String logical;
}
