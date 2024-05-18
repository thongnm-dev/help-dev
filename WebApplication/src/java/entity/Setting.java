package entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_setting")
@Entity
@Getter
@Setter
@ToString
public class Setting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "setting_type", length = 10)
    private String type;
    
    @Column(name = "setting_json", columnDefinition = "jsonb")
    private String setting;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private ProjectIF project;
}
