package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import lombok.Data;

@Entity
@Data
public class TableDetailIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 
     */
    private String physical;

    /**
     * 
     */
    private String dataType;

    /**
     * 
     */
    private String maxLength;

    /**
     * 
     */
    private boolean isPrimaryKey;

    /**
     * 
     */
    private boolean nullable;

    /**
     * 
     */
    private String logical;

    /**
     * 
     */
    private String logicalVn;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "table_id")
    private TableIF tableIF;
}
