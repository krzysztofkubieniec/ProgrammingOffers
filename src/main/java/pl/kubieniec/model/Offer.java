package pl.kubieniec.model;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
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
    @DecimalMin("0.00")
    @Digits(integer = 8, fraction = 2)
    private double price;
    @ManyToOne
    private Order order;
    @ManyToOne
    private User contractor;

}
