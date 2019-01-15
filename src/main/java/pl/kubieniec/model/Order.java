package pl.kubieniec.model;

import lombok.Data;
import lombok.Getter;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
@Data
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 2, max = 50)
    @NotBlank
    private String title;

    @Size(min = 2, max = 2000)
    @NotBlank
    private String content;

    private Date created;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Future
    private Date end;

    @ManyToOne
    @JoinColumn(name = "employer_id")
    private User employer;

    @ManyToOne
    @JoinColumn(name = "executor_id")
    private User executor;

    @ManyToMany
    private List<Category> categories;

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public void setEmployer(User employer) {
        this.employer = employer;
    }

    public void setExecutor(User executor) {
        this.executor = executor;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public int getHoursTillEnd() {
        if (end != null) {
            return (int) ((end.getTime() - Calendar.getInstance().getTime().getTime()) / (1000 * 60 * 60));
        }
        return 0;
    }

    public String getShortenContent() {
        if (content.length() > 100) {
            String text = content;
            text = text.substring(0, 100) + " ...";
            return text;
        }
        return content;
    }

}
