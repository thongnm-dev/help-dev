package Model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_note")
@Entity
@Getter
@Setter
@ToString
public class NoteIF implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "note_dtl")
    private String noteDtl;

    @Column(name = "note_type")
    private String noteType;

    /**
     * 1: TKCT; 2: PG; 3: PCL: 4: UT
     */
    @Column(name = "note_of_phase")
    private String noteOfPhase;

    @JoinColumn(name = "project_id")
    private ProjectIF project;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "note")
    private Set<NoteDetailIF> notes;
}
