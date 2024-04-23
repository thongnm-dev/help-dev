
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity(name = "dictionary_if")
@Data
public class DictionaryIF implements Serializable {

    @Id
    private Long id;
}
