package entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "t_table_dtl")
@Getter
@Setter
@ToString
public class TableColumnIF implements Serializable {

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
    @Column(name = "data_type")
    private String dataType;

    /**
     *
     */
    @Column(name = "max_length")
    private String maxLength;

    /**
     *
     */
    @Column(name = "is_fk")
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
    @Column(name = "logical_v")
    private String logicalVn;

    /**
     * 
     */
    @Column(name = "table_name")
    private String tableName;
    
    @Column(name = "project_id")
    private Long projectId;
}
