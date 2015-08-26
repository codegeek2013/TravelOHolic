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
            table, th, td{
                border: 1px solid #87ABD8;
            }
            
            .spec{
              font-size: 15px; 
              font-family: monospace;
              margin: 2px;
            }
        </style>
   </head>
    
    
    
    <body>
        
        <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                    System.out.println("Connection Established in Client");
                    
        %>
        
        <div id="container">
        <div id="banner">
            <img src="../title.jpg" />
        </div>
        
        <div id="menu">
            <center>
            <a href="admin.jsp">Home</a>
            <a href="cp.jsp">Change Password</a>
            <a href="vbook.jsp">View Bookings</a>
            </center>
        </div>
            
            <div id="pbody">
                <div id="leftpart">
                    <%
                    try{
                        
                        String sql = "select * from client";
                        Statement st = con.createStatement();
                        System.out.println(sql);
                        ResultSet rs = st.executeQuery(sql);
                        rs.last();
                        int count = rs.getRow();
                        if(count!=0)
                        {
                        out.print("<font color='#375C89' size='20'>Your Clients</font><br/>");
                        rs.first();
                        out.print("<table>");
                            out.print("<tr><td>Id</td><td>Name</td><td>User Name</td><td>Address</td><td>Email</td><td>Phone</td><td>Action</td></tr>");
                            
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getInt(1)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(2)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(3)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(4)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=adedit.jsp?id="+rs.getInt(1)+"&mode=client>Edit</a></font></td>");
                            out.print("</tr>");
                        while(rs.next())
                        {
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getInt(1)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(2)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(3)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(4)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=adedit.jsp?id="+rs.getInt(1)+"&mode=client>Edit</a></font></td>");
                            out.print("</tr>");
                        }
                        out.print("</table>");
                        rs.close();
                    }
                        
                        
                        String sql1 = "select * from users where type=1";
                        System.out.println(sql1);
                        ResultSet rs1 = st.executeQuery(sql1);
                        rs1.last();
                        count = rs1.getRow();
                        if(count!=0)
                        {
                        out.print("<font color='#375C89' size='20'>Your Users</font><br/>");
                        rs1.first();
                        out.print("<table>");
                            out.print("<tr><td>Name</td><td>User Name</td><td>Address</td><td>Email</td><td>Phone</td><td>Action</td></tr>");
                            
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs1.getString(9)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(1)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(8)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=adedit.jsp?uname="+rs1.getString(1)+"&mode=user>Edit</a></font></td>");
                            out.print("</tr>");
                        while(rs1.next())
                        {
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs1.getString(9)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(1)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(8)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs1.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=adedit.jsp?uname="+rs1.getString(1)+"&mode=user>Edit</a></font></td>");
                            out.print("</tr>");
                        }
                        out.print("</table>");
                        //For cars
                        rs1.close();
                        } 
                                             
                        st.close();
                        con.close();
                    }  
                    catch(Exception e){
                        e.printStackTrace();
                        out.print("<font color='red'>Error Occured</font>");
                    } 
                        
                    %>
                </div>
                
                
                <div id="rightpart">
                    
                    <%
                        
                        out.print("<right>");
                        try{
                                                
                        out.print("<font color='#375C89'>"+session.getAttribute("uname").toString()+"</font><br/><br/>");
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
