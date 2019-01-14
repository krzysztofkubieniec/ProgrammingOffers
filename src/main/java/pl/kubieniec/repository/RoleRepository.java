package pl.kubieniec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kubieniec.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

}
