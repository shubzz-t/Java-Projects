package com.query.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikesModel {
	Connection con = null;

	public LikesModel(Connection con) {
		this.con = con;
	}

	//////////////////////// INSERT LIKE////////////////////////////////////////////
	public boolean insertLike(int pid, int uid, int like) {
		boolean insert = false;
		String sql = "INSERT INTO likedislike(pid , uid , likedislikeid) VALUES(? , ? , ? )";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.setInt(3, like);
			pst.executeUpdate();
			insert = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insert;
	}

	//////////////////////// IS LIKED BY USER////////////////////////////////////////////////////////////////////
	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
		String sql = "SELECT * FROM likedislike WHERE pid=? AND uid=? AND likedislikeid=?";

		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.setInt(3, 1);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				f = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}

	//////////////////////// UPDATE DISLIKE TO LIKE///////////////////////////////////////////////////////////
	public boolean UpdateDtoL(int pid, int uid) {
		boolean f = false;
		String sql = "UPDATE likedislike SET likedislikeid=? WHERE pid=? AND uid=?";

		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, 1);
			pst.setInt(2, pid);
			pst.setInt(3, uid);
			int rs = pst.executeUpdate();

			f = true;
		} catch (

		SQLException e) {
			e.printStackTrace();
		}

		return f;
	}

////////////////////////INSERT DISLIKE////////////////////////////////////////////////////////////////////////////////
	public boolean insertDislike(int pid, int uid, int like) {
		boolean insert = false;
		String sql = "INSERT INTO likedislike(pid , uid , likedislikeid) VALUES(? , ? , ? )";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.setInt(3, like);
			pst.executeUpdate();
			insert = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insert;
	}

	///////////////////////// IS DISLIKED BY USER/////////////////////////////////////////////////
	public boolean isDislikedByUser(int pid, int uid) {
		boolean f = false;
		String sql = "SELECT * FROM likedislike WHERE pid=? AND uid=? AND likedislikeid=?";

		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.setInt(3, 0);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				f = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	//////////////////////// UPDATE DISLIKE TO LIKE///////////////////////////////////////////////////////////
	public boolean UpdateLtoD(int pid, int uid) {
		boolean f = false;
		String sql = "UPDATE likedislike SET likedislikeid=? WHERE pid=? AND uid=?";

		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, 0);
			pst.setInt(2, pid);
			pst.setInt(3, uid);
			int rs = pst.executeUpdate();

			f = true;
		} catch (

		SQLException e) {
			e.printStackTrace();
		}

		return f;
	}

	
////////////////////////COUNT LIKE///////////////////////////////////////////////////////////
	public int countLikeOnPost(int pid, int likeid) {
		int count = 0;

		String sql = "SELECT count(*) FROM likedislike WHERE pid=? AND likedislikeid=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, likeid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}
	
	
////////////////////////COUNT DISLIKE///////////////////////////////////////////////////////////
	public int countDislikeOnPost(int pid, int likeid) {
		int count = 0;

		String sql = "SELECT count(*) FROM likedislike WHERE pid=? AND likedislikeid=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, likeid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

}
