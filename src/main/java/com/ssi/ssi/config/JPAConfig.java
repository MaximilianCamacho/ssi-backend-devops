package com.ssi.ssi.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableJpaRepositories("com.ssi.ssi.domain.repository")
public class JPAConfig {
}