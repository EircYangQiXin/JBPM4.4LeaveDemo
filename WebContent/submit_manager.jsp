<%@page import="org.jbpm.api.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProcessEngine processEngine = Configuration.getProcessEngine();
	TaskService taskService = processEngine.getTaskService();
	request.setCharacterEncoding("UTF-8");
	String taskId = request.getParameter("id");
	String result = request.getParameter("result");
	
	taskService.completeTask(taskId, result);
	response.sendRedirect("index.jsp");
%>
