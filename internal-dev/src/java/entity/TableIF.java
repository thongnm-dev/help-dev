package entity;

import java.io.Serializable;
import java.util.Set;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_table")
@Entity
@Getter
@Setter
@ToString
@NamedQueries({
    @NamedQuery(
            name = "GET_ALL_TABLE",
            query = "SELECT t FROM TableIF t WHERE t.project.id = :project"
    )
})
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
    private ProjectIF project;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "table")
    private Set<TableDetailIF> tableDtls;

}
