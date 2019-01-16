package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.ProgrammingLanguage;
import pl.kubieniec.repository.CategoryRepository;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.ProgrammingLanguageRepository;
import pl.kubieniec.service.OrderService;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProgrammingLanguageRepository programmingLanguageRepository;

    @ModelAttribute("orders")
    public List<Order> findTop10() {
        return orderService.findTop10();
    }

    @ModelAttribute("categories")
    public List<Category> getCategories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("programmingLanguages")
    public List<ProgrammingLanguage> getProgrammingLanguages() {
        return programmingLanguageRepository.findAll();
    }

    @RequestMapping("/")
    public String home() {
        return "index";
    }
}
