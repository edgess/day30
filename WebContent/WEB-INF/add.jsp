<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<form:form class="form-group has-feedback"
		action="${pageContext.request.contextPath }/doadd" method="POST"
		modelAttribute="oil">
		<div class="form-group">
			<label>mile</label>
			<form:input path="mile" class="input-xlarge form-control" />
		</div>
		<div class="form-group">
			<label>cash</label>
			<form:input path="cash" class="input-xlarge form-control" />
		</div>
		<div class="form-group">
			<label>price</label>
			<form:input path="price" class="input-xlarge form-control" />
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-default">Submit</button>
		</div>
	</form:form>
</body>
</html>