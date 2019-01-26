package pl.kubieniec.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "technology")
@Data
public class Technology {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
}
