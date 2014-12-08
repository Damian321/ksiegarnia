/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ksiegarnia.controller;

import com.ksiegarnia.dao.KsiazkaDAO;
import com.ksiegarnia.dao.UserDAO;
import javax.annotation.PostConstruct;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Damian
 */

@RequestMapping("/admin/*")
@Controller
public class AdminController {
    
    private DriverManagerDataSource dataSource;
    private ModelAndView model;
    private KsiazkaDAO ksiazkaDAO;
    private UserDAO userDAO;

    @PostConstruct
    public void init() {
        dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.apache.derby.jdbc.ClientDriver");
        dataSource.setUrl("jdbc:derby://localhost:1527/projekt-ksiegarnia");
        dataSource.setUsername("sa");
        dataSource.setPassword("sa");

        ksiazkaDAO = new KsiazkaDAO();        
        userDAO = new UserDAO();
        
        ksiazkaDAO.setDataSource(dataSource);
        userDAO.setDataSource(dataSource);
    }
    
    @RequestMapping("panel.htm")
    public ModelAndView panel(){
        model = new ModelAndView("admin/panel");
        model.addObject("lista_ksiazek", ksiazkaDAO.findAll());
        model.addObject("lista_pracownikow", userDAO.findAllEmployees());
        System.out.println(userDAO.findAllUsers().toString());
        model.addObject("lista_uzytkownikow", userDAO.findAllUsers());
        
        return model;
    }
    
}
