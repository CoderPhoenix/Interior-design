<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>

<%
       String username = request.getParameter("usrname");
        String password = request.getParameter("psw");
        int status =0;
	    try{
	     	         		            
	       try{  Class.forName("oracle.jdbc.driver.OracleDriver");}
		   catch(ClassNotFoundException cnfe)
			{cnfe.printStackTrace();}
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s = null ;
	         s=con.createStatement();
	           if(s.execute("select usn,pwd from register"))
	           {
	            ResultSet rs=s.getResultSet();
	            while(rs.next())
	            {   
                  if(rs.getString(1).equals(username)&&rs.getString(2).equals(password))
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
        session.setAttribute("usn",username);  
             response.sendRedirect("ask.html");
        }
        else
        {
        	response.sendRedirect("El.html");
        }
        %>