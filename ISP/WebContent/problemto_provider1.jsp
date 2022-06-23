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
	String a=request.getParameter("cid1");
	System.out.println("a======"+a);
	session.setAttribute("cid1", a);
	String b=request.getParameter("cname");
	session.setAttribute("cname", b);
	String c=request.getParameter("loc1");
	session.setAttribute("loc1", c);
	String strength=request.getParameter("strength");
	session.setAttribute("strength", strength);
	String pstatus="pending";
	String astatus="pending";
	String cemail1=request.getParameter("cemail");
	session.setAttribute("cemail1", cemail1);
	int count1=1;
	int c1=0;
	Statement st2 = null;
	ResultSet rs2=null;
	String cc="3";
	 try{
			
	     Connection con = databasecon.getconnection();
         PreparedStatement ps1=con.prepareStatement("select * from signal_complaint where cid='"+a+"' and location='"+c+"' and count1>='"+cc+"'");
	     ResultSet rs1=ps1.executeQuery();
	     if(rs1.next())
	     {
	    	/*  String c11=rs1.getString("count1");
	    	 int c2=Integer.parseInt(c11);
	    	 System.out.println("c2========="+c2);
	    	
	    	 if(c2>=5)
	    	 {
	    		
	    	 }
	      */
	    	 response.sendRedirect("recommend_network.jsp");
	     }
	     
	     else
	     {
	    	response.sendRedirect("problemto_provider.jsp"); 
}
	     
	 }
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>