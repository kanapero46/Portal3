<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"
         import="java.sql.*,java.text.*,java.util.*, java.text.*,java.util.Date" %>
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

while(rs.next()){
%>


<h2>ページの削除</h2>
<p>
ID：<%= request.getParameter("id") %>
</p>
<p>
サイト名：<%=rs.getString("sitename") %>
</p>

<form action="<%=request.getContextPath()%>/delete_p.jsp">
<button value="<%=request.getParameter("id")%>" name="id">実行</button>
<button value="back" name="id">戻る</button>
</form>

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
</body>
</html>