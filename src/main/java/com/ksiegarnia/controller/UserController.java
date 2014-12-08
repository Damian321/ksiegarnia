/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksiegarnia.controller;

import com.ksiegarnia.dao.KsiazkaDAO;
import com.ksiegarnia.model.Koszyk;
import javax.annotation.PostConstruct;
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
@RequestMapping("/user/*")
public class UserController {

    private DriverManagerDataSource dataSource;
    private ModelAndView model;
    private KsiazkaDAO ksiazkaDAO;
    private Koszyk koszyk;
    

    @PostConstruct
    public void init() {
        dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.apache.derby.jdbc.ClientDriver");
        dataSource.setUrl("jdbc:derby://localhost:1527/projekt-ksiegarnia");
        dataSource.setUsername("sa");
        dataSource.setPassword("sa");

        ksiazkaDAO = new KsiazkaDAO();        
        ksiazkaDAO.setDataSource(dataSource);
        
        koszyk = new Koszyk();
    }
    
    @RequestMapping("/koszyk")
    public ModelAndView koszyk(@RequestParam(value = "id", required = false) String id,
                                @RequestParam(value = "username", required = false) String username){
        model = new ModelAndView("user/koszyk");
        
        if(id != null){
            if(koszyk.getUsername() == null)
                koszyk.setUsername(username);
            else if(!koszyk.getUsername().equals(username)){
                koszyk = new Koszyk();
            }

            koszyk.dodajKsiazke(ksiazkaDAO.findOneById(id).get(0));
            
            model.addObject("koszyk", koszyk.getLista_ksiazek());
        }
        
        return model;
    }
    
    @RequestMapping("/wypozycz")
    public ModelAndView wypozycz(){
        model = new ModelAndView("user/wypozycz");
        
        return model;
    }
}
