<script src='http://code.jquery.com/jquery-1.7.1.min.js'></script>
<script type="text/javascript">
              var secondIntent="";
              var firstIntent="";
              var firstTemplate="";
              var secondTemplate="";
              var thirdTemplate="";
              var fourthTemplate="";
              var strUser;
              var entityName;
              var str = "";
         
       window.onload=function()
       {
           	var el = document.getElementById('input-file')
            if (el)
            	{
            		el.addEventListener('change', getFile)
                 }

           		function getFile(event) {
                    const input = event.target
                  if ('files' in input && input.files.length > 0) {
                      placeFileContent(
                      document.getElementById('content-target'),
                      input.files[0])
                      
                  }
                }

                function placeFileContent(target, file) {
                    readFileContent(file).then(content => {
                    target.value = content
                  }).catch(error => console.log(error))
                }

                function readFileContent(file) {
                    const reader = new FileReader()
                  return new Promise((resolve, reject) => {
                    reader.onload = event => resolve(event.target.result)
                    reader.onerror = error => reject(error)
                    reader.readAsText(file)
                       
                  })
                }
            //document.getElementById('content-target').onkeyup = getString() 
           
         }
        
  
        var expanded = false;

        function showCheckboxes()
        	{
             	var checkboxes = document.getElementById("checkboxes");
              	if (!expanded)
              	{
                	checkboxes.style.display = "block";
                	expanded = true;
              	} else 
              	{
                	checkboxes.style.display = "none";
                	expanded = false;
              	}
           
            }
         function getDropDownOption()
         {  
             var e = document.getElementById("intentid");
             
              strUser = (e.options[e.selectedIndex].value).replace("\n","");
              alert("\""+strUser+"\"");
         }
        
         $(function () {
             $("#buttonid").bind("click", function () {
                 $("#intentid")[0].selectedIndex = 0;
             });
         });
         $(function () {
             $("#buttonid").bind("click", function () {
                 $("#entityid")[0].selectedIndex = 0;
             });
         });
         
         var tempArray="";
         
         function getEntity()
         {  
             var entityValue = document.getElementById("entityid");
             
              entityName = entityValue .options[entityValue.selectedIndex].value;
              //alert(entityName);
             
         }

         var descriptionValue;
         var subtempSlot;
         
         
         function getStory()
          {  //alert(entityName);
                var checkedValue = '';
                var app=document.getElementById("storylistid").value;  
             
                 var elmntval = document.getElementById("checkboxes");
                 var singleElement=elmntval.getElementsByTagName("input");
           
                 for(var i=0; i<singleElement.length; i++)
                 {
              	   if(singleElement[i].checked)
               		  {
                		     checkedValue +="  -"+singleElement[i].value;
                     		 //alert(checkedValue);
               		  }
                 }
                     		descriptionValue=document.getElementById("descriptionid").value;
                     
                		    //var temp= "* _"+strUser+"["+entityName+"="+descriptionValue+"]"+"\n - slot{\""+entityName+"\":\""+descriptionValue+"\"}"+checkedValue ;    
                		     //alert(checkedValue);  
                		    var slot=document.getElementById("slotlist").value;
                		    var tempSlot=new Array();
                		    tempSlot=slot.split(",");
                          //alert(slot);
                  			 // var str;
                   				var temp="";
                 
                		    for(var j=0;j<tempSlot.length;j++)
                		    {
                		    	 //alert(tempSlot[j]);
                   			 	 //str=tempSlot[j];
                   			 
                   			 	  if(str == "" || str == null)
                   			 	 {
                   			 	  str="   - slot{\""+tempSlot[j].replace("=","\":\"")+"\"}\n";
                   			 	  temp="* _"+strUser+"["+document.getElementById("slotlist").value+"]\n"+str+" "+checkedValue;
                   			 	  document.getElementById("storylistid").value= temp+"\n"+app;
                   			 		/* alert(str);
                   			 		temp=""; */
                   			 	    //var temp= "* _"+strUser+"["+document.getElementById("slotlist").value+"]\n"+str+" "+checkedValue ;
                   			 	 } 
                   			 	
                   			 	else if(document.getElementById("slotlist").value==null || document.getElementById("slotlist").value=="")
                   			 		{
                   			 			 str="";
                   			 			 temp="* _"+strUser+document.getElementById("slotlist").value+"\n"+str+" "+checkedValue;
                   			 		 document.getElementById("storylistid").value= temp+"\n"+app;
                   			 		}
                   			 	else{
                   			 	 		str="   - slot{\""+tempSlot[j].replace("=","\":\"")+"\"}\n"+str;
                   			
                   			 	 		//str=str+str;
                   			 	       temp= "* _"+strUser+"["+document.getElementById("slotlist").value+"]\n"+str+" "+checkedValue ;
                   			 	       document.getElementById("storylistid").value= temp+"\n"+app;
                   			 	   
                   				   }
                   			 
                   			 	 
                   		    }
                		    str="";
                        // alert(str);
                   	   		//temp= "* _"+strUser+"["+document.getElementById("slotlist").value+"]\n"+str+" "+checkedValue ;
                     	 	alert(temp);
                   			//document.getElementById("storylistid").value= temp+"\n"+app;
                   
          }
         
         
          	function getString()
             	{     
                	 	var string =document.getElementById("content-target").value;
       
                    	var substring = "intent:";
                    	var tempSubstring= "template:";
                    	var action="action:";
              
                   	 	var sub=string.indexOf(substring);
                    	var tempSub=string.indexOf(tempSubstring);
                    	var actionSub=string.indexOf(action);
              
                    	var firstFinalString=string.substring(sub,tempSub);
                   	 	var replaceFirstString=firstFinalString.replace("Intent:" , " ");
                   	 	var temp=new Array();
                   	 	
                    	temp=replaceFirstString.split("- ");
                    	firstIntent=temp[1];
                    	secondIntent=temp[2];
              
              
                    	var secondFinalString=string.substring(actionSub,);
                    	var replaceSecondString=secondFinalString.replace("action:\n" , " ");
                    	var tempArray = new Array();
                    	tempArray = replaceSecondString.split("-");
                    
                    
                    	var elmntval = document.getElementById("checkboxes");
                 
                     	for(var i = 1; i < tempArray.length;i++)
                     		{
                    	
                    	 		if(tempArray[i].includes("actions."))
                    	 		{
                    		
                    		 		tempArray[i] = tempArray[i].replace("actions.","actions_");
                    		 		elmntval.innerHTML += "<span><input type=\"checkbox\" id=\"checkboxid\" value=\""+tempArray[i]+"\"/>"+tempArray[i]+"</span>";
                    	 		}
                    	 		else
                    	 		{
                    		 
                        		 elmntval.innerHTML += "<span><input type=\"checkbox\" id=\"checkboxid\" value=\""+tempArray[i]+"\"/>"+tempArray[i]+"</span>";
                    			 }// j++;
                      		}
               
                    	var dropdownId=document.getElementById("intentid");
                 
                    	for(var j=1; j < temp.length; j++)
                        	{
                           		 dropdownId.innerHTML += "<option value = \""+temp[j]+"\">"+temp[j]+"</option>";
                        
                       		 }
                    
                    	var entityString="entities:";
                    	var entitySub=string.indexOf(entityString);
                    	var thirdFinalString=string.substring(entitySub,sub);
                    	var replaceThirdString=thirdFinalString.replace("entities:\n "," ");
                    	var entityArray = new Array();
                    	entityArray = replaceThirdString.split("- ");
                    
                    	var entitydropdownId=document.getElementById("entityid");
                    
                    	for(var k=1; k < entityArray.length; k++)
                    	{
                    		entitydropdownId.innerHTML += "<option value = \""+entityArray[k]+"\">"+entityArray[k]+"</option>";
                    
                   		 }
                   
             	}  
           
         	function getAllData()
         		{ 
           			 var app=document.getElementById("templatelistid").value;
           			document.getElementById("templatelistid").value="## "+document.getElementById("storyid").value+"\n"+document.getElementById("storylistid").value+app;
        
         		}
         	
         	
            function myFunction()
            {
                var x = document.getElementById("myFile");
                x.disabled = true;
            }
         
         
         	function displayFile()
         	{
             	//alert("hello"+document.getElementById("myFile").value);
            	 document.getElementById("filetextid").value=document.getElementById("myFile").value
           
        	 }
        
        	function download(name, type) 
        		{
            		var fileText=document.getElementById("templatelistid").value;
             		var a = document.getElementById("a");
             		var file = new Blob([fileText], {type: type});
            		a.href = URL.createObjectURL(file);
             		a.download = name;
         		}
        
       
            function eraseText() 
            {
                document.getElementById("storylistid").value = "";
                document.getElementById("storyid").value = "";
               
            }
         
            
            function eraseStoryList()
            {
            	 document.getElementById("templatelistid").value = "";
            }
          
            
            function eraseSlotList()
            {
            	document.getElementById("descriptionid").value = "";
            	document.getElementById("slotlist").value = "";
            }
      
	           	var checkboxes = $("input[type='checkbox']"),
	           	submitButt = $("input[type='button']");
	
		       	checkboxes.click(function() 
				  	{
		              	submitButt.attr("disabled", !checkboxes.is(":checked"));
		         	});
				  
		       
				  $(document).ready(function()
				  	{  
		
				      var checkField;
		
				      checkField = $("input#templatelistid").val().length;  
		
				      var enableDisableButton = function()
				      		{ 
				    	  
				        		if(checkField > 0)
				        		{
				          			$('#storynameid').removeAttr("disabled");
				       		 	} 
				       			 else
				       			 {
				          			$('#storynameid').attr("disabled","disabled");
				       			 }
				      		}        
		
				      
				      enableDisableButton();            
		
				      $('input#storyid').keyup(function(){ 
				        
				        checkField = $("input#storyid").val().length;
				      
				        enableDisableButton();
				      });
				    });
				  
				  
				  $('#checkboxes').click(function () {
					    //check if checkbox is checked
					    if ($(this).is(':checked')) {
					        
					        $('#sendNewSms').removeAttr('disabled'); //enable input
					        
					    } else {
					        $('#sendNewSms').attr('disabled', true); //disable input
					    }
					});
				  
				  function disable()
				  	{
					  document.getElementById('storynameid').setAttribute("disabled", "disabled"); 
					}
				  
				  
				   function getSlots()
				  {		//alert("hii");
					  var slotValue=document.getElementById("slotlist").value;
					  //alert(slotValue);
					  if(slotValue.trim() == null || slotValue.trim() == "")
					  {
					  	document.getElementById("slotlist").value=entityName.trim()+"="+(document.getElementById("descriptionid").value).trim();
					  }else
					  {
						  document.getElementById("slotlist").value=entityName.trim()+"="+(document.getElementById("descriptionid").value).trim()+","+slotValue;
					  }
				  } 
				   
				   
				   function chk_control(str)
				   		{
					   		if(str=='dsb')
					   		{
					   			document.getElementById('checkboxid').disabled=true;
					   			}
					   		else {
					   			document.getElementById('checkboxid').disabled=false;
					   			}
					   }
				  
    </script>

