package com.query.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.entities.Contact;

public class ContactModel {
	Connection con;

	public ContactModel(Connection con) {
		this.con = con;
	}

	public boolean insertcontactDetails(Contact contact) {
		boolean f = false;
		String sql = "INSERT INTO contact(name , email , subject , message) VALUES(? , ? , ? , ?)";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, contact.getName());
			pst.setString(2, contact.getEmail());
			pst.setString(3, contact.getSubject());
			pst.setString(4, contact.getMessage());
			pst.executeUpdate();
			f = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}
}
