package entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_note")
@Entity
@Getter
@Setter
@ToString
public class NoteIF {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private Long project_id;
    
    @Column(name = "note_type")
    private String note_type;
    
    @Column(name = "note_data", columnDefinition = "text")
    private String note_data;
}
