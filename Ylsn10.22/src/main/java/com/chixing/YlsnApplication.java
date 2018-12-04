package com.chixing;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class YlsnApplication {

	public static void main(String[] args) {
		SpringApplication.run(YlsnApplication.class, args);
	}
}
