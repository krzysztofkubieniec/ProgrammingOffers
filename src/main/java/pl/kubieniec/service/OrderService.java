package pl.kubieniec.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.Technology;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.UserRepository;
import sun.util.resources.cldr.te.CalendarData_te_IN;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Transactional
@Component
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    static final int PAGE_SIZE = 5;

    public List<Order> findActiveOrdersByUser(User user) {
        return orderRepository.findAllByDeletedAndEmployerOrderByEndAsc(false, user);
    }

    public List<Order> findNonActiveOrdersByUser(User user) {
        return orderRepository.findAllByDeletedAndEmployerOrderByEndDesc(true, user);
    }

    public Page<Order> filter(List<Category> categories, List<Technology> technologies, String search, String pageStr) {
        int page = Integer.parseInt(pageStr);
        search = ("".equals(search)) ? "%" : search;
        if (categories == null && technologies == null) {
            return orderRepository.findByDeletedAndTitleContaining(false, search, gotoPage(page));
        }
        if (categories != null && technologies == null) {
            return orderRepository.findByDeletedAndCategoriesInAndTitleContaining(false, categories, search, gotoPage(page));
        }
        if (categories == null) {
            return orderRepository.findByDeletedAndTechnologiesInAndTitleContaining(false, technologies, search, gotoPage(page));
        }
        return orderRepository.findByDeletedAndCategoriesInAndTechnologiesInAndTitleContaining(false, categories, technologies, search, gotoPage(page));
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
        Order order = orderRepository.findOne(id);
        long time = Calendar.getInstance().getTime().getTime() + 1000;
        order.setEnd(new Date(time));
        order.setDeleted(true);
    }

    public Boolean validateOrderByUser(String login, Long orderId) {
        User user = userRepository.findUserByLogin(login);
        Order order = orderRepository.findOne(orderId);
        if (order.getEmployer().equals(user)) {
            return true;
        }
        return false;
    }

    private PageRequest gotoPage(int page) {
        PageRequest request = new PageRequest(page, PAGE_SIZE, Sort.Direction.ASC, "end");
        return request;
    }

    public List<Order> ordersOnPage(String pageNo) {
        int gotoPageNo = Integer.parseInt(pageNo);
        List<Order> orders = orderRepository.findAllByDeleted(false, gotoPage(gotoPageNo));
        return orders;
    }

    public int countOrders() {
        int lastPageNo;
        long totalOrdersCount = orderRepository.countByEndAfter(new Date());
        if (totalOrdersCount % PAGE_SIZE != 0)
            lastPageNo = (int) (totalOrdersCount / PAGE_SIZE) + 1;
        else
            lastPageNo = (int) (totalOrdersCount / PAGE_SIZE);
        return lastPageNo;
    }

    public Order getOrderToEdit(Long id) {
        Order order = orderRepository.findOne(id);
        Date date = new Date();
        if (order.getEnd().before(date)) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DATE, 7);
            date = cal.getTime();
            order.setEnd(date);
        }
        return order;
    }
}


