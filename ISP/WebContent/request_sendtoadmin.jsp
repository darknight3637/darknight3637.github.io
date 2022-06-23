<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
 
    <% 
    String unid=request.getParameter("id");
  
    %>
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
String pstatus="sendtoadmin";
Statement st2 = null;
ResultSet rs2=null;


Connection conn=databasecon.getconnection();
String sql="update signal_complaint set provider_status='"+pstatus+"' where id='"+unid+"'";
PreparedStatement ps=conn.prepareStatement(sql);
int aa=ps.executeUpdate();
if(aa>0)
{
%>
<script>
alert("Send to Admin");

window.location="determine_signal.jsp";
</script>
<% 
}
else
{%>
	<script>
	alert("Error");
	window.location="determine_signal.jsp";
	</script>
<% 	
}
}

catch(Exception ex)
{
ex.printStackTrace();
}
%>

</body>
</html>