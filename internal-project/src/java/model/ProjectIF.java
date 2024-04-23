
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity
@Data
public class ProjectIF implements Serializable {
    
    @Id
    private int id;

    private String projectCd;
    
    private String projectName;
}
