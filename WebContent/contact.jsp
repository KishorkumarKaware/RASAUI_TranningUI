<%@page import="java.sql.*" %>
<%String name=(String)session.getAttribute("username");
    String s=(String)session.getAttribute("contact_status");
    %>

<div id="container">
   
<link href="css/css.css" rel="stylesheet" type="text/css"/>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
    
    function check()
    {
    if(document.f1.subject.value=="")
    {
        alert("plz enter subject!");
        return false;
    }
    
    if(document.f1.message.value=="")
    {
        alert("plz enter message!");
        return false;
    }
    }
</script>


<div id="content-container">
<div id="content">
<marquee><h2 style="color: red;"><i>
            <%
            if(name==null)
            {%>
                - Welcome Guest -
            <%}
            else
            {%>
            	- Welcome <%=name%> -
            <%}%>
            	
            
            </i></h2></marquee><br/><br/>

<center>

<%if(s.equals("true")) 
{%>
<h2 style="color: red;">Message Sent!!</h2><br/>
<%session.setAttribute("contact_status","no_status");
}%>

<h2>Contact us by the form given below</h2><br/><br/>

<form action="contactBean.jsp" onsubmit="return check();" name="f1">
<b>Subject: &nbsp;&nbsp;&nbsp;</b><input type="text" name="subject"/><br/><br/>
<b>Message: </b><textarea rows="8" cols="16" name="message"></textarea><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="Clear">

</form>
</center>

</div>

<div id="aside">
        <p></p>
</div>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</div>
