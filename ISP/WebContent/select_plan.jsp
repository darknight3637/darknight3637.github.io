<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
    <%
  String cid=(String)session.getAttribute("cid");
String cname=(String)session.getAttribute("cname");
%>
    <% 
    String planid=request.getParameter("planid");
    String pname=request.getParameter("pname");
    String strength=request.getParameter("strength");
    String amount=request.getParameter("amount");
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
Statement st2 = null;
ResultSet rs2=null;


Connection conn=databasecon.getconnection();
String sql="insert into plan_selectiondet(cid,cname,pid,pname,strength,amount) values(?,?,?,?,?,?)";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setString(1, cid);
ps.setString(2, cname);
ps.setString(3, planid);
ps.setString(4, pname);
ps.setString(5, strength);
ps.setString(6, amount);

int aa=ps.executeUpdate();
if(aa>0)
{
%>
<script>
alert("Plan Selection Successfully");
window.location="customer_home.jsp";
</script>
<% 
}
else
{%>
	<script>
	alert("Plan Selection Error");
	window.location="customer_home.jsp";
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