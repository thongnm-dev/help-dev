
package entity;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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
