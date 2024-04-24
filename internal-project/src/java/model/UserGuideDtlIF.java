
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_user_guide_dtl")
@Entity
@Getter
@Setter
@ToString
public class UserGuideDtlIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "descript_note")
    private String descriptNote;

    @Column(name = "descript_note_v")
    private String descriptNoteVn;
}
