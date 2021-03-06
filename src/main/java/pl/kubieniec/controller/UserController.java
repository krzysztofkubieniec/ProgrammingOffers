package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Technology;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.CategoryRepository;
import pl.kubieniec.repository.TechnologyRepository;
import pl.kubieniec.repository.UserRepository;
import pl.kubieniec.service.OrderService;
import pl.kubieniec.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private TechnologyRepository technologyRepository;


    @RequestMapping(value = "/create-account", method = RequestMethod.GET)
    public String save(Model model) {
        model.addAttribute("user", new User());
        return "/user/create-account";
    }

    @RequestMapping(value = "/create-account", method = RequestMethod.POST)
    public String save(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/user/create-account";
        }
        userService.save(user);
        return "redirect:/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String login, @RequestParam String password, HttpSession session, Model model) {
        if (userService.login(login, password)) {
            session.setAttribute("login", login);
            return "redirect:/";
        } else {
            model.addAttribute("error", "Niepoprawny email lub hasło");
        }
        return "/user/login";
    }

    @RequestMapping(value = "/logged/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/logged/dashboard")
    public String dashboard(@SessionAttribute String login, Model model) {
        User user = userService.findUserByLogin(login);
        model.addAttribute("activeOrders", orderService.findActiveOrdersByUser(user));
        model.addAttribute("nonActiveOrders", orderService.findNonActiveOrdersByUser(user));
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("technologies", technologyRepository.findAll());
        return "/user/dashboard/dashboard-orders";
    }
}
