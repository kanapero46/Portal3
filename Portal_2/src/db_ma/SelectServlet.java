package db_ma;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.Statement;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/servlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String sql = "SELECT * FROM p_user";

		Connection con = null;
		Statement smt = null;
		System.out.println("----start------");
		try {
			con = DBManager.getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);

			List<DBDate> list = new ArrayList<DBDate>();

			while (rs.next()) {
				DBDate url = new DBDate();
				url.setId(rs.getInt("Id"));
				url.setURL(rs.getString("url"));
				url.setName(rs.getString("name"));

				list.add(url);
				System.out.println("call SQL");
			}

			req.setAttribute("url", list);

		} catch (SQLException e) {
			throw ServletException(e);

		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} finally {
			// DBとの切断処理
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {

				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {

				}
			}
		}

		req.getRequestDispatcher("/index.jsp").forward(req, res);

	}

	public static void main(String[] args)throws Exception{
		System.out.println("--connect true?---");
		System.out.println("接続しました");
		System.out.println("con = " + con);
		con.close();

	}
	}

}
