<%String name=(String)session.getAttribute("username");%>
<div id="header">
<img src="images/AutomationEdgeHome.png"/>
<div id="navigation">
    <ul>
						<%
                        if(name!=null)
                        {%>
                        <li> <a href="home.jsp">Home</a></li>
                        <li> <a href="CreateDomain.jsp">Create Domain</a></li>
                        <li> <a href="CreateStory.jsp">Create Story</a></li>
                        <%}%>
    <li><a href="about.jsp">AboutUs</a></li>
    <li><a href="contact.jsp">Contact Us</a></li>
    <%
    if(name!=null)
    {%>
        <li> <a href="logout.jsp">Logout</a></li>
    <%}%>
    </ul>
</div>