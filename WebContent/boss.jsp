<%@page import="org.jbpm.api.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	ProcessEngine processEngine = Configuration.getProcessEngine();
	TaskService taskService = processEngine.getTaskService();
	String taskId =  request.getParameter("taskId");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="submit_boss.jsp" method="post" >
		<input type="hidden" name="id" value="${param.taskId}"/>
		 申请人:<%=taskService.getVariable(taskId, "owner") %><br/>
		申请日期：<%=taskService.getVariable(taskId, "day") %><br/>
		申请理由：<%=taskService.getVariable(taskId, "reason") %>
		<br/>
		<input type="submit" value="批准"/>
	</form>
</body>
</html>