package com.careeragent;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableTransactionManagement
@EnableScheduling
public class CareerServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(CareerServerApplication.class, args);
    }
}
