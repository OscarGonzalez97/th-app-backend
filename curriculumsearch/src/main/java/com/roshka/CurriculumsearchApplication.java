package com.roshka;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.*;
import com.roshka.repositorio.*;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
@EnableJpaRepositories("com.roshka.repositorio")
@EntityScan("com.roshka.modelo")
public class CurriculumsearchApplication {

	public static void main(String[] args) {
		SpringApplication.run(CurriculumsearchApplication.class, args);
	}

	@Bean
	CommandLineRunner runner(PostulanteRepository postRepo, TecnologiaRepository tecRepo, DepartamentoRepository depR,
							 CiudadRepository ciudR, RRHHUserRepository rrhhUserRepository) {
		return args -> {
			try {
				// read json and write to db
				ObjectMapper mapper = new ObjectMapper();
				TypeReference<List<Departamento>> typeReference1 = new TypeReference<List<Departamento>>(){};
				InputStream inputStream = TypeReference.class.getResourceAsStream("/json/Departamento.json");
				List<Departamento> departamento= mapper.readValue(inputStream,typeReference1);
				depR.saveAll(departamento);
				System.out.println("Departamentos Saved!");
				TypeReference<List<Ciudad>> typeReference2 = new TypeReference<List<Ciudad>>(){};
				inputStream = TypeReference.class.getResourceAsStream("/json/Ciudad.json");
				List<Ciudad> ciudades= mapper.readValue(inputStream,typeReference2);
				ciudR.saveAll(ciudades);
				System.out.println("Cuidad Saved!");
				TypeReference<List<Postulante>> typeReference = new TypeReference<List<Postulante>>(){};
				inputStream = TypeReference.class.getResourceAsStream("/json/postulante.json");
				List<Postulante> postulantes = mapper.readValue(inputStream,typeReference);
				postRepo.saveAll(postulantes);
				System.out.println("postulantes Saved!");
				String password = new BCryptPasswordEncoder().encode("test");
				RRHHUser testuser = new RRHHUser();
				testuser.setEmail("test@test.com");
				testuser.setFirstName("test");
				testuser.setLastName("test");
				testuser.setPassword(password);
				rrhhUserRepository.save(testuser);
				System.out.println("Usuario Test: \nEmail: test@test.com\nPassword: test");
				
			} catch (IOException e){
				System.out.println("Unable to save tecnologias: " + e.getMessage());
			}

			
			
			
		};
	}

	
}
