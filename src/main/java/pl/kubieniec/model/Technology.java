package pl.kubieniec.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "technology")
@Data
public class Technology {
    @Id
    @GeneratedValue
    private Long id;
    private String name;
}
