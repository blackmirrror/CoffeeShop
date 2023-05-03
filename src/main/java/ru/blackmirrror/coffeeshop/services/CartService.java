package ru.blackmirrror.coffeeshop.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.blackmirrror.coffeeshop.models.User;
import ru.blackmirrror.coffeeshop.repositories.UserRepository;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CartService {
    public final UserRepository userRepository;

    public void addToCart(User user, Long productId) {
        List<Long> cartItems = user.getCart();
        cartItems.add(productId);
        log.info("Added product to cart");
        userRepository.save(user);
    }

    public void removeFromCart(User user, Long productId) {
        List<Long> cartItems = user.getCart();
        cartItems.remove(productId);
        userRepository.save(user);
    }

    public List<Long> getCart(User user) {
        return user.getCart();
    }
}
