package com.roshka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("com.roshka.repositorio")
@EntityScan("com.roshka.modelo")
public class CurriculumsearchApplication {

	public static void main(String[] args) {
		SpringApplication.run(CurriculumsearchApplication.class, args);
	}

	
}
