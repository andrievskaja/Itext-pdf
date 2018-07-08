/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andrievskaja.pdf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
public class WebConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/img/**").addResourceLocations("classpath:WEB-INF/img/");
//        registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
//        registry.addResourceHandler("/js/**").addResourceLocations("classpath:WEB-INF/js/");
        registry.addResourceHandler(
                "/img/**",
                "/css/**",
                "/js/**",
                "/fonts/**"
        )
                .addResourceLocations(
                        "/WEB-INF/img/",
                        "/WEB-INF/css/",
                        "/WEB-INF/js/",
                        "/WEB-INF/fonts/"
                );
    }

    @Bean
    public ViewResolver prepareViewResolver() {
//        LOGGER.info("Returning view resolver");
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

}
