
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity(name = "task_if")
@Data
public class TaskIF implements Serializable {

    @Id
    private Long id;
}
