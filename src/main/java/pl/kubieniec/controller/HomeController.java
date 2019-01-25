package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.Technology;
import pl.kubieniec.repository.CategoryRepository;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.TechnologyRepository;
import pl.kubieniec.service.OrderService;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private TechnologyRepository technologyRepository;

    @ModelAttribute("categories")
    private List<Category> getCategories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("technologies")
    private List<Technology> getTechnologies() {
        return technologyRepository.findAll();
    }

    @ModelAttribute("orders")
    private List<Order> getOrders() {
        return orderService.findTop10();
    }

    @RequestMapping("/")
    public String home(Model model) {
        return "index";
    }
}
