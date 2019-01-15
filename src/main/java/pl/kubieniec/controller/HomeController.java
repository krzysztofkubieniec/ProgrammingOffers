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
    private OrderService orderService;

    @ModelAttribute("orders")
    public List<Order> findTop10() {
        return orderService.findTop10();

    }

    @RequestMapping("/")
    public String home() {
        return "index";
    }
}
