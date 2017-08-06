<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
</head>
<body>

	<!-- <a href="insert.html">データ追加ページ</a> -->

	<table border="1">

		<th>ID</th>
		<th>サイト名</th>
		<th>URL</th>
		<th>説明</th>
		<th>削除</th>
		<tr>
			<%
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection db = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "db_user", "systemsss");
				Statement objSql = db.createStatement();
				ResultSet rs = objSql.executeQuery("SELECT * FROM portaldb");
				while (rs.next()) {
			%>


			<form action="/Portal_4/WebContent/delete.jsp" method="get">

				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("sitename")%></td>
				<td><a target="_blank" href="<%=rs.getString("url")%>"
					name="<%=rs.getString("url")%>"><%=rs.getString("url")%></a></td>
				<td><%=rs.getString("name")%></td>
				<td><button value="<%=rs.getString("id")%>" name="id">削除</button></td>


			</form>

			<form action="/Portal_4/WebContent/link.jsp" method="get">
				<!-- 		リンク先を開く処理 -->
				<td><button value="<%=rs.getString("id")%>" name="id">開く</button></td>
			</form>

<!-- 			<form action="/Portal_4/WebContent/update.jsp" method="get"> -->
<form action="update.jsp" method="post">
				<!-- 		リンク先を開く処理 -->
				<td><button value="<%=rs.getString("id")%>" name="id">更新</button></td>
			</form>
		</tr>
		<%
			}
			rs.close();
			objSql.close();
			db.close();
		%>

	</table>


</body>
</html>