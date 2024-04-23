package model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToMany;
import lombok.Data;

@Entity(name = "user_if")
@Data
public class UserIF implements Serializable {

    @Id
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
    @JoinColumns(
            value = {
                @JoinColumn(name = "usr_id"),
                @JoinColumn(name = "project_id")
            }
    )
    private Set<ProjectIF> projectIFs;
}
