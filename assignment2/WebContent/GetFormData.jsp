<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
 	#register{
   	 width:500px;
   	 height:330px;
   	 background: #EEE;
   	}
   	.inputWrap { 
    background: -webkit-gradient(linear, left top, left 24, from(#FFFFFF), color-stop(4%, #EEEEEE), to(#FFFFFF)); 
    background: -moz-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 24px); 
    background: -o-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 24px); 
    font: 20px Georgia, "Times New Roman", Times, serif;
    border-radius:3px; 
    border:1px solid #CCC; 
    margin:10px 10px 0; 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#EEEEEE', endColorstr='#FFFFFF'); 
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#EEEEEE', endColorstr='#FFFFFF')"; 
} 
   #table{
   margin-left:auto;
    margin-right:auto;
    text-align:left;
     
   }
   #sign{
    margin-top:10px;
   }
</style>
<script type="text/javascript">
function check(form) {

    if(form.customername.value=='') {
          alert("please input customername!");
          form.customername.focus();
          return false;
     }
 if(form.ssn.value==''){
          alert("please input ssn!");
          form.ssn.focus();
          return false;
   }
 if(form.zipcode.value==''){
     alert("please input zipcode!");
     form.zipcode.focus();
     return false;
} 
 if(form.address.value==''){
     alert("please input Email address!");
     form.address.focus();
     return false;
}
 if(form.streetaddress.value==''){
     alert("please input streetaddress!");
     form.streetaddress.focus();
     return false;
}
 if(form.city.value==''){
     alert("please input city!");
     form.city.focus();
     return false;
}
 var s=form.customername.value;
 var reg = /^[a-zA-Z0-9]{4,50}$/;
 if(!reg.test(s)){
	 alert("please input customername in 4-50 charaters!");
     form.customername.focus();
     return false;
 }
 var s2=form.streetaddress.value;
 var news2=s2.replace(/\s/g, "") ;
 var reg = /^[a-zA-Z0-9]{4,50}$/;
 if(!reg.test(news2)){
	 alert("please input Street address in 4-50 charaters!");
     form.streetaddress.focus();
     return false;
 }
 var s3=form.city.value;
 var reg = /^[a-zA-Z0-9]{3,50}$/;
 if(!reg.test(s3)){
	 alert("please input city name in 3-50 charaters!");
     form.city.focus();
     return false;
 }
 var ss=form.ssn.value;
 var reg2 =/^\d{3}\-\d{2}\-\d{4}$/;
 if(!reg2.test(ss)){
	 alert("Please input your ssn in this style(xxx-xx-xxxx)!");
     form.ssn.focus();
     return false;
 }
   return true;
   }
</script>
</head>
<body>
<div id="title"><h1>Please input your information</h1></div>
<div id="register">
  <form action="servlets/servlet" method="post" onsubmit="return check(this)">
    <table id="table">
        <tr>
            <td><label for="txtname">Custoemr Name</label></td>
            <td><div class="inputWrap"><input type="text" id="customername" name="customername" /></div></td>
        </tr>
        <tr>
            <td><label for="txtpswd">Customer Social Security Number</label></td>
            <td><div class="inputWrap"><input type="text" id="ssn" name="ssn" /></div></td>
        </tr>
        <tr>
            <td><label for="txtaddress">Zip Code</label></td>
            <td><div class="inputWrap"><input type="text" id="zipcode" name="zipcode" /></div></td>
        </tr>
        <tr>
            <td><label for="txtemail">Customer Email Address</label></td>
            <td><div class="inputWrap"><input type="text" id="address" name="address" /></div></td>
        </tr>
       <tr>
            <td><label for="txtstreet">Street Address</label></td>
            <td><div class="inputWrap"><input type="text" id="streetaddress" name="streetaddress" /></div></td>
        </tr>
        <tr>
            <td><label for="txtcity">City</label></td>
            <td><div class="inputWrap"><input type="text" id="city" name="city" /></div></td>
        </tr>
        <tr>
           <td><label for="txtstate">State</label>
           <select name="state" id="state">  
           <option>---State---</option>  
           <option value="AR">AR</option>  
           <option value="AZ">AZ</option>  
           <option value="CA">CA</option> 
           <option value="FL">FL</option>
           <option value="LA">LA</option>
           <option value="NM">NM</option>
           <option value="NV">NV</option>
           <option value="OK">OK</option>
           <option value="OR">OR</option>
           <option value="IL">IL</option>               
           </select></td>
           
        </tr>
        <tr>
            <td colspan=2>
                <div id="sign"><input type="reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="Register"/></div>
            </td>
        </tr>
    </table>
</form>
</div>
</body>
</html>