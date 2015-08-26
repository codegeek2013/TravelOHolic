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
        <link href="home.css" type="text/css" rel="stylesheet" />
        <style type="text/css">
                 
        #leftpart{
            width:30%;
            height: 20%;
            float: left;
            margin-left: 30%;
            margin-top: 10%;
            padding-top: 3px;
            padding-bottom: 3px;
            background-color: darkgrey;
            
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
        
        }
      
    </script>
    <body>
      <div id="container">  
        <div id="banner">
            <img  src="../title.jpg" />
        </div>
        
               
        <div id="pbody">
           
        <div id="leftpart">
         <center>
        <form name="fna" action="../adlogin" onsubmit="return check()">
            <table cellpadding=2>
            
            <tr>
            <td>Username</td>  <td><input type="text" name="uname" value="" /></td>
            </tr>
            
            <tr>
            <td>Password</td>  <td><input type="password" name="pass" value="" /></td>
            </tr>
                                  
            </table>
            <br/>
            <input type="submit" value="Login" />
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