<%
	String name = (String) session.getAttribute("username");

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
			<form id="form" method="get" action="">
				<table id="table">

					<tr>
						<td rowspan="5"><div>
								<span style="color: maroon;"><b><label
										for="input-file">SPECIFY A FILE:</label></b></span><br> <input
									type="file" id="input-file">
							</div> <textarea id="content-target" rows="25" cols="30"></textarea></td>
					</tr>
					<tr>
						<td><span style="color: maroon;"><b><label
									title="StoryName">STORY NAME:</label></b></td>

						<td><input type="text" id="storyid"
							placeholder="Enter Story name.." /></span></td>

						<td><br> <input type="button" class="button4"
							value="Add Intent and Action" id="storynameid"
							onclick="getString();disable();" /></td>
					</tr>
					<tr>
						<td><span style="color: maroon;"><b><label
									title="intenttitle">INTENTS:</label></b></span> <select id="intentid"
							onchange="getDropDownOption()">
								<option value="Text">Select Intent</option></td>
						</select>
						</td>
						<td></td>

						<td>
							<div class="multiselect">
								<div class="selectBox" onclick="showCheckboxes()">
									<span style="color: maroon;"><b><label
											title="intenttitle">ACTIONS:</label></b></span> <select>
										<option>Select Actions</option>
									</select>
									<div class="overSelect"></div>
								</div>
								<div id="checkboxes"></div>
						</td>

						<!-- <td rowspan="2"><span style="color: maroon;"><center>
									<b><label title="StoryList">INTENT AND ACTION</label></b>
								</center> <textarea rows="8" cols="25" id="storylistid"></textarea></span></td> 
						 -->

					</tr>


					<tr>

						<td><span style="color: maroon;"><b><label
									title="intenttitle">ENTITY:</label></b></span> <select id="entityid"
							onchange="getEntity()">
								<option value="Text">Select entity</option>
						</select></td>

						<td></td>
						<td><span style="color: maroon;"><b><label
									title="IntentsName">ENTER DESCRIPTION:</label></b> <input
								type="text" id="descriptionid" placeholder="Enter description.." /></span></td>

						<td><input type="button" class="button4" value="Add to slots"
							id="slotbuttonid" onclick="getSlots();" /></td>


						<!-- <td rowspan="1"><span style="color: maroon;"><center>
									<b><label title="StoryList">INTENT AND ACTION</label></b>
								</center> <textarea rows="8" cols="30" id="storylistid"></textarea></span></td> 	 -->
					</tr>

					<tr>
						<!-- 
						<td>
							<div class="multiselect">
								<div class="selectBox" onclick="showCheckboxes()">
									<span style="color: maroon;"><b><label
											title="intenttitle">ACTIONS:</label></b></span>
						
						<select>
								<option>Select Actions</option>
						</select>
							<div class="overSelect"></div>
							</div>
							<div id="checkboxes"></div></td> -->
						<td><span style="color: maroon;"><b><label
									title="TemplateList">SLOT LIST:</label></b></span>
							</center> <textarea rows="8" cols="15" id="slotlist" name="slotlistid"></textarea></td>
						<!--  <td></td>  -->
						<td>&nbsp;&nbsp;&nbsp;<input type="button" class="button2"
							value="Add to Intent and Action"
							onclick="getStory();eraseSlotList();" id="buttonid" /></td>

						<td rowspan="1"><span style="color: maroon;"><center>
									<b><label title="StoryList">INTENT AND ACTION</label></b>
								</center> <textarea rows="8" cols="35" id="storylistid"></textarea></span></td>
						</div>


					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>&nbsp;&nbsp;<input type="button" class="button1"
							value="Add to Story List" onclick="getAllData(); eraseText();" /></td>


						<td colspan="2"><center>
								<span style="color: maroon;"><b><label
										title="TemplateList">STORY LIST:</label></b></span>
							</center> <textarea rows="8" cols="35" id="templatelistid"
								name="templatelistid"></textarea></td>
						<!--<td><input type="button" value="add intent" onclick="getString()" /></td>-->
						<!--   <td><textarea rows="4" cols="40" id="valueid"></textarea></td>-->
					</tr>

					<tr>
						<center>
							<td><input type="button" class="button3"
								value="Create .md File"
								onclick="download('stories.md', 'text/plain');eraseStoryList(); ">
								<a href="" id="a">Click here to download...</a></td>
						</center>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</div>
<%
	}
%>