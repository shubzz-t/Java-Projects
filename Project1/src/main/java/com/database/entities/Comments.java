package com.database.entities;

public class Comments {
	int id;
	String comment;
	int pid;
	int uid;
//	int like;

	public Comments(int id, String comment, int pid, int uid, int like) {
		super();
		this.id = id;
		this.comment = comment;
		this.pid = pid;
		this.uid = uid;
	//	this.like = like;
	}

	public Comments(String comment, int pid, int uid, int like) {
		super();
		this.comment = comment;
		this.pid = pid;
		this.uid = uid;
		//this.like = like;
	}

	public Comments(String comment, int pid, int uid) {
		this.comment = comment;
		this.pid = pid;
		this.uid = uid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

//	public int getLike() {
//		return like;
//	}
//
//	public void setLike(int like) {
//		this.like = like;
//	}

}
