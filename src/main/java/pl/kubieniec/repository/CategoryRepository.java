package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
