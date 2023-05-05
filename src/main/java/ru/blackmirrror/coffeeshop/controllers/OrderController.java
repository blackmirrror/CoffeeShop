package ru.blackmirrror.coffeeshop.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.blackmirrror.coffeeshop.models.Cart;
import ru.blackmirrror.coffeeshop.models.Order;
import ru.blackmirrror.coffeeshop.services.OrderService;
import ru.blackmirrror.coffeeshop.services.UserService;
import ru.blackmirrror.coffeeshop.models.User;


import java.security.Principal;

@Controller
@Slf4j
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final UserService userService;

    @GetMapping("/orders")
    public String viewProducts(Model model,Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("orders", orderService.getOrdersByUserId(user.getId()));
        model.addAttribute("user_orders", orderService.getCurrentOrders());
        for (Cart c : user.getCart())
            log.info("{}", c.getProduct().getTitle());
        return "orders";
    }

    @PostMapping("/order/create")
    public String createOrder(@RequestParam("address") String address, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        log.info("Controller");
        orderService.saveOrder(user, address);
        return "redirect:/orders";
    }

    @PostMapping("/order/change")
    public String changeOrderStatus(@RequestParam("order_id") Long id, Principal principal) {
        orderService.changeOrderStatus(id);
        return "redirect:/orders";
    }
}
