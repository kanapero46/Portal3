package db_ma;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/del")
public class DBdelete {

	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException,
	ServletException, SQLException{

		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		out.println("<html><head><title>データの削除</title></head>");
		out.println("<body>");

		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;

		try{
			conn = DBManager.getConnection();

			stm = conn.createStatement();

			String id = req.getParameter("id");
			stm.executeUpdate(id);
			rs = stm.executeQuery(DBManager.sqlDelete(id));

			out.println("<p>" + id + "の削除しました。</p>");

		}catch(Exception e){
			out.println("<p>");
			out.println("データベースとの処理に失敗したため、処理を中止しました。</p>");
		}finally{
			rs.close();
			stm.close();
			out.println("<p>処理が終了しました。</p>");
		}

		out.print("</body></html>");

	}



}
