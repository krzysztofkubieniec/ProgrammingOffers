package pl.kubieniec.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import pl.kubieniec.model.Category;
import pl.kubieniec.model.Order;
import pl.kubieniec.model.Technology;
import pl.kubieniec.model.User;

import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    int countByEndAfter(Date date);

    List<Order> findAllByDeleted(Boolean deleted, Pageable pageable);

    Page<Order> findByDeletedAndTitleContaining(Boolean deleted, String title, Pageable pageable);

    List<Order> findAllByDeletedAndEmployerOrderByEndAsc(Boolean deleted, User employer);

    List<Order> findAllByDeletedAndEmployerOrderByEndDesc(Boolean deleted, User employer);

    Page<Order> findByDeletedAndCategoriesInAndTechnologiesInAndTitleContaining(Boolean deleted, List<Category> categories, List<Technology> technologies, String title, Pageable pageable);

    Page<Order> findByDeletedAndCategoriesInAndTitleContaining(Boolean deleted, List<Category> categories, String title, Pageable pageable);

    Page<Order> findByDeletedAndTechnologiesInAndTitleContaining(Boolean deleted, List<Technology> technologies, String title, Pageable pageable);

    @Modifying
    @Query("update Order o set o.deleted = 1 where o.end <= ?1")
    void setDeletedIfEnd(Date now);
}
