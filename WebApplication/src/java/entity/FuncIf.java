package entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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

    private Long project_id;
}
