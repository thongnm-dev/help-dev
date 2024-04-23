
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity
@Data
public class UserIF implements Serializable {
    
    @Id
    private int id;
    
    private String usrId;
    
    private String pwd;
}
