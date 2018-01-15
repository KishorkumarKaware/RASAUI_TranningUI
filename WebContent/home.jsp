<%String name=(String)session.getAttribute("username");

if(name==null)
{
    response.sendRedirect("index.jsp");
}

else
{

%>
<div id="container">
<link href="css/css.css" rel="stylesheet" type="text/css">
<jsp:include page="home-header.jsp"></jsp:include>

<div id="content-container">
<div id="content"><center>
<marquee><h2 style="color: red;"><i>- Welcome <%=name%> -</i></h2></marquee><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img alt="home"  src="images/Robot.jpg" width="550" height="400px"/></center>
</div>

<div id="aside">
<p>
</p>
</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</div>
<%}%>