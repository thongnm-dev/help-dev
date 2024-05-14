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

@Table(name = "t_table")
@Entity
@Getter
@Setter
@ToString
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

    @Column(name = "project_id")
    private Long projectId;

}
