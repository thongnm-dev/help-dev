package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import lombok.Data;

@Entity(name = "table_dtl_if")
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

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "table_id")
    private TableIF tableIF;
}
