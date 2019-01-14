package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.User;

import java.awt.print.Book;

public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByLogin(String login);

}
