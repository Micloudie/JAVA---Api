package com.java.api.JAVA.Api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@SpringBootApplication(exclude = {ErrorMvcAutoConfiguration.class})
@RestController
public class JavaApiApplication {
	@RequestMapping("/")
  public String home() {
    return "Hello Docker World";
  }
  @RequestMapping("/data")
  public String data() {
	Personne hugol = new Personne("hugo", "lanzafame", 21, "etudiant en infomatique");
	Personne hugog = new Personne("hugo", "gonçalves", 19, "etuiant den infomatique");
	Personne mickael  = new Personne("mickael", "djegherif", 30, "etudiant en infomatique");
	Personne[] personnes = {hugol, hugog, mickael};
    return personnes.toString();
  }

	public static void main(String[] args) {
		SpringApplication.run(JavaApiApplication.class, args);
	}

	
}
