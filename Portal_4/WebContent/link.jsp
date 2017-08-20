<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*,java.text.*,java.util.*, java.text.*,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%

Connection db = null;
Statement smt = null;
ResultSet rs =null;
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
db=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","db_user","systemsss");
smt=db.createStatement();
System.out.println(request.getParameter("url"));

%>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="1;URL=<%=request.getParameter("url") %>">

<title>Insert title here</title>
</head>
<body>


<%

}catch(SQLException e){
	 e.printStackTrace();

}finally{
	db.close();
	smt.close();
//	rs.close();
}
%>




</body>
</html>