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
<title>Insert title here</title>
</head>
<body>
<%
try
{
	String a=request.getParameter("fullname");
	String b=request.getParameter("email");
	String c=request.getParameter("mobile");
	String location=request.getParameter("location");
	String d=request.getParameter("uname");
	String e=request.getParameter("password");
	
	
	Statement st2 = null;
	ResultSet rs2=null;
	Connection	con1=databasecon.getconnection();
	st2=con1.createStatement();
	String sql1="select * from sprovider_register where uname='"+d+"'";
	rs2=st2.executeQuery(sql1);
	if(rs2.next()){
		%>
		 <script>
		  alert("Username already exist");
		  window.location="sprovider_register.jsp";
		  </script>
		  <% 
	}
	else
	{
	Connection conn=databasecon.getconnection();
	String sql="insert into sprovider_register(fullname,email,mobile,location,uname,password) values(?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, location);
	ps.setString(5, d);
	ps.setString(6, e);
	
	int aa=ps.executeUpdate();
	if(aa>0)
	{
	%>
	<script>
	alert("Register successfully");
	window.location="service_provider.jsp";
	</script>
	<% 
	}
	else
	{%>
		<script>
		alert("Register Error");
		window.location="sprovider_register.jsp";
		</script>
<% 	}
}
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>