
package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_note_dtl")
@Entity
@Getter
@Setter
@ToString
public class NoteDetailIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(name = "img_path")
    private String imagePath;

    @Column(name = "short_descript")
    private String descript;

    @ManyToOne
    @JoinColumn(name = "note_id")
    private NoteIF note;
}
