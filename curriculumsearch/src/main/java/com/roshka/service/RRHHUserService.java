package com.roshka.service;

import com.roshka.modelo.RRHHUser;
import com.roshka.repositorio.RRHHUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class RRHHUserService {

    @Autowired
    private RRHHUserRepository userRepo;


    public void updateResetPasswordToken(String token, String email) throws UsernameNotFoundException {
        RRHHUser customer = userRepo.findByEmail(email);
        if (customer != null) {
            customer.setResetPasswordToken(token);
            userRepo.save(customer);
        } else {
            throw new UsernameNotFoundException("Could not find any customer with the email " + email);
        }
    }

    public RRHHUser getByResetPasswordToken(String token) {
        return userRepo.findByResetPasswordToken(token);
    }

    public void updatePassword(RRHHUser user, String newPassword) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(newPassword);
        user.setPassword(encodedPassword);

        user.setResetPasswordToken(null);
        userRepo.save(user);
    }
}