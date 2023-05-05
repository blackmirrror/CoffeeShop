package ru.blackmirrror.coffeeshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.blackmirrror.coffeeshop.models.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    public List<Order> findAllByUserId(Long userId);
    public List<Order> findAllByStatus(int status);
}
