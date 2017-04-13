<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>
 
<%
Statement st=null;
Connection con=null;
try
{
	try
	{
Class.forName("jdbc.oracle.driver.OracleDriver");
	}
	catch(ClassNotFoundException cnfe)
	{
		cnfe.printStackTrace();
	}
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
st=con.createStatement();
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
}
catch (FileUploadException e)
{
e.getMessage();
}
 
Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if (item.isFormField())
{
String name = item.getFieldName();
String value = item.getString();
if(name.equals("ImageFile"))
{
ImageFile=value;
}
 
}
else
{
try
{
itemName = item.getName();
out.print(itemName);
 if (itemName != null)
	 {
     itemName = FilenameUtils.getName(itemName);
     }
out.print(itemName);
File savedFile = new File(config.getServletContext().getRealPath("/")+"Example\\image-folder\\"+itemName);
item.write(savedFile);
}
catch (Exception e)
{
out.println("Error"+e.getMessage());
}
}
}
try
{
int r=st.executeUpdate("insert into sell(usn,cost,caption,description,image) values ('"+session.getAttribute("usn")+"','"+session.getAttribute("cost")+"','"+session.getAttribute("caption")+"','"+session.getAttribute("descrp")+"','"+itemName+"')");
 response.sendRedirect("exit.html");
}
catch(Exception el)
{
out.println("Inserting error"+el.getMessage());
}
}
}
catch (Exception e){
out.println(e.getMessage());
}
%>