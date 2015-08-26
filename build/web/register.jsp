<%-- 
    Document   : login
    Created on : 13 Sep, 2014, 11:16:45 AM
    Author     : Typhoon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <style type="text/css">
        body{
            margin: 6px;
        }
        
        #container{
            width: 100%;
            height: 100%;
        }
                
        #banner{
            top: 0px;
            width: 100%;
            height: 10%;
            background-color: green;
            color: white;
        }
        
        #menu{
            width: 100%;
            height: 6%;
            margin-top: 4px;
            background-color: blue;
            margin-bottom: 3px;
            margin-top: 3px;
        }
        
        #pbody{
            width: 100%;
            height: 80%;
            background-color: aqua;
        }
        
        #leftpart{
            width:30%;
            height: 40%;
            float: left;
            margin-left: 30%;
            margin-top: 10%;
            padding-top: 30px;
            padding-bottom: 10px;
            background-color: darkgrey;
            
        }
        
        
        .sub{
                width: 100px;
                height: 40px;
        }
        .sub img{
                width: 100%;
                height: auto;
        }
    </style>
    </head>
    
    <script type="text/javascript">
       
       function check()
       {
        var uname = document.fna.uname.value;
        var pass = document.fna.pass.value;
        var cpass = document.fna.cpass.value;
        
        
        if(uname==="" || pass==="")
        {
            alert('Blank username or password');
            return false;
        }
        else if( pass!==cpass)
        {
            alert('Please confirm the password');
            return false;
        }
        else
            return true;
      }
      
      function ckmail(inp)
      {
        var a=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

	if(inp.value==="" || !inp.value.match(a))
        {
        alert(" email Invalid ");
        inp.value = "";
        inp.focus();
        return false;
        }
        else
	return true;
      }
      
    
      function phchk(inp)
      {
          var x = /^\d{10}$/;
          if(inp.value.match(x))
          {
              return true;
          }
          else
          {
              alert('Phone number is invalid');
              inp.value = "";
              document.fna.ph.focus();
              return false;
          }
      }
      
      
    </script>
    <body>
      <div id="container">  
        <div id="banner">
            <font size="22">Welcome to TravelOholic.com</font>
        </div>
        
        <div id="menu">
            
        </div>
        
        <div id="pbody">
           
        <div id="leftpart">
         <center>
        <form name="fna" action="register" onsubmit="return check()">
            <table cellpadding=2>
            <tr>
            <td>Username</td>  <td><input type="text" name="uname" value="" /></td>
            </tr>
            
            <tr>
            <td>Password</td>  <td><input type="password" name="pass" value="" /></td>
            </tr>
            
            <tr>
            <td>Full Name</td>  <td><input type="text" name="name" value="" /></td>
            </tr>
            
            <tr>
            <td>Confirm Password</td>  <td><input type="text" name="cpass" value="" /></td>
            </tr>
            
            <tr>
            <td>Email</td>  <td><input type="text" name="mail" value="" onBlur="return ckmail(mail)" /></td>
            </tr>
            
            <tr>
                <td> Phone </td>  <td><input type="text" name="ph" value="" onBlur="return phchk(ph)" /></td>
            </tr>
            
            <tr>
            <td> Address </td>  <td><input type="text" name="add" value="" /></td>
            </tr>
            
            </table>
            <br/>
            <input type="image" class="sub" src="register.png" alt="Submit" />
        </form><br/>
            <%
                if(request.getParameter("action")!=null && request.getParameter("action").toString().equals("success"))
                    out.print("<font color='GREEN' font-weight='bold'>You have successfully Registered</font>");
                else if(request.getParameter("action")!=null && request.getParameter("action").toString().equals("error"))
                    out.print("<font color='RED' font-weight='bold'>Sorry Error Occured</font>");
            %>
         <center> 
       </div> 
            
         
            <div id="rightpart"> 
            </div>    
            
         </div>     
    </div>      
    </body>
</html>
