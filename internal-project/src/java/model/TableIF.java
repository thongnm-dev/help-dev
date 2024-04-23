
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import lombok.Data;

@Entity
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
    private String logicalVn;

    @OneToOne
    @JoinColumn(name = "project_id")
    private ProjectIF projectIF;

    @OneToMany(fetch = FetchType.LAZY)
    private List<TableDetailIF> tableDetails;
}
