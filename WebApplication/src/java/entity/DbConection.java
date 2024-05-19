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

@Table(name = "t_connection")
@Entity
@Getter
@Setter
@ToString
public class DbConection implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "db_url")
    private String dbUrl;

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
