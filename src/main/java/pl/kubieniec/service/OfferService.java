package pl.kubieniec.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pl.kubieniec.model.Offer;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.OfferRepository;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.UserRepository;

import java.time.LocalDateTime;

@Transactional
@Component
public class OfferService {

    @Autowired
    private OfferRepository offerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderRepository orderRepository;

    public void save(Offer offer, String login, Long id) {
        User user = userRepository.findUserByLogin(login);
        Order order = orderRepository.findOne(id);
        offer.setContractor(user);
        offer.setOrder(order);
        offerRepository.save(offer);
    }
}


