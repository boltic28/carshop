package config;

import org.springframework.boot.context.embedded.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import javax.servlet.MultipartConfigElement;

/**
 * Created by Siarhei Baltrukevich on 24.06.2016.
 */
    @Configuration
    @EnableWebMvc
    @ComponentScan("web")
    public class WebAppConfig extends WebMvcConfigurerAdapter {

        // Позволяет видеть все ресурсы в папке pages, такие как картинки, стили и т.п.
        @Override
        public void addResourceHandlers(ResourceHandlerRegistry registry) {
            registry.addResourceHandler("/**").addResourceLocations("/");
        }

        // а этот бин инициализирует View нашего проекта
        // точно это же мы делали в mvc-dispatcher-servlet.xml
        @Bean
        public InternalResourceViewResolver setupViewResolver() {
            InternalResourceViewResolver resolver = new InternalResourceViewResolver();
            resolver.setPrefix("/pages/");
            resolver.setSuffix(".jsp");
            resolver.setViewClass(JstlView.class);

            return resolver;
        }
        //
        @Bean
        public CommonsMultipartResolver multipartResolver() {
            CommonsMultipartResolver resolver = new CommonsMultipartResolver();
            resolver.setDefaultEncoding("utf-8");
            return resolver;
        }

        @Bean
        MultipartConfigElement multipartConfigElement() {
            MultipartConfigFactory factory = new MultipartConfigFactory();
            factory.setMaxFileSize("128KB");
            factory.setMaxRequestSize("128KB");
            return factory.createMultipartConfig();
        }
}
