package pl.kubieniec.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.UserRepository;

import java.time.LocalDateTime;

@Transactional
@Component
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    public void save(Order order, String login) {
        order.setCreated(LocalDateTime.now());
        User user = userRepository.findUserByLogin(login);
        order.setEmployer(user);
        orderRepository.save(order);
    }
}


