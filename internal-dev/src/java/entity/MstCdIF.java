package entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_mst_cd")
@Entity
@Getter
@Setter
@ToString
public class MstCdIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Table physical
     */
    @Column(name = "prm_json", columnDefinition = "jsonb")
    private String prmInfo;

    @OneToOne
    @JoinColumn(name = "project_id")
    private ProjectIF project;

}
