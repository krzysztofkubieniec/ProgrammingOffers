package pl.kubieniec.model;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "offer")
@Data
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Size(min = 2, max = 500)
    @NotBlank
    private String message;
    private Integer price;
    @ManyToOne
    private Order order;
    @ManyToOne
    private User contractor;

}
