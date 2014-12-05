/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksiegarnia.dao;

import com.ksiegarnia.model.Kategoria;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Damian
 */
@Repository
public class KategoriaDAO {

    private JdbcTemplate jdbcTemplate;
    private String query;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public String kategoria() {
        query = "select nazwa from kategoria k, kat_paths kp where kp.node_id = k.id and parent_id=3 and depth_path=1";
        return jdbcTemplate.queryForObject(query, String.class);
    }

    public List<Kategoria> findAllParents() {
        query = "select id,nazwa from kategoria where id <=7";
        return jdbcTemplate.query(query, new CategoryMapper());
    }

    private static final class CategoryMapper implements RowMapper<Kategoria> {

        public Kategoria mapRow(ResultSet rs, int rowNum) throws SQLException {
            Kategoria kategoria = new Kategoria();
            kategoria.setId(rs.getInt("id"));
            kategoria.setNazwa(rs.getString("nazwa"));
            System.out.println(kategoria.toString());
            return kategoria;
        }
    }
// Implement the DAO methods using jdbcTemplate
}
