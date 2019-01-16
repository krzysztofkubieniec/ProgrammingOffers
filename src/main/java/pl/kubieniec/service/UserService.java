package pl.kubieniec.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pl.kubieniec.model.Role;
import pl.kubieniec.model.User;
import pl.kubieniec.repository.RoleRepository;
import pl.kubieniec.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.List;

@Transactional
@Component
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    public void save(User user) {
        String password = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(password);
        user.setCreated(LocalDateTime.now());
        userRepository.save(user);
    }

    public Boolean login(String login, String password) {
        User user = findUserByLogin(login);
        if (user != null) {
            String hashed = user.getPassword();
            if (BCrypt.checkpw(password, hashed)) {
                return true;
            }
        }
        return false;
    }

    public User findUserByLogin(String login) {
        return userRepository.findUserByLogin(login);
    }
}


