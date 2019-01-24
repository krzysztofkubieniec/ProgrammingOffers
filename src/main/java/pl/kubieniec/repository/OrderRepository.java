package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.Technology;
import pl.kubieniec.model.User;

import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findAllByEndAfterAndEmployerOrderByEndAsc(Date date, User employer);

    List<Order> findAllByEndBeforeAndEmployerOrderByEndDesc(Date date, User employer);

    List<Order> findTop10ByEndAfterOrderByEndAsc(Date date);

    List<Order> findTop10ByCategoriesInAndTechnologiesInOrderByEndAsc(List<Category> categories, List<Technology> technologies);

    List<Order> findTop10ByCategoriesInOrderByEndAsc(List<Category> categories);

    List<Order> findTop10ByTechnologiesInOrderByEndAsc(List<Technology> technologies);

    long count();
}
