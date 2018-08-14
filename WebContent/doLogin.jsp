<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	
	request.getSession().setAttribute("username", username);
	
	response.sendRedirect("index.jsp");
%>