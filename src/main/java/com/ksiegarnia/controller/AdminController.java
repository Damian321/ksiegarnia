/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ksiegarnia.controller;

import com.ksiegarnia.dao.KsiazkaDAO;
import com.ksiegarnia.dao.UserDAO;
import com.ksiegarnia.model.User;
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
    public ModelAndView panel(@RequestParam(value="edycja", required=false) String edycja, 
                                @RequestParam(value="dodaj", required=false) String dodaj,
                                @RequestParam(value="username", required=false) String username,
                                @RequestParam(value="id_ksiazki", required=false) String id_ksiazki,
                                @RequestParam(value="id_newsa", required=false) String id_newsa,
                                @RequestParam(value="password", required=false) String password,
                                @RequestParam(value="active", required=false) String enabled){
        
        model = new ModelAndView("admin/panel");            
        
        if(dodaj != null){
            if(username != null){
                
            }else if(id_ksiazki != null){
                
            }else if(id_newsa != null){
                
            }     
        }else if(edycja != null){
            if(username != null){
                model.addObject("edit_user",userDAO.findByUsername(username).get(0));
            }else if(id_ksiazki != null){
                                
            }else if(id_newsa != null){
                
            }
            
            if(password!=null){                                
                Boolean ed;
                if(enabled == null)             ed = Boolean.FALSE;
                else if(enabled.equals("true"))    ed = Boolean.TRUE;
                else                            ed = Boolean.FALSE;
                
                userDAO.editUser(username, password, ed);
                model.addObject("edit_user",userDAO.findByUsername(username).get(0));
            }
            
        }
        
        model.addObject("lista_ksiazek", ksiazkaDAO.findAll());
        model.addObject("lista_pracownikow", userDAO.findAllEmployees());
        model.addObject("lista_uzytkownikow", userDAO.findAllUsers());
        return model;
    }

}
