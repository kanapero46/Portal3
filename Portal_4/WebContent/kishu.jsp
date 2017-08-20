<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*,java.text.*,java.util.*, java.text.*,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">

		<th>ID</th>
		<th>カラー</th>

		<tr>
			<%
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection db = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "db_user", "systemsss");
				Statement objSql = db.createStatement();
				ResultSet rs = objSql.executeQuery("SELECT * FROM ctl");
				while (rs.next()) {
			%>

		<td><%=rs.getString("id")%></td>
		<%
		if (rs.getString("color").equals("カラー")){
		%>
		<td><img src="img/clr.jpg"></td>
		<%
		}
		else if(rs.getString("color").equals("モノクロ")){
		%>
		<td><img src="img/mn.jpg"></td>
		</tr>
		<%
		}
				}
				rs.close();
				objSql.close();
				db.close();
			%>

</table>
</body>
</html>