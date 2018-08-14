<%@page import="org.jbpm.api.task.Task"%>
<%@page import="java.util.List"%>
<%@page import="org.jbpm.api.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" type="text/css" href="style.css" />
</head>
<body>
<%
	String username =(String)session.getAttribute("username");
	if(null == username){
		response.sendRedirect("login.jsp");
	}
	/* 加载配置文件 */
	ProcessEngine processEngine = Configuration.getProcessEngine();
	/* 获取RepositoryService */
	RepositoryService repositoryService = processEngine.getRepositoryService();
	ExecutionService executionService = processEngine.getExecutionService();
	TaskService taskService = processEngine.getTaskService();
	/* 获取已发布的流程列表 */
	List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().list();
	List<ProcessInstance> processInstances  = executionService.createProcessInstanceQuery().list();
	List<Task> tasks = taskService.findPersonalTasks(username);
	
%>
	<div>
		<span>当前登录用户：[<%=username %>]</span> <a href="login.jsp">登录</a>
		<a href="deploy.jsp?action=deploy">发布新流程</a>  <a href="login.jsp"></a>
	</div>
	<h2>流程列表</h2>
		<table>
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Version</td>
				<td>操作</td>
			</tr>
		<%  
			for(ProcessDefinition pd : list) {
		%>
			<tr>
				<td><%=pd.getId() %></td>
				<td><%=pd.getName() %></td>
				<td><%=pd.getVersion() %></td>
				<td>
					<a href="remove.jsp?deploymentId=<%=pd.getDeploymentId() %>">删除</a>|
					<a href="start.jsp?id=<%=pd.getId() %>">开始</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		<h2>实例列表</h2>
		<table>
			<tr>
				<td>ID</td>
				<td>活动</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<%for(ProcessInstance pi : processInstances){ %>
				<tr>
					<td><%=pi.getId() %></td>
					<td><%=pi.findActiveActivityNames() %></td>
					<td><%=pi.getState() %></td>
					<td><a href="manager.jsp?taskId=<%=pi.getId() %>">审批</a></td>
				</tr>
			<%} %>
		</table>
		
			<h2>任务列表</h2>
		<table>
			<tr>
				<td>ID</td>
				<td>名称</td>
				<td>操作</td>
			</tr>
			<%for(Task task :tasks){ %>
				<tr>
					<td><%=task.getId() %></td>
					<td><%=task.getName() %></td>
					<td><a href="<%=task.getFormResourceName() %>?taskId=<%=task.getId() %>">查看</a><br /></td>
				</tr>
			<%} %>
		</table>
</body>
</html>