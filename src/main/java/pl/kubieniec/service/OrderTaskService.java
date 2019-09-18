package pl.kubieniec.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.kubieniec.repository.OrderRepository;

import java.time.Instant;
import java.util.Date;

@Service
@Transactional
public class OrderTaskService {

    @Autowired
    OrderRepository orderRepository;

    @Scheduled(cron = "${purge.cron.expression}")
    public void purgeExpired() {
        orderRepository.setDeletedIfEnd(Date.from(Instant.now()));
    }
}
