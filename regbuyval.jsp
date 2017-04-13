<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*"%>
<%    
        int status=0;
		String name=request.getParameter("name");
	    String email=request.getParameter("eid");
        String phno=request.getParameter("phno");
	  	String usn=request.getParameter("usn");
		String pwd=request.getParameter("pwd");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		ResultSet r=null;
		Statement s=null;
		try
		{
			try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			}
			catch(ClassNotFoundException cnfe)
			{
				cnfe.printStackTrace();
			}
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
			st=con.createStatement();
			s=con.createStatement();
			if(s.execute("select usn from register"))
	           {
	             r=s.getResultSet();
	            while(r.next())
	            {   
                  if(r.getString(1).equals(usn))
                  {
	                status=1;
	                break;
                  }
	            }
	           } 
			   if(status==0)
			{
			int rec=st.executeUpdate("insert into register values('"+name+"','"+email+"','"+phno+"','"+usn+"','"+pwd+"')");
			
			if(rec!=0)
			{
				response.sendRedirect("Login.html");
			}
			else
			{
				out.print("<h2>Fail</h2>");
			}
			}//if
			else
			{
				response.sendRedirect("regd.html");
			}//else
		}//try
		catch (SQLException se)
		{
			out.print("error message"+se);
		}
		%>