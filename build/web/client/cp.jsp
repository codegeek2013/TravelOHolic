<%-- 
    Document   : clhome
    Created on : 10 Nov, 2014, 10:39:08 AM
    Author     : Typhoon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Area</title>
        <link href="home.css" type="text/css" rel="stylesheet" />
        <style type="text/css">
                      
            .spec{
              font-size: 15px; 
              font-family: monospace;
              margin: 2px;
            }
        </style>
        <script type="text/javascript">
            function frmsubmit()
            {
                document.forms["cp"].submit();
            }
        </script>    
   </head>
    
    
    
    <body>
        
        
        
        <div id="container">
        <div id="banner">
            <img src="title.jpg" />
        </div>
        
        <div id="menu">
            <center>
            <a href="clhome.jsp">Home</a>
            <a href="cp.jsp">Change Password</a>
            <a href="profile.jsp">View Profile</a>
            <a href="vbook.jsp">View My Bookings</a>
            </center>
        </div>
            
            <div id="pbody">
                <div id="leftpart">
                    
                    <form id="cp" action="cp.jsp" method="post">
                        <center>
                        Enter the new password <input type="password" name="npass" /><br/>
                        <a href="javascript: frmsubmit()">Change Password</a>
                        </center>
                    </form><br/>
                    
                    <%
                        if(request.getParameter("npass")!=null)
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                            Statement st = con.createStatement();
                            String npass = request.getParameter("npass").toString();
                            String sql = "update users set pass='"+npass+"' where uname='"+session.getAttribute("uname").toString()+"'";
                            try{
                                st.executeUpdate(sql);
                                out.print("<font color='GREEN'>Password Successfully Updated</font><br/>");
                            }catch(Exception e){out.print("<font color='RED'>Password Update Failed</font><br/>");}
                        }
                    %>
                    
                </div>
                
                
                <div id="rightpart">
                    
                    <%
                        
                        out.print("<right>");
                        try{
                        out.print("<font size='9' color='#375C89'>"+session.getAttribute("name").toString()+"</font><br/>");
                        
                        out.print("<font size='4' align='right'>"+session.getAttribute("addr").toString()+"</font><br/><br/>");
                        out.print("</right>");
                        java.util.Date d = new Date();
                        
                        out.print("<font color='#375C89'>"+d.toString()+"</font>");
                        }catch(Exception ex){response.sendRedirect("../");}
                    %>
                    <a href="logout.jsp" class="ab">LOGOUT</a>
                    
                </div>
            </div>
    </div>            
    </body>
</html>
