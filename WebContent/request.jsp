<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="submit.jsp" method="post" >
		<input type="hidden" name="id" value="${param.taskId}"/>
		 申请人:<input type="text" name="username" value="${sessionScope['username']}" /><br/>
		申请日期：<input type="text" name="day"/><br/>
		申请理由：<textarea name="reason" rows="5" cols="30">
		</textarea><br/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>