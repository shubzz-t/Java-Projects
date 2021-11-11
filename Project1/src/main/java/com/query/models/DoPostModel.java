package com.query.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.database.entities.Categories;
import com.database.entities.Posts;
import com.mysql.cj.protocol.Resultset;

import java.util.List;

public class DoPostModel {
	private Connection con;

	public DoPostModel(Connection con) {
		this.con = con;
	}

	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> listCat = new ArrayList<Categories>();
		String sqlQuery = "Select * from categories";

		try {
			PreparedStatement pst = con.prepareStatement(sqlQuery);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Categories c = new Categories(cid, name, description);
				listCat.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listCat;
	}

	public boolean savePost(Posts p) {
		boolean flag = false;

		try {
			String sql = "INSERT INTO posts (ptitle , pcontent , pcode , ppic , cid ,userid) 	VALUES(? , ? , ? , ? , ? , ?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, p.getPtitle());
			pst.setString(2, p.getPcontent());
			pst.setString(3, p.getPcode());
			pst.setString(4, p.getPpic());
			pst.setInt(5, p.getCid());
			pst.setInt(6, p.getUserid());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<Posts> getAllPosts() {
		List<Posts> list = new ArrayList<Posts>();
		try {
			PreparedStatement pst = con.prepareStatement("SELECT * FROM posts ORDER BY pid DESC");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				int cid = rs.getInt("cid");
				int userid = rs.getInt("userid");

				Posts post = new Posts(pid, ptitle, pcontent, pcode, ppic, date, cid, userid);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Posts> getPostsByCategory(int cid) {
		List<Posts> list = new ArrayList<Posts>();
		try {
			PreparedStatement pst = con.prepareStatement("SELECT * FROM posts WHERE cid=?");
			pst.setInt(1, cid);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				int userid = rs.getInt("userid");

				Posts post = new Posts(pid, ptitle, pcontent, pcode, ppic, date, cid, userid);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Posts getPostBypostID(int postid) {
		Posts post = null;
		String sql = "SELECT * FROM posts WHERE pid=?";

		try {
			PreparedStatement pst;
			pst = con.prepareStatement(sql);
			pst.setInt(1, postid);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				int userid = rs.getInt("userid");
				int cid = rs.getInt("cid");

				post = new Posts(pid, ptitle, pcontent, pcode, ppic, date, cid, userid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return post;
	}

	
	
	
	public List<Posts> getPostsByUserId(int uid) {
		List<Posts> list = new ArrayList<Posts>();
		try {
			PreparedStatement pst = con.prepareStatement("SELECT * FROM posts WHERE userid=?");
			pst.setInt(1, uid);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				int cid = rs.getInt("cid");

				Posts post = new Posts(pid, ptitle, pcontent, pcode, ppic, date, cid ,  uid);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void deletePost(int pid)
	{
		String sql = "DELETE FROM posts WHERE pid=?";
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
}
