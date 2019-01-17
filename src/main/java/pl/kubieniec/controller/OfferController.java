package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import pl.kubieniec.model.Offer;
import pl.kubieniec.repository.OfferRepository;
import pl.kubieniec.service.OfferService;

import javax.validation.Valid;

@Controller
@RequestMapping("/offer")
public class OfferController {

    @Autowired
    private OfferService offerService;

    @RequestMapping(value = "/add/{id}", method = RequestMethod.POST)
    public String add(@Valid Offer offer, @SessionAttribute String login, @PathVariable Long id) {
        offerService.save(offer, login, id);
        return "redirect:/order/show/{id}";
    }
}
