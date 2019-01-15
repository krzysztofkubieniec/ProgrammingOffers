package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.kubieniec.model.Order;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.service.OrderService;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private OrderRepository orderRepository;

    @ModelAttribute("orders")
    public List<Order> findTop10() {
        return orderRepository.findTop10ByOrderByEndDesc();

    }

    @RequestMapping("/")
    public String home() {
        return "index";
    }
}
