package pl.kubieniec.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.UserRepository;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Transactional
@Component
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    public List<Order> findTop10() {
        return orderRepository.findTop10ByEndAfterOrderByEndAsc(new Date());
    }

    public void save(Order order, String login) {
        Calendar nowCalendar = Calendar.getInstance();
        Date now = nowCalendar.getTime();
        order.setCreated(now);
        Date end = order.getEnd();
        Calendar endCalendar = Calendar.getInstance();
        endCalendar.setTime(end);
        endCalendar.set(Calendar.HOUR_OF_DAY, nowCalendar.get(Calendar.HOUR_OF_DAY));
        endCalendar.set(Calendar.MINUTE, nowCalendar.get(Calendar.MINUTE));
        endCalendar.set(Calendar.SECOND, nowCalendar.get(Calendar.SECOND));
        end = endCalendar.getTime();
        order.setEnd(end);
        User user = userRepository.findUserByLogin(login);
        order.setEmployer(user);
        orderRepository.save(order);
    }

    public List<Order> findActiveOrdersByUser(User user) {
        return orderRepository.findAllByEndAfterAndEmployerOrderByEndAsc(new Date(),user);
    }
}


