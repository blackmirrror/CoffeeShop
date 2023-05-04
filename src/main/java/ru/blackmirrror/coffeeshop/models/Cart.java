package ru.blackmirrror.coffeeshop.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "cart_db")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;
    private int count;
    private String weight;
}
