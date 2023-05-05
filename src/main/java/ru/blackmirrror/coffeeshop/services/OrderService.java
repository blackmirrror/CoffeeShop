package ru.blackmirrror.coffeeshop.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Service;
import ru.blackmirrror.coffeeshop.models.Cart;
import ru.blackmirrror.coffeeshop.models.Order;
import ru.blackmirrror.coffeeshop.repositories.CartRepository;
import ru.blackmirrror.coffeeshop.repositories.OrderRepository;
import ru.blackmirrror.coffeeshop.models.User;
import ru.blackmirrror.coffeeshop.repositories.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final CartRepository cartRepository;

    public void saveOrder(User user, String address) {
        Order order = new Order();
        order.setAddress(address);
        order.setUserId(user.getId());
        order.setStatus(0);
        List<Cart> cartItems = new ArrayList<>();
        for (Cart cart : user.getCart()) {
            if (cart.isActive()) {
                cartItems.add(cart);
            }
        }
        order.setCartItems(cartItems);
        orderRepository.save(order);
        for (Cart cart: cartItems) {
            cart.setActive(false);
            cart.setOrder(order);
            cartRepository.save(cart);
        }
    }

    public List<Order> getCurrentOrders() {
        List<Order> orders = orderRepository.findAllByStatus(0);
        orders.addAll(orderRepository.findAllByStatus(1));
        orders.addAll(orderRepository.findAllByStatus(2));
        orders.addAll(orderRepository.findAllByStatus(3));
        return orders;
    }

    public void changeOrderStatus(Long id) {
        Order order = orderRepository.getById(id);
        order.setStatus(order.getStatus() + 1);
        orderRepository.save(order);
    }

    public List<Order> getOrdersByUserId(Long userId) {
        return orderRepository.findAllByUserId(userId);
    }
}
