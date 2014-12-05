/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksiegarnia.controller;

import com.ksiegarnia.dao.KategoriaDAO;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Damian
 */
@Controller
public class MController {

    private KategoriaDAO kategoriaDAO;
    private DriverManagerDataSource dataSource;
    private ModelAndView model;

    private void setUpDataSource(){
        dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.apache.derby.jdbc.ClientDriver");
        dataSource.setUrl("jdbc:derby://localhost:1527/projekt-ksiegarnia");
        dataSource.setUsername("sa");
        dataSource.setPassword("sa");
    }
    
    @RequestMapping("/home")
    public ModelAndView home() {
        model = new ModelAndView("home");            
        
        return model;
    }

    @RequestMapping("/category")
    public ModelAndView category_main() {
        model = new ModelAndView("category_main");
        
        kategoriaDAO = new KategoriaDAO();
        setUpDataSource();
        kategoriaDAO.setDataSource(dataSource); 
        
        model.addObject("kategoria", kategoriaDAO.kategoria());        
        return model;
    }

    @RequestMapping("/categorys")
    public ModelAndView category(@RequestParam(value = "name", required = true) int id) {
        model = new ModelAndView("category");
        
        return model;
    }

    @RequestMapping("/book")
    public ModelAndView book() {
        model = new ModelAndView("book");
        
        return model;
    }

}
