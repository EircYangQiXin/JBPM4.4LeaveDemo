<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.jbpm.api.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	ProcessEngine processEngine = Configuration.getProcessEngine();
	ExecutionService executionService = processEngine.getExecutionService();
	String username = (String)request.getSession().getAttribute("username");
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("owner",username);
	executionService.startProcessInstanceById(id, map);
	response.sendRedirect("index.jsp");
	
%>