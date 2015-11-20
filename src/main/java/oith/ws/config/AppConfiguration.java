package oith.ws.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.repository.config.RepositoryConfiguration;

@Configuration
@ComponentScan(basePackages = {"oith.ws.ctrl", "oith.ws.service"})
@Import({MvcConfiguration.class, RepositoryConfiguration.class, SecurityConfiguration.class})
public class AppConfiguration {
}
