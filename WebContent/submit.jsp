<%@page import="java.util.*"%>
<%@page import="org.jbpm.api.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProcessEngine processEngine = Configuration.getProcessEngine();
	TaskService taskService = processEngine.getTaskService();
	
	String owner = request.getParameter("owner");
	String id = request.getParameter("id");
	int day = Integer.parseInt(request.getParameter("day"));
	String reason = request.getParameter("reason");
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("day", day);
	map.put("reason",reason);
	
	taskService.completeTask(id, map);
	
	response.sendRedirect("index.jsp");

%>
