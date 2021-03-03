package com.web.lubway;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class ConnectionTest {
	private static final String DRIVER = "org.postgresql.Driver";
	private static final String URL = "jdbc:postgresql://lubwaydb.cev6lvxux0tw.ap-northeast-2.rds.amazonaws.com:5432/lubwaydb";
	private static final String ID = "lubwaydb";
	private static final String PASS = "lubwaydb";

	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		try (Connection conn = DriverManager.getConnection(URL, ID, PASS)) {
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
