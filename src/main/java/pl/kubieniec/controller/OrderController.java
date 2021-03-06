package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.kubieniec.model.*;
import pl.kubieniec.repository.CategoryRepository;
import pl.kubieniec.repository.OfferRepository;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.repository.TechnologyRepository;
import pl.kubieniec.service.OrderService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OfferRepository offerRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private OrderRepository orderRepository;

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

    @RequestMapping(value = "/logged/create-order", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("order", new Order());
        return "/order/create-order";
    }

    @RequestMapping(value = "/logged/create-order", method = RequestMethod.POST)
    public String add(@Valid Order order, BindingResult result, @SessionAttribute String login) {
        if (result.hasErrors()) {
            return "/order/create-order";
        }
        orderService.save(order, login);
        return "redirect:/";
    }

    @RequestMapping(value = "/logged/edit/{id}", method = RequestMethod.GET)
    public String update(@SessionAttribute String login, @PathVariable Long id, Model model) {
        if (orderService.validateOrderByUser(login, id)) {
            Order order = orderService.getOrderToEdit(id);
            model.addAttribute("order", order);
            return "/order/create-order";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/logged/edit/{id}", method = RequestMethod.POST)
    public String update(@Valid Order order, BindingResult result) {
        if (result.hasErrors()) {
            return "/order/create-order";
        }
        orderService.update(order);
        return "redirect:/user/logged/dashboard";
    }

    @RequestMapping(value = "/logged/end/{id}")
    public String update(@PathVariable Long id, @SessionAttribute String login) {
        if (orderService.validateOrderByUser(login, id)) {
            orderService.end(id);
        }
        return "redirect:/user/logged/dashboard";
    }

    @RequestMapping("/show/{id}")
    public String show(@PathVariable Long id, Model model) {
        Order order = orderRepository.findOne(id);
        model.addAttribute("order", order);
        model.addAttribute("offer", new Offer());
        model.addAttribute("offers", offerRepository.findAllByOrder(order));
        return "/order/info";
    }

    @RequestMapping(value = "/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Order> filter(@RequestParam(value = "categories", required = false) List<Category> categories,
                              @RequestParam(value = "technologies", required = false) List<Technology> technologies,
                              @RequestParam(value = "page", required = false, defaultValue = "0") String page,
                              @RequestParam(value = "search") String search) {
        return orderService.filter(categories, technologies,search,page);
    }

}
