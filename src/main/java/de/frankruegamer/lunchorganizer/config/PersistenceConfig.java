package de.frankruegamer.lunchorganizer.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@EntityScan(basePackages = {"de.frankruegamer.lunchorganizer.business"})
//@EnableJpaRepositories(basePackages = {"de.frankruegamer.lunchorganizer.business"})
public class PersistenceConfig {

}
