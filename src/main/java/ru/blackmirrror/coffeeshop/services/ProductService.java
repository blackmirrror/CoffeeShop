package ru.blackmirrror.coffeeshop.services;

import ru.blackmirrror.coffeeshop.models.Image;
import ru.blackmirrror.coffeeshop.models.Product;
import ru.blackmirrror.coffeeshop.models.User;
import ru.blackmirrror.coffeeshop.repositories.ProductRepository;
import ru.blackmirrror.coffeeshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public List<Product> listProducts(String title) {
        if (title != null && !title.isEmpty()) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }

    public void saveProduct(Principal principal, Product product,
                            MultipartFile file1, MultipartFile file2, MultipartFile file3,
                            String[] weights) throws IOException {
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }
        log.info("Saving new Product. Title: {}", product.getTitle());
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        product.setWeights(new HashSet<>(List.of(weights)));
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(User user, Long id) {
        Product product = productRepository.findById(id)
                .orElse(null);
        if (product != null) {
            productRepository.delete(product);
            log.info("Product with id = {} was deleted", id);
        } else {
            log.error("Product with id = {} is not found", id);
        }    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public List<String> getAllCategories() {
        List<String> categories = new ArrayList<>();
        categories.add("Кофе");
        categories.add("Другие напитки");
        categories.add("Здоровая еда");
        categories.add("Сладкое и выпечка");
        return categories;
    }

    public List<String> getAllWeights() {
        List<String> weights = new ArrayList<>();
        weights.add("100 г/мл");
        weights.add("200 г/мл");
        weights.add("300 г/мл");
        weights.add("400 г/мл");
        return weights;
    }
}
