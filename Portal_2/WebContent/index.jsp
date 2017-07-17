<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page contentType="text/html; charset=UTF-8"
         import="java.sql.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
</head>
<body>
	<table border="1">

<th>ID</th>
<th>URL</th>
<th>説明</th>
<th>削除</th>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection db=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","db_user","systemsss");
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery("SELECT * FROM portaldb");
while(rs.next()){
%>



			<tr>
				<td><%=rs.getString("id")%></td>
				<td><a href="<%=rs.getString("url")%>"><%=rs.getString("url")%></a></td>
				<td><%=rs.getString("name")%></td>
				<td><form action="/remove.jsp"><input type="button" value="削除" name="remove"></form></td>
			</tr>
	</table>
<%
}
rs.close();
objSql.close();
db.close();
%>


</body>
</html>