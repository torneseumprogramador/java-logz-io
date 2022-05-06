package com.validar.cpf.validadorCPF;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class ValidadorCpfApplication {

	public static void main(String[] args) {

		LoggerFactory.getLogger(ValidadorCpfApplication.class).debug("Did it again!");

		Logger logger = LogManager.getLogger(ValidadorCpfApplication.class);
		logger.info("Testing logz.io!");
		logger.warn("Winter is coming");
		
		SpringApplication.run(ValidadorCpfApplication.class, args);
	}

}
