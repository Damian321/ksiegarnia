/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksiegarnia.controller;

import com.ksiegarnia.dao.AuthoritiesDAO;
import com.ksiegarnia.dao.KategoriaDAO;
import com.ksiegarnia.dao.KsiazkaDAO;
import com.ksiegarnia.dao.UserDAO;
import com.ksiegarnia.model.Kategoria;
import com.ksiegarnia.model.Ksiazka;
import java.util.ArrayList;
import java.util.List;
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
public class MController {

    private KategoriaDAO kategoriaDAO;
    private KsiazkaDAO ksiazkaDAO;
    private UserDAO userDAO;
    private AuthoritiesDAO authoritiesDAO;

    private DriverManagerDataSource dataSource;
    private ModelAndView model;

    @PostConstruct
    public void init() {
        dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.apache.derby.jdbc.ClientDriver");
        dataSource.setUrl("jdbc:derby://localhost:1527/projekt-ksiegarnia");
        dataSource.setUsername("sa");
        dataSource.setPassword("sa");

        kategoriaDAO = new KategoriaDAO();
        ksiazkaDAO = new KsiazkaDAO();
        userDAO = new UserDAO();
        authoritiesDAO = new AuthoritiesDAO();

        kategoriaDAO.setDataSource(dataSource);
        ksiazkaDAO.setDataSource(dataSource);
        userDAO.setDataSource(dataSource);
        authoritiesDAO.setDataSource(dataSource);
    }

    @RequestMapping("/home")
    public ModelAndView home() {
        model = new ModelAndView("home");

        return model;
    }

    @RequestMapping("/category")
    public ModelAndView category_main(@RequestParam(value = "id", required = false) String id) {
        if (id == null) {
            model = new ModelAndView("category_main");

            model.addObject("kategorie", kategoriaDAO.findFirstNodes());
            return model;
        }
        model = new ModelAndView("category");

        model.addObject("kategorie", kategoriaDAO.findChildren(id));

        List<String> rodzice = new ArrayList<String>();
        rodzice = kategoriaDAO.findParents(id);
        List<Ksiazka> ksiazki = new ArrayList<Ksiazka>();
        List<Kategoria> kategorie = new ArrayList<Kategoria>();


        for (String rodzic : rodzice) {
            ksiazki.addAll(ksiazkaDAO.findByKatId(rodzic));
            kategorie.addAll(kategoriaDAO.findById(rodzic));
        }

        model.addObject("rodzice", kategorie);
        model.addObject("ksiazki", ksiazki);

        return model;
    }

    @RequestMapping("/book")
    public ModelAndView book(@RequestParam(value = "id", required = true, defaultValue = "1") String id) {
        model = new ModelAndView("book");
        
        List<String> rodzice = new ArrayList<String>();
        List<Kategoria> kategorie = new ArrayList<Kategoria>();
        
        rodzice = kategoriaDAO.findParents(ksiazkaDAO.getId_katById(id));
        
        for (String rodzic : rodzice) {
            kategorie.addAll(kategoriaDAO.findById(rodzic));
        }
        

        model.addObject("rodzice", kategorie);
        model.addObject("ksiazka", ksiazkaDAO.findById(id).get(0));

        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {

        model = new ModelAndView("login");
        if (error != null) {
            model.addObject("error", "Niepoprawny login lub hasło!");
        }

        if (logout != null) {
            model.addObject("msg", "Wylogowano się z powodzeniem.");
        }
        return model;

    }

    @RequestMapping("/dostepnosc")
    public ModelAndView dostepnosc() {
        model = new ModelAndView("dostepnosc");

        return model;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        model = new ModelAndView("admin");
        model.addObject("title", "Spring Security Custom Login Form");
        model.addObject("message", "This is protected page!");

        return model;
    }

    @RequestMapping(value = "/rejestracja")
    public ModelAndView rejestracja(
            @RequestParam(value = "login", required = false) String login,
            @RequestParam(value = "pass1", required = false) String pass1,
            @RequestParam(value = "pass2", required = false) String pass2,
            @RequestParam(value = "msg", required = false) String msg) {

        model = new ModelAndView("/rejestracja");

        if (msg != null) {
            if ((login != null && pass1 != null && pass2 != null) && pass1.equals(pass2)) {
                userDAO.addUser(login, pass1, Boolean.FALSE);
                authoritiesDAO.addAuthority(login, "ROLE_USER");

                model.addObject("msg", "Rejestracja udana. Czekaj na akceptację admina.");
            } else {
                model.addObject("error", "Niepoprawne dane.");
            }
        }

        return model;
    }
}
