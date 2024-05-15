package entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_mst_cd")
@Entity
@Getter
@Setter
@ToString
public class MstIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JoinColumn(name = "mst_kbn")
    private String mstKbn;
    /**
     * Table physical
     */
    @Column(name = "prm_json", columnDefinition = "jsonb")
    private String prmInfo;

    @Column(name = "project_id")
    private Long projectId;

}
