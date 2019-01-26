package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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

    private static final int PAGE_SIZE = 3;            // Number of rows to contain per page

    private long totalOrdersCount;

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
        return orderService.ordersOnPage("0");
    }

    @RequestMapping("/")
    public String index(Model model, HttpSession session, @RequestParam(value = "pageNo", required = false, defaultValue = "0") String pageNo) {
        model.addAttribute("lastPageNo", orderService.countOrders());
        return "index";
    }
}
