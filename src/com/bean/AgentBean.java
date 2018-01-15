package com.bean;

public class AgentBean {
	
	    private String agentname;

	    public String getAgentname() {
			return agentname;
		}


		public void setAgentname(String agentname) {
			this.agentname = agentname;
		}


		public String validate()
	    {
			//System.out.println("AgentName :"+agentname);
	    	
			return "CreateDomain.jsp";
	    	/*if(agentName == null){
	    		return "CreateAgent.jsp";
	    	}else{
	    		return "CreateDomain.jsp";
	    	}*/
	       
	    }
	    
	}

