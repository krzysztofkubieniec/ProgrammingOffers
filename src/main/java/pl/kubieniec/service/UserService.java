package pl.kubieniec.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.UserRepository;

import java.time.LocalDateTime;

@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void save(User user){
        String password = BCrypt.hashpw(user.getPassword(),BCrypt.gensalt());
        user.setPassword(password);
        user.setCreated(LocalDateTime.now());
        userRepository.save(user);
    }
    public Boolean exists(String login, String password) {
        User user = userRepository.findUserByLogin(login);
        String hashed = user.getPassword();
        if (BCrypt.checkpw(password, hashed)) {
            System.out.println("Ok");
        } else {
            System.out.println("It does not match");
        }
    }

}
