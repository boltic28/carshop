import config.ShopConfig;
import config.WebAppInitializer;
import models.Roles;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.context.embedded.AnnotationConfigEmbeddedWebApplicationContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import java.util.Arrays;

/**
 * Created by Siarhei Baltrukevich on 04.08.2016.
 */
public class TMPClass {
//    public static void main(String[] args){
////        SpringApplication.run(WebAppInitializer.class, args);
//
//        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
//
//        // Регистрируем в контексте конфигурационный класс, который мы создадим ниже
//        ctx.register(ShopConfig.class);
//
//        ctx.refresh();
//
//        System.out.println(Arrays.toString(ctx.getBeanDefinitionNames()));
//    }
}
