
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import lombok.Data;

@Entity(name = "table_if")
@Data
public class TableIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Table physical
     */
    private String physical;

    /**
     * Comment on table Japanese
     */
    private String logical;

    /**
     * This is mean of table Vietnamese
     */
    @Column(name = "logical_v")
    private String logicalVn;

    @OneToOne
    @JoinColumn(name = "project_id")
    private ProjectIF projectIF;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_table_dtl", columnDefinition = "table_id")
    private List<TableDetailIF> tableDetails;
}
