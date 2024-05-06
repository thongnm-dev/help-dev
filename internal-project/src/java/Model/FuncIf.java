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

@Table(name = "t_func")
@Entity
@Getter
@Setter
@ToString
public class FuncIf implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "func_name")
    private String funcName;

    @Column(name = "return_value")
    private String returnValue;

    @Column(name = "func_param")
    private String params;

    @Column(name = "func_comment")
    private String funcComment;

    @Column(name = "func_comment_vn")
    private String funcCommentVn;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private ProjectIF project;
}
