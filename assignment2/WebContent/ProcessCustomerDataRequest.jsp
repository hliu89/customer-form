<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
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
</style>
<title>Insert title here</title>
</head>
<body>
<%
String lng=(String)session.getAttribute("lng");
String lat=(String)session.getAttribute("lat");
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
  <div id="title"><h2><%=customername %>You have successful submit your message! </h2></div>
  <div><h2>Thank you!</h2></div>
<div id="table">
  <table width="400" height="60" cellpadding="0" cellspacing="0" border="0">
               <tr>
                 <td>Customer Name:</td> <td><%=customername %></td>
               </tr>
               <tr>
                 <td>Customer Social Security Number:</td><td><%=ssn%></td>
               </tr>
               <tr>
                 <td>Zip Code:</td><td><%=zipcode %></td>
               </tr> 
                <tr>
                 <td>Customer Email Address:</td><td><%=address %></td>
               </tr>  
                <tr>
                 <td>Street Address:</td><td><%=streetaddress %></td>
               </tr> 
               <tr>
                 <td>latitude</td><td><%=lat %></td>
               </tr>
               <tr>
                 <td>longitude</td><td><%=lng %></td>
               </tr>
               <tr>
                 <td>City:</td><td><%=city %></td>
               </tr>
               <tr>
                 <td>state:</td><td><%=state %></td>
               </tr>
       </table>
       </div>  
</body>
</html>