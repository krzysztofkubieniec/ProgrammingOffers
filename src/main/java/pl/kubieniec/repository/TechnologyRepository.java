package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Technology;

public interface TechnologyRepository extends JpaRepository<Technology, Long> {

}
