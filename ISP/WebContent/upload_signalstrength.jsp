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

try
{
	String location=request.getParameter("location");
	String signal_strenght=request.getParameter("signal_strenght");
	
	
	Connection conn=databasecon.getconnection();
	String sql="insert into signal_strength(location,signal_strength) values(?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, location);
	ps.setString(2, signal_strenght);
	
	
	int aa=ps.executeUpdate();
	if(aa>0)
	{
	%>
	<script>
	alert("Signal Strength Upload Successfully");
	window.location="adminhome.jsp";
	</script>
	<% 
	}
	else
	{%>
		<script>
		alert("Upload Error");
		window.location="admin.jsp";
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