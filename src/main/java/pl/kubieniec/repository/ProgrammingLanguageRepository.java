package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.ProgrammingLanguage;
import pl.kubieniec.model.User;

public interface ProgrammingLanguageRepository extends JpaRepository<ProgrammingLanguage, Long> {

}
