package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import service.user.UserDetailsServiceImpl;

import javax.sql.DataSource;

/**
 * Created by Siarhei Baltrukevich on 03.08.2016.
 */

@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(securedEnabled = true)

public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

//    @Autowired
//    private DataSource dataSource;

    @Autowired
    public void registerGlobalAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

//    @Autowired
//    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
//        auth.jdbcAuthentication().dataSource(dataSource)
//                .usersByUsernameQuery(
//                        "select email,password from users where email=?")
//                .authoritiesByUsernameQuery(
//                        "select role from users where email=?");
//    }

//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth
//                .inMemoryAuthentication()
//                .withUser("admin@admin.tut").password("admin").roles("ADMIN");
//    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

//        http.
//                authorizeRequests()
//                    .antMatchers("/**").permitAll()
//                    .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
//                    .anyRequest().authenticated()
//                .and()
//                    .formLogin()
//                    .loginPage("/login")
//                    .loginProcessingUrl("/j_spring_security_check")
//                    .usernameParameter("j_username")
//                    .passwordParameter("j_password")
//                    .permitAll()
//                .and()
//                    .logout()
//                    .permitAll()
//                    .logoutUrl("/logout")
//                    .logoutSuccessUrl("/sc-logout")
//                    .invalidateHttpSession(true)
//                .and()
//                    .csrf().disable()
//                    .exceptionHandling()
//                    .authenticationEntryPoint(new LoginUrlAuthenticationEntryPoint("/login"));

        // включаем защиту от CSRF атак
        http.csrf()
                .disable()
                // указываем правила запросов
                // по которым будет определятся доступ к ресурсам и остальным данным
                .authorizeRequests()
                .antMatchers("/admin/**","/admin").access("hasRole('ROLE_ADMIN')")
                .anyRequest().permitAll()
                .and();

//        http.authorizeRequests()
//                .antMatchers("/admin/**","/admin").access("hasRole('ROLE_ADMIN')")
//                .antMatchers("/god/**").access("hasRole('ROLE_SUPERADMIN')");
//                .and().formLogin().defaultSuccessUrl("/login", false);  //- так можно перенаправить пользователя на страницу с которой он пришел

        http.formLogin()
                // указываем страницу с формой логина
                .loginPage("/login")
                // указываем action с формы логина
                .loginProcessingUrl("/j_spring_security_check")
                // указываем URL при неудачном логине
                .failureUrl("/wronglg")
                // Указываем параметры логина и пароля с формы логина
                .usernameParameter("j_username")
                .passwordParameter("j_password")
                // даем доступ к форме логина всем
                .permitAll();

        http.logout()
                // разрешаем делать логаут всем
                .permitAll()
                // указываем URL логаута
                .logoutUrl("/logout")
                // указываем URL при удачном логауте
                .logoutSuccessUrl("/sc-logout")
                // делаем не валидной текущую сессию
                .invalidateHttpSession(true);
    }


}
