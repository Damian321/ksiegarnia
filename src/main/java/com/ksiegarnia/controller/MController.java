/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksiegarnia.controller;

import com.ksiegarnia.dao.JdbcSampleDao;
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

    private JdbcSampleDao sampleDAO;

    @RequestMapping("/home")
    public ModelAndView home() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.apache.derby.jdbc.ClientDriver");
        dataSource.setUrl("jdbc:derby://localhost:1527/projekt-ksiegarnia");
        dataSource.setUsername("sa");
        dataSource.setPassword("sa");
        
        sampleDAO.setDataSource(dataSource);
        ModelAndView model = new ModelAndView("home");

        model.addObject("kategoria", sampleDAO.toString());
        return model;
    }

    @RequestMapping("/category")
    public ModelAndView category_main() {
        return new ModelAndView("category_main");
    }

    @RequestMapping("/categorys")
    public ModelAndView category(@RequestParam(value = "name", required = true) int id) {
        return new ModelAndView("category");
    }

    @RequestMapping("/book")
    public ModelAndView book() {
        return new ModelAndView("book");
    }

}
