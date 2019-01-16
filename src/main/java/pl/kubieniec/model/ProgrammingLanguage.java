package pl.kubieniec.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "programming_language")
@Data
public class ProgrammingLanguage {
    @Id
    @GeneratedValue
    private Long id;
    private String name;
}
