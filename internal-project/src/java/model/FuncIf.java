package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity(name = "func_if")
@Data
public class FuncIf implements Serializable {

    @Id
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
}
