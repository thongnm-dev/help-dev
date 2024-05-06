
package Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Table(name = "t_daily_work")
@Entity
@Getter
@Setter
@ToString
public class DailyWorkIF implements Serializable  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "current_date")
    private Date currentDate;

    @Column(name = "work_next_date")
    private Date workNextDate;

    @Column(name = "work_note")
    private String workNote;

    @Column(name = "work_next_plan")
    private String workNextPlan;

    @Column(name = "work_completed")
    private boolean completed;

    @Column(name = "completed_date")
    private Date completedDate;
}
