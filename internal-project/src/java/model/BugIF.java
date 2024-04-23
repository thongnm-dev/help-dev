
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity
@Data
public class BugIF implements Serializable {

    @Id
    private Long id;
    
}
