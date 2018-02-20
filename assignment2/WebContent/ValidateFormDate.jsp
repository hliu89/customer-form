<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
 	table {  
  text-align:center; 
  border-collapse: collapse; 
  font: 15px Georgia, "Times New Roman", Times, serif; 
} 
tr:nth-of-type(odd) {  
  background: #eee;  
} 
th {  
  background: #333;  
  color: white;  
  font-weight: bold;  
} 
td, th {  
  padding: 6px;  
  border: 1px solid #ccc;  
  text-align: left;  
}
.sub {
   background:white;
   border:0px;
}
.worryinfo{
	  color: red;
	}
</style>
<title>Insert title here</title>
</head>
<body>
  <%
 String customername= (String)session.getAttribute("customername");
 String ssn=(String)session.getAttribute("ssn");
 String zipcode=(String)session.getAttribute("zipcode");
 String emailmessage=(String)session.getAttribute("emailmessage");
 String zipcodemessage=(String)session.getAttribute("zipcodemessage");
 String streetaddress=(String)session.getAttribute("streetaddress");
 String address=(String)session.getAttribute("address");
 String city=(String)session.getAttribute("city");
 String state=(String)session.getAttribute("state");
  %>
  <div id="title"><h2>Please validate your information</h2></div>
  <div id="table">
  <table width="400" height="60" cellpadding="0" cellspacing="0" border="0">
          
               <tr>
                 <td>Customer Name:</td> <td><%=customername %></td>
               </tr>
               <tr>
                 <td>Customer Social Security Number:</td><td><%=ssn%></td>
               </tr>
               <%
                if(zipcodemessage==null){
               %>
               <tr>
                 <td>Zip Code:</td><td><%=zipcode %></td>
               </tr> 
                <%
                }
               %>
               <%
                if(zipcodemessage!=null){
               %>
               <tr class="worryinfo">
                 <td>zipcode worry message:</td><td><%=zipcodemessage %></td>
               </tr> 
               <%
                }
               %>
                <%
                if(emailmessage==null){
               %>
                <tr>
                 <td>Customer Email Address:</td><td><%=address %></td>
               </tr> 
               <%
                }
               %>
                 <%
                if(emailmessage!=null&&emailmessage!=""){
               %>
               <tr class="worryinfo">
                 <td >email worry message</td><td><%=emailmessage %></td>
               </tr> 
               <%
                }
               %>
                <tr>
                 <td>Street Address:</td><td><%=streetaddress %></td>
               </tr> 
               <tr>
                 <td>City:</td><td><%=city %></td>
               </tr>
               <tr>
                 <td>state:</td><td><%=state %></td>
               </tr>
               <tr class="sub">
                <td class="sub">
         <% 
          if((	emailmessage==""||emailmessage==null)&&zipcodemessage==null){
          %>
				<a href="ProcessCustomerDataRequest.jsp"><button id="submit">Submit</button></a>
				
		<%
		    }else{ 
		%>
				<a href="GetFormData.jsp"><button id="return">Refill the form</button></a>
		<%
		    }
		%>
		</td>
               </tr>
       </table>  
       </div>
       
</body>
</html>