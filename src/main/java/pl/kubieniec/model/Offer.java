package pl.kubieniec.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "offer")
@Data
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String message;
    private Integer price;
    @ManyToOne
    private Order order;
    @ManyToOne
    private User contractor;

}
