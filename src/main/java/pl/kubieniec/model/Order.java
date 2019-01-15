package pl.kubieniec.model;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "order")
@Data
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
//
//    @Size(min = 2, max = 50)
//    @NotBlank
//    private String title;
//
//    @Size(min = 2, max = 2000)
//    @NotBlank
//    private String text;
//
//    private LocalDateTime created;
//
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private LocalDate end;
//
//    @ManyToOne
//    @JoinColumn(name = "employer_id")
//    private User employer;
//
//    @ManyToOne
//    @JoinColumn(name = "executor_id")
//    private User executor;
//
//    @ManyToMany
//    private List<Category> categories;
}
