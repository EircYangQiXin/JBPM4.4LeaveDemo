<%@page import="org.jbpm.api.RepositoryService"%>
<%@page import="org.jbpm.api.ProcessDefinition"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProcessEngine processEngine = Configuration.getProcessEngine();
	RepositoryService repositoryService = processEngine.getRepositoryService();
	repositoryService.deleteDeploymentCascade(request.getParameter("deploymentId"));
	response.sendRedirect("index.jsp");
%>