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


<%

Connection db = null;
Statement smt = null;
ResultSet rs =null;
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
db=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","db_user","systemsss");
smt=db.createStatement();
String id = request.getParameter("id");

rs=smt.executeQuery("SELECT * FROM portaldb WHERE ID=" + id);
	while (rs.next()) {
%>
<h2><%=rs.getString("sitename")%>更新</h2>
<form action="update_p.jsp" method="post">
ID:<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
<%=request.getParameter("id") %>
<p>
登録名：<input type="text" name="sitename" value="<%=rs.getString("sitename")%>">
<p>
URL：<input type="text" name="url" value="<%=rs.getString("url")%>">
<p>
説明：<textarea name="info"><%=rs.getString("name")%></textarea>
<p>
<input type="submit" value="送信">
<input type="reset" name="リセット">

<%
}
}catch(SQLException e){
	 e.printStackTrace();

}finally{
	db.close();
	smt.close();
	rs.close();
}
%>

</form>



</body>
</html>