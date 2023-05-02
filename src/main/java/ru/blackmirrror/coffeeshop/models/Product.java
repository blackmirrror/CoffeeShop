package ru.blackmirrror.coffeeshop.models;

import lombok.Data;
import ru.blackmirrror.coffeeshop.models.enums.Product_category;
import ru.blackmirrror.coffeeshop.models.enums.Role;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "products")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private Integer price;
    private String city;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
    mappedBy = "product")
    private List<Image> images = new ArrayList<>();

    @ElementCollection(targetClass = Product_category.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "product_category",
            joinColumns = @JoinColumn(name = "product_id"))
    @Enumerated(EnumType.STRING)
    private Set<Product_category> categories = new HashSet<>();

//    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
//    @JoinColumn
//    private User user;
    private Long previewImageId;
    private LocalDateTime dateOfCreated;

    @PrePersist
    private void onCreate() { dateOfCreated = LocalDateTime.now(); }


    public void addImageToProduct(Image image) {
        image.setProduct(this);
        images.add(image);
    }
}
