 <%@ page import="java.sql.*"%>
 <html>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
div.a {

    margin-bottom:80px;
    float: left;
   
}

h1.first
{
text-align:center;
padding:30px;
color:white;
font-weight:bold;
font-size:50px;
font-family:Comic Sans MS, cursive, sans-serif;
border-style:solid;
background-color:#4B0082;
margin-bottom:0px;
}
body
	{
		background-color:grey;
background-image:url("mbge.jpg") ; background-attachment:fixed;
background-repeat:no-repeat;
	}
.button {
    background-color: purple;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
<title>View Image Page</title>
</head>
<body>
<h1 class="first">HOME DECOR <sub>explore and make it yrs</sub></h1>


   <a href="home.html" class="button" style="margin-left:1470px">Logout</a>  <br><br> 
<!--  content -->
<%
Statement st=null;
Statement st2=null;
ResultSet rs2=null;
Connection con=null;
ResultSet rs=null;
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
rs=st.executeQuery("select * from sell");
 while(rs.next())
{
	 
%>
<div class="a">
<div class="w3-container w3-purple" style="width:500px;margin-left:500px;	border:5px solid #4b0082;
">

    <!-- Mention Directory where your images has been saved-->
 <h1 style="font-family:Comic Sans MS, cursive, sans-serif;font-size:25px;"> Caption:<%=rs.getString(3)%><!--username-->
</h1>
<h1 style="font-family:Comic Sans MS, cursive, sans-serif;font-size:25px">UsernameName:<%=rs.getString(1)%></h1>

</div>


<!--image-->
<div class="w3-container" style="width:50%">

      <div class="w3-display-container w3-hover-opacity" style="width:25%">
        <i class="fa fa-heart w3-display-topleft" style="color:red;padding-left:5px;padding-top:5px;margin-left:482px;
"></i>

 <img src="Example/image-folder/<%=rs.getString(5)%>" alt="Avatar" width="500px" height="500px" style="margin-left:482px;">
        

</div>
   </div><!--image-->

   <div class="w3-container" style="width:500px;margin-left:500px;	border-left:5px solid #4b0082;border-right:5px solid #4b0082;border-bottom:5px solid #4b0082;
">

          <h1 style="font-family:Comic Sans MS, cursive, sans-serif;font-size:25px"> Description:<%=rs.getString(4)%></h1>
</div>

<div class="w3-container w3-purple" style="width:500px;margin-left:500px;	border-left:5px solid #4b0082;border-right:5px solid #4b0082
">

		          <h1 style="font-family:Comic Sans MS, cursive, sans-serif;font-size:25px">  Cost:<%=rs.getString(2)%></h1>
   <%
st2=con.createStatement();
 rs2=st2.executeQuery("select email,phno from register where usn='"+rs.getString(1)+"'");
 if(rs2.next())
	{
%>
         <h1 style="font-family:Comic Sans MS, cursive, sans-serif;font-size:25px">	 Phone no:<%=rs2.getString(2)%>
</h1>
<h1 style="font-family:Comic Sans MS, cursive, sans-serif;font-size:25px">	 Email:<%=rs2.getString(1)%>
</h1>    
</div>
	<%}%>
	</div>
<%
	
}
}
catch(Exception e)
{
out.print(""+e.getMessage());
}
%>
 </body>
</html>