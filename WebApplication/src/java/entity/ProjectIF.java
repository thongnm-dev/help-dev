package entity;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import java.util.Collection;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_project")
@Entity
@Getter
@Setter
@ToString
@NamedQueries({
    @NamedQuery(
            name = "GET_ALL_PROJECT",
            query = "SELECT p FROM ProjectIF p WHERE 1 = 1"
    )
})
public class ProjectIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Project Code
     */
    @Column(name = "project_cd")
    private String projectCd;

    /**
     * Project Name
     */
    @Column(name = "project_name")
    private String projectName;

    @Column(name = "project_descript")
    private String projectDescript;

    @Column(name ="start_date")
    private Date startDate;

    @Column(name ="end_date")
    private Date endDate;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "project")
    private DbConection dbConnection;
    
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "project")
    private Collection<Setting> settings;
}
