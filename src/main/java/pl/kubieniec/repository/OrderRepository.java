package pl.kubieniec.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.Technology;
import pl.kubieniec.model.User;

import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findAllByEndAfter(Date date, Pageable pageable);

    Page<Order> findByEndAfterAndTitleContaining(Date date, String title, Pageable pageable);

    List<Order> findAllByEndAfterAndEmployerOrderByEndAsc(Date date, User employer);

    List<Order> findAllByEndBeforeAndEmployerOrderByEndDesc(Date date, User employer);

    Page<Order> findByEndAfterAndCategoriesInAndTechnologiesInAndTitleContaining(Date date, List<Category> categories, List<Technology> technologies, String title, Pageable pageable);

    Page<Order> findByEndAfterAndCategoriesInAndTitleContaining(Date date, List<Category> categories, String title, Pageable pageable);

    Page<Order> findByEndAfterAndTechnologiesInAndTitleContaining(Date date, List<Technology> technologies, String title, Pageable pageable);
}
