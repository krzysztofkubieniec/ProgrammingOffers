package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.User;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
