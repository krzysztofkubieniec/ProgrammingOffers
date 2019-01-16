package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.User;

import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findTop10ByEndAfterOrderByEndAsc(Date date);
    List<Order> findAllByEndAfterAndEmployerOrderByEndAsc(Date date, User employer);

}
