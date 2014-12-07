/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ksiegarnia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Damian
 */

@Controller
@RequestMapping("/pracownik/*")
public class PracownikController {
    private ModelAndView model;
    
    @RequestMapping("panel")
    public ModelAndView panel(){
        model = new ModelAndView("pracownik/panel");
        
        return model;
    }
    
}
