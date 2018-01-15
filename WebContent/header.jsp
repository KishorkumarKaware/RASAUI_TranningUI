<%String name=(String)session.getAttribute("username");%>

<div id="header">
<img src="images/AutomationEdge.png"/>

</div>

	<div id="navigation">
		<ul>
                    
			<li><a href="index.jsp">Home</a></li>
						<%
                        if(name!=null)
                        {%>
                        <li> <a href="CreateAgent.jsp">Create Agent</a></li>
                        <%}%>
			<li><a href="about.jsp">About</a></li>
			<li><a href="contact.jsp">Contact</a></li>
                        <%
                        if(name!=null)
                        {%>
                        <li> <a href="logout.jsp">Logout</a></li>
                        <%}%>
		</ul>
    
        
            	</div>
