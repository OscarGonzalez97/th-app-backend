package com.roshka;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.PostulanteTecnologia;
import com.roshka.modelo.Tecnologia;
import com.roshka.repositorio.PostulanteRepository;
import com.roshka.repositorio.TecnologiaRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("com.roshka.repositorio")
@EntityScan("com.roshka.modelo")
public class CurriculumsearchApplication {

	public static void main(String[] args) {
		SpringApplication.run(CurriculumsearchApplication.class, args);
	}

	@Bean
	CommandLineRunner runner(PostulanteRepository postRepo,TecnologiaRepository tecRepo) {
		return args -> {
			// read json and write to db
			ObjectMapper mapper = new ObjectMapper();
			TypeReference<List<Postulante>> typeReference = new TypeReference<List<Postulante>>(){};
			InputStream inputStream = TypeReference.class.getResourceAsStream("/json/postulante.json");
			try {
				List<Postulante> postulantes = mapper.readValue(inputStream,typeReference);
				postRepo.saveAll(postulantes);
				System.out.println("postulantes Saved!");
			} catch (IOException e){
				System.out.println("Unable to save tecnologias: " + e.getMessage());
			}

			
			
			
		};
	}

	
}
