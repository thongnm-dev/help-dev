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

@Table(name = "t_connection")
@Entity
@Getter
@Setter
@ToString
public class DbConection implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "db_host")
    private String dbHost;

    @Column(name = "db_port")
    private String dbPort;

    @Column(name = "db_target")
    private String dbTarget;

    @Column(name = "db_schema")
    private String dbSchema;

    @Column(name = "db_usr")
    private String dbUsr;

    @Column(name = "db_pass")
    private String dbPass;

    @OneToOne
    @JoinColumn(name = "project_id")
    private ProjectIF project;
}
