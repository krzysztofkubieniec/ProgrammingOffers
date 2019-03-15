package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import pl.kubieniec.model.Offer;
import pl.kubieniec.model.Order;
import pl.kubieniec.repository.OfferRepository;
import pl.kubieniec.repository.OrderRepository;
import pl.kubieniec.service.OfferService;

import javax.validation.Valid;
import java.util.Iterator;

@Controller
@RequestMapping("/logged/offer")
public class OfferController {

    @Autowired
    private OfferService offerService;

    @Autowired
    private OfferRepository offerRepository;

    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping(value = "/add/{orderId}", method = RequestMethod.POST)
    public String add(@Valid Offer offer, BindingResult result, @SessionAttribute String login, @PathVariable Long orderId, Model model) {
        if (result.hasErrors()) {
            Order order = orderRepository.findOne(orderId);
            model.addAttribute("order", order);
            model.addAttribute("offers", offerRepository.findAllByOrder(order));
            return "/order/info";
        }
        offerService.save(offer, login, orderId);
        return "redirect:/order/show/{orderId}";
    }
}
