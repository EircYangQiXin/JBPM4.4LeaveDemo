<%@page import="org.jbpm.api.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProcessEngine processEngine = Configuration.getProcessEngine();
	TaskService taskService = processEngine.getTaskService();
	
	String taskId= request.getParameter("id");
	
	taskService.completeTask(taskId);
	
	response.sendRedirect("index.jsp");

%>