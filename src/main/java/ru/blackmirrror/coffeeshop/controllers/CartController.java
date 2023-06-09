package ru.blackmirrror.coffeeshop.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.blackmirrror.coffeeshop.models.Cart;
import ru.blackmirrror.coffeeshop.models.Product;
import ru.blackmirrror.coffeeshop.models.User;
import ru.blackmirrror.coffeeshop.services.CartService;
import ru.blackmirrror.coffeeshop.services.ProductService;
import ru.blackmirrror.coffeeshop.services.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class CartController {
    private final CartService cartService;
    private final UserService userService;
    private final ProductService productService;

    @GetMapping("/cart")
    public String viewCart(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        List<Cart> cart = user.getCart();
        model.addAttribute("carts", cart);
        model.addAttribute("user", user);
        return "cart";
    }

    @PostMapping("/cart/add")
    public String addToCart(@RequestParam("productId") Long productId,
                            @RequestParam(value = "userId", required = false) Long userId,
                            @RequestParam("count") int count,
                            @RequestParam("weight") String weight,
                            Principal principal) {
        if (userId == null) return "redirect:/login";
        Cart cart = cartService.saveCart(productId, userId, count, weight);
        User user = userService.getUserByPrincipal(principal);
        cartService.addCartToUser(user, cart);
        log.info("Controller for adding product");
        return "redirect:/";
    }


    @PostMapping("/cart/remove")
    public String removeFromCart(@RequestParam("productId") Long productId,
                                 Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        cartService.removeFromCart(user, productId);
        return "redirect:/cart/";
    }
}
