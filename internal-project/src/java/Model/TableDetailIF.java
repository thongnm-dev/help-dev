package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "t_table_dtl")
@Getter
@Setter
@ToString
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
    private TableIF table;
}
