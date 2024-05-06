package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
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
    @Column(name = "prm_cd")
    private String prmCd;

    /**
     * Comment on table Japanese
     */
    @Column(name = "prm_ms")
    private String PrmMs;

    /**
     * This is mean of table Vietnamese
     */
    @Column(name = "prm_ms_v")
    private String PrmMsVn;
    /**
     * This is mean of table Vietnamese
     */
    @Column(name = "prm_value")
    private String PrmValue;

    /**
     * This is mean of table Vietnamese
     */
    @Column(name = "prm_label")
    private String PrmLabel;

    /**
     * This is mean of table Vietnamese
     */
    @Column(name = "prm_label_v")
    private String PrmLabelVn;

    /**
     * This is mean of table Vietnamese
     */
    @Column(name = "prm_order")
    private Long prmOrder;

    @OneToOne
    @JoinColumn(name = "project_id")
    private ProjectIF project;

}
