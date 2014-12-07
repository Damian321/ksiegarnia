/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksiegarnia.dao;

import com.ksiegarnia.model.Ksiazka;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Damian
 */

public class KsiazkaDAO {

    private JdbcTemplate jdbcTemplate;
    private String query;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Ksiazka> findOneById(String id){
        query = "select * from ksiazka where id = " + id;
        return jdbcTemplate.query(query, new KsiazkaMapper());
    }
    
    public List<Ksiazka> findAllById(String id) {
        query = "select * from SA.KSIAZKA where id_kat = "+id;
        return jdbcTemplate.query(query, new KsiazkaMapper());
    }
    
    
    private static final class KsiazkaMapper implements RowMapper<Ksiazka> {

        public Ksiazka mapRow(ResultSet rs, int rowNum) throws SQLException {
            Ksiazka ksiazka = new Ksiazka();
            ksiazka.setId(rs.getInt("id"));
            ksiazka.setId_kat(rs.getInt("id_kat"));
            ksiazka.setISBN(rs.getString("ISBN"));
            ksiazka.setTytul(rs.getString("tytul"));
            ksiazka.setAutor(rs.getString("autor"));
            ksiazka.setCytat(rs.getString("cytat"));
            ksiazka.setAutor_cytatu(rs.getString("autor_cytatu"));
            ksiazka.setOpis(rs.getString("opis"));
            ksiazka.setLiczba_stron(rs.getInt("liczba_stron"));

            return ksiazka;
        }
    }
}
