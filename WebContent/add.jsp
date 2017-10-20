<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.js"></script>
<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/doadd" method="POST" >
			<label>mile</label><input type="text" name="mile" value="${requestScope.oil.mile }" />
			<br>
			<label>cash</label><input type="text" name="cash" value="${requestScope.oil.cash }" />
			<br>
			<label>price</label><input type="text" name="price" value="${requestScope.oil.price }" />
			<br>
			<input type="submit" value="submit" />
	</form>
</body>
</html>