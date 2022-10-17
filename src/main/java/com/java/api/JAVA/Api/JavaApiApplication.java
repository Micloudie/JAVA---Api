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

	public static void main(String[] args) {
		SpringApplication.run(JavaApiApplication.class, args);
	}

}
