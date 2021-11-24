package com.roshka;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.roshka.modelo.*;
import com.roshka.repositorio.*;
import org.hibernate.PersistentObjectException;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
@EnableJpaRepositories("com.roshka.repositorio")
@EntityScan("com.roshka.modelo")
public class CurriculumsearchApplication {

	public static void main(String[] args) {
		SpringApplication.run(CurriculumsearchApplication.class, args);
	}

	@Bean
	CommandLineRunner runner(PostulanteRepository postRepo, TecnologiaRepository tecRepo, DepartamentoRepository depR,
							 CiudadRepository ciudR, RRHHUserRepository rrhhUserRepository, CargoRepository cargoR, ConvocatoriaRepository convR) {
		return args -> {
			try {
				// read json and write to db
				guardarJson(cargoR,"/json/cargo.json",Cargo.class);
				guardarJson(convR,"/json/convocatoria.json",ConvocatoriaCargo.class);
				guardarJson(depR,"/json/Departamento.json",Departamento.class);
				guardarJson(ciudR,"/json/Ciudad.json",Ciudad.class);
				guardarJson(tecRepo,"/json/tecnologia.json",Tecnologia.class);
				guardarJson(postRepo,"/json/postulante.json",Postulante.class);
				
				String password = new BCryptPasswordEncoder().encode("test");
				RRHHUser testuser = new RRHHUser();
				testuser.setEmail("test@test.com");
				testuser.setFirstName("test");
				testuser.setLastName("test");
				testuser.setPassword(password);
				rrhhUserRepository.save(testuser);
				System.out.println("Usuario Test: \nEmail: test@test.com\nPassword: test");
				
			} catch (IOException e){
				System.out.println("Unable to save: " + e.getMessage());
			}
			catch(PersistentObjectException ex){
				System.out.println("Unable to save: " + ex.getMessage());
				
				ex.printStackTrace();
			}
			catch(Exception ex){
				System.out.println("Unable to save: " + ex.getMessage());
				
				ex.printStackTrace();
			}

			
			
			
		};
	}

	public static <Q,T extends JpaRepository<Q,Long>> void  guardarJson(T repo,String srcJson, Class<Q> clazz ) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		TypeFactory t = TypeFactory.defaultInstance();
		//TypeReference<List<Q>> typeReference1 = new TypeReference<List<Q>>(){};
		InputStream inputStream = TypeReference.class.getResourceAsStream(srcJson);
		List<Q> listaAguardar;
		listaAguardar = mapper.readValue(inputStream,t.constructCollectionType(ArrayList.class,clazz));
		repo.saveAll(listaAguardar);
		repo.flush();
		System.out.println(srcJson+" Saved!");
		
	}

	
}
