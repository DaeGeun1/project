package kr.co.marking;


import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class OracleConnectionTest {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "marking";
	private static final String PASSWORD = "1234";
	
	//드라이브 로드s
	static {
		try {
			Class.forName(DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Test
	public void connectionTest() {
		try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD)){
			log.info(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
