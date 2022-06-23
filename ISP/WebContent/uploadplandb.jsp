<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Internet service provider</title>
</head>
<body>
<%
String serviceid=(String)session.getAttribute("uid");
String servicename=(String)session.getAttribute("uname");
try
{
	String planname=request.getParameter("planname");
	String signal_strenght=request.getParameter("signal_strenght");
	String duration=request.getParameter("duration");
	String amount=request.getParameter("amount");
	String location=request.getParameter("location");
	
	Connection conn=databasecon.getconnection();
	String sql="insert into plan_details(serviceid,servicename,plan_name,signal_strength,duration,amount,location) values(?,?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, serviceid);
	ps.setString(2, servicename);
	ps.setString(3, planname);
	ps.setString(4, signal_strenght);
	ps.setString(5, duration);
	ps.setString(6, amount);
	ps.setString(7, location);
	
	int aa=ps.executeUpdate();
	if(aa>0)
	{
	%>
	<script>
	alert("Plan Upload Successfully");
	window.location="sprovider_home.jsp";
	</script>
	<% 
	}
	else
	{%>
		<script>
		alert("Upload Error");
		window.location="sprovider_home.jsp";
		</script>
<% 	}
}

catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>