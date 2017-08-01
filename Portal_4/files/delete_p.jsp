<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*,java.text.*,java.util.*, java.text.*,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Insert title here</title>
</head>
<body>
<%

//DB用

Connection db = null;
Statement smt = null;
ResultSet rs =null;
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
db=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","db_user","systemsss");
smt=db.createStatement();

String id = request.getParameter("id");

if (id.equals("back")){

}else{
//	 int del = Integer.parseInt("id");
String sql
= "DELETE FROM portaldb WHERE id='" + id +"'";
smt.executeUpdate(sql);
System.out.println(sql);

}

}catch(SQLException e){
	 e.printStackTrace();

}finally{
	db.close();
	smt.close();
//	rs.close();
}

%>



<jsp:forward page="/" />

</body>
</html>