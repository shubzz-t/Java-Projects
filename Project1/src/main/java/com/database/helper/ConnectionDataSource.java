package com.database.helper;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionDataSource {
	public static Context context = null;
	public static DataSource dataSource = null;
	public static Connection con = null;

	public static Connection setConnection() {
		try {
			if (dataSource == null) {

				context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/project");

				if (con == null) {
					con = dataSource.getConnection();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
