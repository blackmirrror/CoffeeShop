package ru.blackmirrror.coffeeshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.blackmirrror.coffeeshop.models.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {
    void deleteByUserIdAndProductId(Long userId, Long productId);
}
