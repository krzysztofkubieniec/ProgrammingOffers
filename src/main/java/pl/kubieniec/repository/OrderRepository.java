package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findTop10ByOrderByEndDesc();
}
