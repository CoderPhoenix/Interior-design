<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>

<%
       String cap = request.getParameter("caption");
        int status =0;
	    try{
	     	         		            
	       try{  Class.forName("oracle.jdbc.driver.OracleDriver");}
		   catch(ClassNotFoundException cnfe)
			{cnfe.printStackTrace();}
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s = null ;
	         s=con.createStatement();
	           if(s.execute("select caption from sell"))
	           {
	            ResultSet rs=s.getResultSet();
	            while(rs.next())
	            {   
                  if(rs.getString(1).equals(cap))
                  {
	                status=1;
	                break;
                  }
	            }
	           } 
	        }
	      catch(Exception e){e.printStackTrace();}
	    if(status==1)
        {
             response.sendRedirect("askdup.html");
        }
        else
        {
			 
 String cost=request.getParameter("cost");
session.setAttribute("cost",cost);
session.setAttribute("caption",cap);
String description=request.getParameter("descp");
session.setAttribute("descrp",description);
response.sendRedirect("uploadform.jsp");
 
        }
        %>