package ru.blackmirrror.coffeeshop.models;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
@Data
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Cart> cartItems = new ArrayList<>();

    private Long userId;
    private String name;
    private String phoneNumber;

    private String address;
    private LocalDate dateOfCreated;
    private int status;

    @PrePersist
    private void onCreate() { dateOfCreated = LocalDate.now(); }
}
