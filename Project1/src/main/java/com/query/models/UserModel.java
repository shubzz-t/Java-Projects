package com.query.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.entities.users;

public class UserModel {
	private Connection con = null;

	public UserModel(Connection con) {
		this.con = con;
	}

	// Saving users registration
	public boolean saveUser(users user) {
		String sql = "INSERT INTO users(name , email , password , gender , about ) VALUES(? , ? , ? , ? , ? )";
		boolean f = false;
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getGender());
			pst.setString(5, user.getAbout());
			pst.executeUpdate();
			f = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;

	}

	// GET USER BY EMAIL AND PASSWORD METHOD FOR LOGIN
	public users getUsersByEmailAndPassword(String email, String password) {
		users user = null;

		try {
			String query = "SELECT * FROM users where email=? and password=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				user = new users();
				user.setId(rs.getInt("id"));
				String name = rs.getString("name");
				user.setName(name);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("Time"));
				user.setProfile(rs.getString("profile"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;

	}

	// To update user
	public boolean updateUser(users user) {
		boolean f = false;
		String sql = "update users set name=? , email=? , password=? , about=? , profile=? where id=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getAbout());
			pst.setString(5, user.getProfile());
			pst.setInt(6, user.getId());

			pst.executeUpdate();
			f = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}


	//TO GET USERS BY POST TABLE USER ID
	public users getUserByPostUserid(int id)
	{
		users user = null;
		
		String sql = "SELECT * FROM users WHERE id=?";
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				user = new users();
				user.setId(rs.getInt("id"));
				String name = rs.getString("name");
				user.setName(name);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("Time"));
				user.setProfile(rs.getString("profile"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	
	// GET USER BY EMAIL AND PASSWORD METHOD FOR LOGIN
		public users getUsersByUserId(int uid) {
			users user = null;

			try {
				String query = "SELECT * FROM users where id=?";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setInt(1, uid);
				
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					user = new users();
					user.setId(rs.getInt("id"));
					String name = rs.getString("name");
					user.setName(name);
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setGender(rs.getString("gender"));
					user.setAbout(rs.getString("about"));
					user.setDateTime(rs.getTimestamp("Time"));
					user.setProfile(rs.getString("profile"));

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return user;

		}
		
		// GET USER BY EMAIL  METHOD FOR RESET
		public users getUsersByEmail(String email) {
			users user = null;

			try {
				String query = "SELECT * FROM users where email=?";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, email);
				ResultSet rs = pst.executeQuery();

				if (rs.next()) {
					user = new users();
					user.setId(rs.getInt("id"));
					String name = rs.getString("name");
					user.setName(name);
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setGender(rs.getString("gender"));
					user.setAbout(rs.getString("about"));
					user.setDateTime(rs.getTimestamp("Time"));
					user.setProfile(rs.getString("profile"));

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return user;

		}


}
