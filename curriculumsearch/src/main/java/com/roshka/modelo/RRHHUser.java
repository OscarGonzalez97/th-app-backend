package com.roshka.modelo;

import lombok.Data;

import javax.persistence.*;

@Entity @Data
@Table(name = "recursos_humanos_user")
public class RRHHUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 45)
    private String email;

    @Column(nullable = false, length = 64)
    private String password;

    @Column(name = "first_name", nullable = false, length = 20)
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 20)
    private String lastName;

    @Column(name = "reset_password_token")
    private String resetPasswordToken;

   
}
