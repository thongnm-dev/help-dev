
package model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import lombok.Data;

@Entity(name = "project_if")
@Data
public class ProjectIF implements Serializable {

    @Id
    private int id;

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

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinColumns(value = {
        @JoinColumn(name = "usr_id"),
        @JoinColumn(name = "project_id")
    })
    private Set<UserIF> users;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_func", columnDefinition = "func_id")
    private Set<FuncIf> funcIfs;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_table", columnDefinition = "table_id")
    private Set<TableIF> tableIFs;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_task", columnDefinition = "task_id")
    private Set<TaskIF> taskIFs;
}
