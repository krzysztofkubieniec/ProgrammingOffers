package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.repository.CategoryRepository;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.service.OrderService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {



    @Autowired
    private OrderService orderService;

    @Autowired
    private CategoryRepository categoryRepository;

    @ModelAttribute("categories")
    private List<Category> getCategories() {
        return categoryRepository.findAll();
    }

    @RequestMapping(value = "/create-order", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("order", new Order());
        return "/order/create-order";
    }

    @RequestMapping(value = "/create-order", method = RequestMethod.POST)
    public String add(@Valid Order order, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "/order/create-order";
        }
        String login = (String) session.getAttribute("login");
        orderService.save(order,login);
        return "/";
    }

}
