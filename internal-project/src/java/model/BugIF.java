
package model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import lombok.Data;

@Entity(name = "bug_if")
@Data
public class BugIF implements Serializable {

    @Id
    private Long id;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_bug", columnDefinition = "bug_id")
    private Set<BugDetailIF> bugDetailIFs;
}
