package pl.kubieniec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.UserRepository;
import pl.kubieniec.service.UserService;

import javax.validation.Valid;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/create-account", method = RequestMethod.GET)
    public String save(Model model) {
        model.addAttribute("user",new User());
        return "/user/create-account";
    }

    @RequestMapping(value = "/create-account", method = RequestMethod.POST)
    public String save(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/user/create-account";
        }
        userService.save(user);
        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "/user/login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String login, String password){
        
    }
}
