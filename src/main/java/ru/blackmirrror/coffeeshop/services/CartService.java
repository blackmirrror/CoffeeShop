package ru.blackmirrror.coffeeshop.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.blackmirrror.coffeeshop.models.Cart;
import ru.blackmirrror.coffeeshop.models.User;
import ru.blackmirrror.coffeeshop.repositories.CartRepository;
import ru.blackmirrror.coffeeshop.repositories.ProductRepository;
import ru.blackmirrror.coffeeshop.repositories.UserRepository;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CartService {
    public final UserRepository userRepository;
    public final ProductRepository productRepository;
    public final CartRepository cartRepository;


    public void addCartToUser(User user, Cart cart) {
        List<Cart> carts = user.getCart();
        carts.add(cart);
        log.info("Added product to cart {}", cart.getId());
        userRepository.save(user);
    }

    @Transactional
    public void removeFromCart(User user, Long productId) {
        cartRepository.deleteByUserIdAndProductId(user.getId(), productId);
    }


    public List<Cart> getCart(User user) {
        return user.getCart();
    }


    public Cart saveCart(Long pId, Long uId, int count, String weight) {
        Cart cart = new Cart();
        cart.setUser(userRepository.getById(uId));
        cart.setProduct(productRepository.getById(pId));
        cart.setCount(count);
        cart.setWeight(weight);
        cart.setActive(true);
        cartRepository.save(cart);
        return cart;
    }
}
