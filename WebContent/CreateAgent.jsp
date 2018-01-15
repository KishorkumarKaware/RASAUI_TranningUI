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
<jsp:include page="Agent-home-header.jsp"></jsp:include>

<div id="content-container">
<div id="content">
       <form action="CreateAgentBean.jsp" onsubmit="return check();">
       <td><input type= "text" id="agentname" placeholder="Enter Agent Name" height="20" width="50" /></td>
      <br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Create Agent"/>
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Clear"/>
       
       
       </form>
</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</div>
<%}%>