package pl.kubieniec.model;

import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import pl.kubieniec.validate.CreatingAndUpdateingOrder;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
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

    @Size(min = 2, max = 100)
    @NotBlank
    private String title;

    @Size(min = 2, max = 5000)
    @NotBlank
    private String content;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss.S")
    private Date created;

    private Date updated;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.S")
    @Future
    @NotNull
    private Date end;

    @ManyToOne
    @JoinColumn(name = "employer_id")
    private User employer;

    @ManyToOne
    @JoinColumn(name = "executor_id")
    private User executor;

    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Category> categories;

    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Technology> technologies;

    public int getHoursTillEnd() {
        if (end != null) {
            return (int) ((end.getTime() - Calendar.getInstance().getTime().getTime()) / (1000 * 60 * 60));
        }
        return 0;
    }

    public String getShortenContent() {
        if (content.length() > 500) {
            String text = content;
            text = text.substring(0, 500) + " ...";
            return text;
        }
        return content;
    }


}
