package db_ma;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager{

	/**
	 * DB接続用ドライバの登録
	 */
	/** ドライバクラス名 */
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	/** 接続するDBのURL */
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	/** DB接続するためのユーザー名 */
	private static final String USER_NAME = "db_user";
	/** DB接続するためのパスワード */
	private static final String PASSWORD = "systemsss";


	public static Connection getConnection() throws Exception{
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(
					URL,USER_NAME,PASSWORD);
			return con;
		}catch(Exception e){
			throw new Exception(e);
		}
	}

	public static void main(String[] args) throws Exception{
		Connection con = getConnection();
		System.out.println("接続しました");
		System.out.println("con = " + con);
		con.close();

	}

}