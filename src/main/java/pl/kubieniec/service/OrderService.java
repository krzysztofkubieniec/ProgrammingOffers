package pl.kubieniec.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.Technology;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.UserRepository;
import sun.util.resources.cldr.te.CalendarData_te_IN;

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
        User user = userRepository.findUserByLogin(login);
        order.setEmployer(user);
        orderRepository.save(order);
    }

    public void update(Order order) {
        order.setUpdated(Calendar.getInstance().getTime());
        orderRepository.save(order);
    }

    public void end(Long id) {
        Long time = Calendar.getInstance().getTime().getTime() - 1000;
        orderRepository.findOne(id).setEnd(new Date(time));
    }

    public List<Order> findActiveOrdersByUser(User user) {
        return orderRepository.findAllByEndAfterAndEmployerOrderByEndAsc(new Date(), user);
    }

    public List<Order> findNonActiveOrdersByUser(User user) {
        return orderRepository.findAllByEndBeforeAndEmployerOrderByEndDesc(new Date(), user);
    }

    public Boolean validateOrderByUser(String login, Long orderId) {
        User user = userRepository.findUserByLogin(login);
        Order order = orderRepository.findOne(orderId);
        if (order.getEmployer().equals(user)) {
            return true;
        }
        return false;
    }

    public List<Order> filter(List<Category> categories, List<Technology> technologies) {
        if (categories != null && technologies == null) {
            return orderRepository.findTop10ByCategoriesInOrderByEndAsc(categories);
        }
        if (categories == null && technologies != null) {
            return orderRepository.findTop10ByTechnologiesInOrderByEndAsc(technologies);
        }
        return orderRepository.findTop10ByCategoriesInAndTechnologiesInOrderByEndAsc(categories, technologies);
    }

}


