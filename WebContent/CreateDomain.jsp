
<script type="text/javascript">

var strUser;
	function myFunction() {
		var app = document.getElementById("intentlist").value;
		document.getElementById("intentlist").value = " -" + " "
				+ document.getElementById("intents").value + "\n" + app;
	}
	function templateFunction() {
		/*document.getElementById("intentlist").value =document.getElementById("Templatetype").value;*/
		if (document.getElementById("Templatetype").value == "Text") {
			document.getElementById("templateinput").innerHTML = " Text: <input type='text' value='' id='textid' /><br />";
		} else if (document.getElementById("Templatetype").value == "Image") {
			document.getElementById("templateinput").innerHTML = "Text: <input type='text' value='' id='imagetextid'/><br />";
			document.getElementById("templateinput").innerHTML += "URL/Path: <input type='text' value='' id='urlid'/><br />";
		} else if (document.getElementById("Templatetype").value == "Button") {
			document.getElementById("templateinput").innerHTML = " Text: <input type='text' value='' id='buttontextid' /><br />";
			document.getElementById("templateinput").innerHTML += "  Title:  <input type='text' value='' id='titleid' /><br />";
			document.getElementById("templateinput").innerHTML += "Payload: <input type='text' value='' id='payloadid' /><br />";
		}
	}

	function addTemplateList() {
		if (document.getElementById("Templatetype").value == "Text") {

			var t = document.getElementById("templatelistid").value;
			var temp = t + " " +"utter_"+document.getElementById("templates").value
					+ ":" + "\n " + "- " + "text" + ": \""
					+ document.getElementById("textid").value + "\"";
			//  document.getElementById("templatelistid").append("");
			document.getElementById("templatelistid").value = temp + "\n";

			var action = document.getElementById("actionid").value;

			document.getElementById("actionid").value = " - utter_"+document.getElementById("templates").value + "\n"
					+ action;

		}

		else if (document.getElementById("Templatetype").value == "Image") {
			var t = document.getElementById("templatelistid").value;
			var temp = t + " " +"utter_"+ document.getElementById("templates").value
					+ ":" + "\n " + "- " + "text" + ": \""
					+ document.getElementById("imagetextid").value + "\""
					+ "\n   image" + ": " + "\""
					+ document.getElementById("urlid").value + "\"";

			document.getElementById("templatelistid").value = temp + "\n";

			var action = document.getElementById("actionid").value;
			document.getElementById("actionid").value = " - utter_"+ document.getElementById("templates").value + "\n"
					+ action;
		}

		else if (document.getElementById("Templatetype").value == "Button") {
			var t = document.getElementById("templatelistid").value;
			var temp = t + " " +"utter_"+document.getElementById("templates").value
					+ ":\n - text: \""
					+ document.getElementById("buttontextid").value + "\""
					+ "\n   buttons:\n" + " " + " " + " -" + " " + "title"
					+ ":" + " \"" + document.getElementById("titleid").value
					+ "\"\n     payload" + ": \""
					+ document.getElementById("payloadid").value + "\"";

			document.getElementById("templatelistid").value = temp + "\n";

			var action = document.getElementById("actionid").value;
			document.getElementById("actionid").value = " - utter_"+ document.getElementById("templates").value + "\n"
					+ action;
		}

	}
	function download(name, type) {
		var fileText = "slots:\n"+document.getElementById("slotsid").value+"\nentities:\n"+document.getElementById("entityid").value+"\nintent:\n"+ document.getElementById("intentlist").value + "\ntemplate:\n"
				+ document.getElementById("templatelistid").value + "\naction:\n"
				+ document.getElementById("actionid").value;
		var a = document.getElementById("a");
		var file = new Blob([ fileText ], {
			type : type
		});
		a.href = URL.createObjectURL(file);
		a.download = name;
	}
	
	function getDropDownValue()
    {  
        var e = document.getElementById("entityType");
        
        entityTypeValue = e.options[e.selectedIndex].value;
        alert("hello:"+entityTypeValue);
        //document.getElementById("templatelistid").value=strUser;
        
        
        if (document.getElementById("entityType").value == "float") 
        {
			document.getElementById("entityinput").innerHTML = " Min Value: <input type='text' value='' id='minid' /><br />";
			document.getElementById("entityinput").innerHTML += "Max Value: <input type='text' value='' id='maxid'/><br />";
			
        }
         
        else if(document.getElementById("entityType").value == "categorical")
        {
        	document.getElementById("entityinput").innerHTML = " Values: <input type='text' value='' id='catTextid' placeholder='Enter value name..''  /><br />";
        	document.getElementById("buttoninput").innerHTML = " <input type='button' value='Add Value' id='catButtonid' onclick='getValues()' /><br />";
        
        	document.getElementById("textareainput").innerHTML = " <textarea rows='4' cols='7' id='catTextareaid' />";
        	
            
           	//document.getElementById("catTextareaid").value=document.getElementById("catTextid").value;
            
        }
        
        
        else
        	{
        	document.getElementById("entityinput").innerHTML = "<div></div>";
        	document.getElementById("buttoninput").innerHTML = "<div></div>";
        	document.getElementById("textareainput").innerHTML ="<div></div>";
        	}
        
		 
    }
	function getValues()
    {	var temp=document.getElementById("catTextareaid").value;
    	document.getElementById("catTextareaid").value="    - "+document.getElementById("catTextid").value+"\n"+temp;
    }
	function entitySelectFunction() {
		
		var entityValue = document.getElementById("entity").value;
		
		var minValue=  "";
		var maxValue= "";
		var catValue="";
		var slotsValue="";
		if(document.getElementById("entityType").value == "float")
			{
			minValue=  document.getElementById("minid").value;
			maxValue= document.getElementById("maxid").value;
			slotsValue="  "+entityValue+":\n    type: "+entityTypeValue+"\n    min_value:"+minValue+"\n    max_value:"+maxValue;
			 
			}
		else if(entityTypeValue == "text" || entityTypeValue == "bool" || entityTypeValue == "list" || entityTypeValue == "unfeaturized" || entityTypeValue == "data" ){
			
			slotsValue="  "+entityValue+":\n    type: "+entityTypeValue;
		}
		else if(entityTypeValue == "categorical")
			{
			
			 catValue=document.getElementById("catTextareaid").value;
			slotsValue="  "+entityValue+":\n    type: "+entityTypeValue+"\n    values:\n"+catValue;
			}
		
		//var slotsValue=entityValue+":\n   type: "+entityTypeValue+"\n   min_value:"+minValue+"\n   max_value:"+maxValue;
		
		var app = document.getElementById("slotsid").value;
        document.getElementById("slotsid").value=slotsValue+"\n"+app; 
        
        var action = document.getElementById("entityid").value;
		document.getElementById("entityid").value = " - "+document.getElementById("entity").value +"\n"
				+action;
		
	}
	function addCustomAction()
	{  alert("hello");
		var custom = document.getElementById("actionid").value;
		document.getElementById("actionid").value=" - actions."+document.getElementById("customaction").value+"\n"+custom;
	}

	
	/*function WriteToFile()          
	{                 
	  var fso  = new ActiveXObject("Scripting.FileSystemObject"); 
	  var fh = fso.CreateTextFile("c:\\Domain.yml", true); 
	  var fileText="Intent:\n "+document.getElementById("intentlist").value+"template:\n  "+document.getElementById("templatelistid").value+"action:\n    "+document.getElementById("actionid").value;
	  fh.WriteLine(fileText); 
	  fh.Close();        
	}  */
