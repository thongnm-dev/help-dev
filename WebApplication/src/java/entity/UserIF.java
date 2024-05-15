package entity;

import java.io.Serializable;
import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
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
    private Long id;

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
