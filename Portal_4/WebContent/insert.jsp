<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*,java.text.*,java.util.*, java.text.*,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<title>ページの挿入</title>
</head>
<body>
<div>


</div>
<%

//DB用

      Connection db = null;
      Statement smt = null;
      ResultSet rs =null;
try{


    Date date = new Date();

    String time = DateFormat.getDateInstance().format(date);

     System.out.println(time);

Class.forName("oracle.jdbc.driver.OracleDriver");
db=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","db_user","systemsss");
smt=db.createStatement();
request.setCharacterEncoding("UTF-8");
String url = request.getParameter("url");
String info = request.getParameter("info");
String sitename = request.getParameter("sitename");

String sql
= "INSERT INTO portaldb VALUES(SEQ_ID.NEXTVAL,'" + url + "','" + info +"','"+ time + "','" + sitename +"')";

smt.executeUpdate(sql);
System.out.println(sql);

String commit = "COMMIT;";
smt.executeUpdate(commit);

}catch(SQLException e){
	 e.printStackTrace();

}finally{
	db.close();
	smt.close();
//	rs.close();
}
%>
<jsp:forward page="/WebContent/show.jsp" />

</body>
</html>