</script>

<%
	String name = (String) session.getAttribute("username");
	String agentname = (String) session.getAttribute("agentname");
	if (name == null) {
		response.sendRedirect("index.jsp");
	}

	else {
%>
<div id="container">
	<link href="css/css.css" rel="stylesheet" type="text/css">
	<jsp:include page="Agent-home-header.jsp"></jsp:include>

	<div id="content-container">
		<div id="content">
			<center>
				<form id="form" method="get"
					onclick="download('domain.yml','text/plain')">
					<%
						if (agentname == null) {
					%>
					<h2><input type="text" id="agentName" placeholder="Enter Agent Name"
						height="30" width="150" /></h2>
					<%
						} else {
					%>
					</h2><input type="text" id="agentName" name="agentName"
						value=<%=agentname%> /></h2>
					<%
						}
					%>
					
					<table>
					<tr>
							<td><center>
									<span style="color: maroon;"><b><label
											title="Intents">SLOTS</label></b></span>
								</center></td>
								<td></td><td></td><td></td>
								<td><center>
									<span style="color: maroon;"><b><label
											title="Intents">DOMAIN FILE</label></b></span>
								</center></td>
						</tr>
						
					
							
					  <tr>
						
							<td><span style="color: maroon;"><label
									title="IntentsName"> Entity Name:</label></td>
							<td><input type="text" id="entity" placeholder="Enter entity name.."  /></span></td>
							<td>&nbsp;&nbsp;&nbsp;<input type="button"
								value="Add Slots" onclick="entitySelectFunction()" /></td>
							<td><span style="color: maroon; width:"> <b><label
										title="IntentsList">&nbsp;&nbsp;&nbsp;SLOTS:&nbsp;&nbsp;&nbsp;</label></b>
							</span></td>
							<td><textarea rows="4" cols="40" id="slotsid"></textarea></span></td>
						</tr>
						
						<tr>
							<td>
									<select
								id="entityType" onchange="getDropDownValue()">
								    <option value="entity">Select Entity type</option>
									<option value="text">Text</option>
									<option value="bool">Bool</option>
									<option value="categorical">Categorical</option>
									<option value="float">Float</option>
									<option value="list">List</option>
									<option value="unfeaturized">Unfeaturized</option>
									<option value="data">Data</option>
							</select>
							</td>
							
							 <td id="entityinput"></td> 
						
							 <td id="buttoninput"></td>
								
								
									<td><span style="color: maroon; width:"> <b><label
										title="IntentsList">&nbsp;&nbsp;&nbsp;ENTITIES:&nbsp;&nbsp;&nbsp;</label></b>
							</span></td>
							<td><textarea rows="4" cols="40" id="entityid"></textarea></span></td>
							<!-- <td>&nbsp;&nbsp;&nbsp;<input type="button"
								value="Add Template" onclick="addTemplateList()" /></td>
 -->
						</tr>
						<tr><td></td><td id="textareainput"></td></tr>
						
						<tr>
							<td><center>
									<span style="color: maroon;"><b><label
											title="Intents">INTENTS</label></b></span>
								</center></td>
								<td></td><td></td><td></td>
								<!-- <td><input type="button"
								value="Agent name" onclick="alertName()" /></td> -->
						</tr>
						<tr>
							<td><span style="color: maroon;"><label
									title="IntentsName"> Intent Name:</label></td>
							<td><input type="text" id="intents" placeholder="Enter intent name.."  /></span></td>
							<td>&nbsp;&nbsp;&nbsp;<input type="button"
								value="Add Intents" onclick="myFunction()" /></td>
							<td><span style="color: maroon; width:"> <b><label
										title="IntentsList">&nbsp;&nbsp;&nbsp;INTENTS:&nbsp;&nbsp;&nbsp;</label></b>
							</span></td>
							<td><textarea rows="4" cols="40" id="intentlist"></textarea></span></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td style="border: '1'"><center>
									<span style="color: maroon;"><b><label
											title="templates">TEMPLATES</label></b></span>
								</center></td>
						</tr>
						<tr></tr>
						<tr>
							<td><span style="color: maroon;"><label
									title="TemplateName">Template Name:</label></span></td>
							<td><input type="text" id="templates" placeholder="Enter template name.." /></td>
							<td></td>
							<td><span style="color: maroon;"><b><label
										title="TemplateList">&nbsp;&nbsp;&nbsp;TEMPLATES:&nbsp;&nbsp;&nbsp;</label></b></span></td>
							<td rowspan="2"><textarea rows="6" cols="40"
									id="templatelistid" name="templatelistid"></textarea></td>
						</tr>
						<tr>
							<td><!-- <span style="color: maroon;"><label
									title="templatesTypetitle">Template Type:</label></span>  -->
									<select
								id="Templatetype" onchange="templateFunction()">
								    <option value="Text">Select Template type</option>
									<option value="Text">Text</option>
									<option value="Image">Image</option>
									<option value="Button">Button</option>
							</select></td>
							<td id="templateinput"><span><input type="text"
									id="textid" /></span></td>
							<td>&nbsp;&nbsp;&nbsp;<input type="button"
								value="Add Template" onclick="addTemplateList()" /></td>

						</tr>
						<tr></tr><tr></tr>
						<tr>
						<td><span style="color: maroon;"><label
									title="CutomActionName">Custom Action:</label></span></td>
						<td><input type="text" id="customaction" placeholder="Enter custom action name.." /></td>
					   <td>&nbsp;&nbsp;&nbsp;<input type="button"
								value="Add custom action" onclick="addCustomAction()" /></td>
					
						<td><span> <span style="color: maroon;"><b><label
										title="Intents">&nbsp;&nbsp;&nbsp;ACTIONS:&nbsp;&nbsp;&nbsp;</label></b></span>
						</span></td>
						<td><textarea rows="6" cols="40" id="actionid"></textarea></td>
						</tr>
						<tr>
							<center>
								<td><input type="button" value="Create .yml File"
									onclick="WriteToFile()    "></td>
								<td><a href="" id="a">download your yml file</a></td>
							</center>
						</tr>
					</table>
				</form>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</div>
<%}%>