<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   String osignal="pending";
	String solution="pending";
	
	String a=(String)session.getAttribute("cid1");
	
	String b=(String)session.getAttribute("cname");
	
	String c=(String)session.getAttribute("loc1");
	
	String strength=(String)session.getAttribute("strength");
	String cemail1=(String)session.getAttribute("cemail1");
	String pstatus="pending";
	String astatus="pending";
	
	int count1=1;
	int c1=0;
	Statement st2 = null;
	ResultSet rs2=null;
	 try{
			
	     Connection con = databasecon.getconnection();
         PreparedStatement ps1=con.prepareStatement("select * from signal_complaint where cid='"+a+"' and location='"+c+"'");
	     ResultSet rs1=ps1.executeQuery();
	     if(rs1.next())
	     {
	    	 String c11=rs1.getString("count1");
	    	 int c2=Integer.parseInt(c11);
	    	 System.out.println("c2========="+c2);
	    	 c1=c2+1;
	    	 try
	    	 {
	    	 Connection conn1=databasecon.getconnection();
	    	 String sql2="update signal_complaint set count1='"+c1+"',provider_status='"+pstatus+"',admin_status='"+astatus+"' where cid='"+a+"' and location='"+c+"'";
	    	 PreparedStatement ps2=conn1.prepareStatement(sql2);
	    	 int bb=ps2.executeUpdate();
	    	 if(bb>0)
	    	 {
	    	 %>
	    	 <script>
	    	 alert("Complaint Send To Service Provider");
	    	 window.location="searchsignal_strength.jsp";
	    	 </script>
	    	 <% 
	    	 }
	    	 else
	    	 {%>
	    	 	<script>
	    	 	alert("Send Error");
	    	 	window.location="searchsignal_strength.jsp";
	    	 	</script>
	    	 <% 	
	    	 }
	    	 }
	    	 catch(Exception ex1)
	    	 {
	    	 	ex1.printStackTrace();
	    	 }
	     }
	     
	     else
	     {
	    	 try
	    	 {	 
	     
	Connection conn=databasecon.getconnection();
	String sql="insert into signal_complaint(cid,cname,location,signal_strength,count1,provider_status,admin_status,original_signal,solution,cemail) values(?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, strength);
	ps.setInt(5, count1);
	ps.setString(6, pstatus);
	ps.setString(7, astatus);
	ps.setString(8, osignal);
	ps.setString(9, solution);
	ps.setString(10, cemail1);
	
	int aa=ps.executeUpdate();
	if(aa>0)
	{
	%>
	<script>
	alert("Complaint Send TO Service Provider");
	window.location="searchsignal_strength.jsp";
	</script>
	<% 
	}
	else
	{%>
		<script>
		alert("Send Error");
		window.location="searchsignal_strength.jsp";
		</script>
		<% 	
		}
	    	 }
	    	 catch(Exception ex2)
	    	 {
	    	 	ex2.printStackTrace();
	    	 }
}
	 }
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>