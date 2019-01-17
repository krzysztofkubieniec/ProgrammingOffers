package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Offer;
import pl.kubieniec.model.Order;

import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {

    List<Offer> findAllByOrder(Order order);

}
