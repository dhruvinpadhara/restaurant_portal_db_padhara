<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function user() {
		window.location.href="file?i=19"
	}
	function admin() {
		window.location.href="file?i=0";
	}
</script>
</head>
<body>
<button onclick="user()">UserSide</button>
<br>
<button onclick="admin()">Admin side</button>
</body>
</html>
