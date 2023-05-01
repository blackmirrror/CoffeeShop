package ru.blackmirrror.coffeeshop.repositories;

import ru.blackmirrror.coffeeshop.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
