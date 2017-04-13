 <%
 String cost=request.getParameter("cost");
session.setAttribute("cost",cost);
String caption=request.getParameter("caption");
session.setAttribute("caption",caption);
String description=request.getParameter("descp");
session.setAttribute("descrp",description);
response.sendRedirect("uploadform.jsp");
 %>