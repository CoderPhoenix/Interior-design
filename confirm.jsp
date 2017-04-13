<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"%>
<%
String cap=request.getParameter("caption");
Connection con=null;
Statement st=null;
Statement sts=null;
ResultSet rs=null;
try
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	catch(ClassNotFoundException cnfe)
	{
		cnfe.printStackTrace();
	}
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
st=con.createStatement();
sts=con.createStatement();
rs=sts.executeQuery("select image from sell where usn='"+session.getAttribute("usn")+"' and caption='"+cap+"'");
if(rs.next())
	{
       String pic=rs.getString(1);
	   String path=(config.getServletContext().getRealPath("/")+"Example\\image-folder\\"+pic);
	   new File(path).delete();
    }
int r=st.executeUpdate("delete from sell where usn='"+session.getAttribute("usn")
+"' and caption='"+cap+"'");
if(r!=0)
	{
	response.sendRedirect("home.html");
	}
	else
	{
		out.println("fail...");
	}
}//try
catch(Exception e)
{
	e.printStackTrace();
}
%>