package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.kubieniec.model.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByLogin(String login);

}
