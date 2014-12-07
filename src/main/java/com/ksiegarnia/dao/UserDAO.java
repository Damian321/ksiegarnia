/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ksiegarnia.dao;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Damian
 */
public class UserDAO {
    private JdbcTemplate jdbcTemplate;
    private String query;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public void addUser(String username, String password, Boolean enabled){
        query = "INSERT INTO users VALUES ('"+username+"','"+password+"',"+enabled+")";

        jdbcTemplate.execute(query);
        
    }
}
