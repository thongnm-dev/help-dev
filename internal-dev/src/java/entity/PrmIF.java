package entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_prm",
        uniqueConstraints = {@UniqueConstraint(columnNames = {"prm_id", "prm_cd"}) })
@Entity
@Getter
@Setter
@ToString
public class PrmIF implements Serializable {
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
