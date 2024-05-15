package entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_document")
@Entity
@Getter
@Setter
@ToString
public class Document implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name ="file_type")
    private String fileType;
    
    @Column(name = "file_name")
    private String fileName;
    
    private String descriptions;
    
    @Column(name = "file_path")
    private String filePath;
}
