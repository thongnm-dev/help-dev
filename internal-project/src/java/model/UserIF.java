package model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_user")
@Entity
@Getter
@Setter
@ToString
public class UserIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    /**
     * User Id
     */
    @Column(name = "usr_id")
    private String usrId;

    /**
     * Password
     */
    private String pwd;

    /**
     * User name
     */
    @Column(name = "urs_name")
    private String usrName;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "t_user_role",
            joinColumns = @JoinColumn(name = "usr_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<RoleIF> roles;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "t_user_project",
            joinColumns = @JoinColumn(name = "usr_id"),
            inverseJoinColumns = @JoinColumn(name = "project_id")
    )
    private Set<ProjectIF> projects;
}
