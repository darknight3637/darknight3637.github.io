
<html>
<body>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>
<%
	 
        String uname=request.getParameter("uname");
         System.out.println("uname="+uname);
        String pword=request.getParameter("password");
        System.out.println("password="+pword);
		
		
         
	    try{
			
	     Connection con = databasecon.getconnection();
         PreparedStatement ps=con.prepareStatement("select *  from sprovider_register where uname='"+uname+"' and password='"+pword+"'");
	     ResultSet rs=ps.executeQuery();
		 if(rs.next())
		 { 
		
		 
		 String n=rs.getString("id");
		 session.setAttribute("uid",n);
		 String p=rs.getString("uname");
		 session.setAttribute("uname",p);
		 System.out.println("username"+p);
		 // String m=rs.getString("email");
		// session.setAttribute("bb",email);
		// System.out.println("email id"+bb);
		 
		   
	     response.sendRedirect("sprovider_home.jsp");
		
		 }
		 else
		 {%>
		 <script>alert("incorrect username and password");
		 window.location="service_provider.jsp";
		 </script>
	<%
		 }
		

	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
	
	
%>
</body>
</html>