package com.query.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.entities.Comments;
import com.mysql.cj.protocol.Resultset;

public class CommentModel {

	Connection con;

	public CommentModel(Connection con) {
		this.con = con;
	}

	public boolean insertComment(String comment, int uid, int pid) {
		String sql = "INSERT INTO comments(comment , uid , pid) VALUES(? , ? , ?)";
		boolean f = false;
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, comment);
			pst.setInt(2, uid);
			pst.setInt(3, pid);
			pst.executeUpdate();
			f = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}

	public ArrayList<Comments> getCommentsByPost(int pid) {
		ArrayList<Comments> list = new ArrayList<Comments>();
		Comments com;
		String sql = "SELECT * FROM comments WHERE pid=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				com = new Comments(rs.getString("comment"), rs.getInt("pid"), rs.getInt("uid") , rs.getInt("likedis"));
				list.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
