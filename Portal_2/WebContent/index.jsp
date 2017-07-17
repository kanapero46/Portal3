<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<c:forEach var="date" items="${url}">
			<tr>
				<td>${date.id}</td>
				<td>${date.url}</td>
				<td>${date.name}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>