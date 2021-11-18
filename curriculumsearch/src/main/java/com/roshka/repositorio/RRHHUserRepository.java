package com.roshka.repositorio;

import com.roshka.modelo.RRHHUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RRHHUserRepository extends JpaRepository<RRHHUser, Long> {
    RRHHUser findByEmail(String username);

    RRHHUser findByResetPasswordToken(String resetPasswordToken);
}
