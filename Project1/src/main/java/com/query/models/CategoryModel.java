package com.query.models;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CategoryModel {
	Connection con;

	public CategoryModel(Connection con) {
		this.con = con;
	}

	public void insertCategory(String title, String description) {
      String sql = "INSERT INTO categories(name , description) VALUES(? , ? )";
      try {
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, title);
		pst.setString(2, description);
		pst.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
}
