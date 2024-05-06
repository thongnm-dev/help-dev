package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_common_param",
        uniqueConstraints = {@UniqueConstraint(columnNames = {"prm_id", "prm_cd"}) })
@Entity
@Getter
@Setter
@ToString
public class CommonParamIF implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "prm_id")
    private String prmId;

    @Column(name = "prm_name")
    private String prmName;

    @Column(name = "prm_cd")
    private String prmCd;

    @Column(name = "prm_value")
    private String prmValue;

    @Column(name = "prm_order")
    private int orderBy;
}
