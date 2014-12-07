/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksiegarnia.controller;

import com.ksiegarnia.dao.KategoriaDAO;
import com.ksiegarnia.dao.KsiazkaDAO;
import javax.annotation.PostConstruct;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Damian
 */
@Controller
@RequestMapping("/user/*")
public class UserController {

    private ModelAndView model;
    
    @RequestMapping("/koszyk")
    public ModelAndView koszyk(){
        model = new ModelAndView("user/koszyk");
        
        return model;
    }
    
    @RequestMapping("/wypozycz")
    public ModelAndView wypozycz(){
        model = new ModelAndView("user/wypozycz");
        
        return model;
    }
}
