package entity;

import java.io.Serializable;
import java.util.Set;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
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
