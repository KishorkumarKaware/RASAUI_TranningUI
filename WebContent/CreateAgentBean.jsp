<%@page import="java.sql.*" %>
<jsp:useBean id="a1" class="com.bean.AgentBean" scope="session"/>
    <jsp:setProperty property="*" name="a1"></jsp:setProperty>

    <% String s=a1.validate();
      			session.setAttribute("transfer_status","null");
      			session.setAttribute("withdraw_status","null");
      			session.setAttribute("delete_status","null");
      			session.setAttribute("register_status","null");
       			session.setAttribute("deposit_status","null");     	
      			
       			
                if(s.equals("CreateDomain.jsp"))
                {
                   //session.setAttribute("agentname",a1.getAgentname());
                    session.setAttribute("agentname","Agent");
               
                    response.sendRedirect("CreateDomain.jsp");
                }

                if(s.equals("error.jsp"))
                    response.sendRedirect("error.jsp");
                if(s.equals("home.jsp"))
                    response.sendRedirect("home.jsp");
    %>




