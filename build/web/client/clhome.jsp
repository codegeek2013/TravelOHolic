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
            <img src="title.jpg" />
        </div>
        
        <div id="menu">
            <center>
            <a href="clhome.jsp">Home</a>
            <a href="cp.jsp">Change Password</a>
            <a href="vbook.jsp">View My Bookings</a>
            </center>
        </div>
            
            <div id="pbody">
                <div id="leftpart">
                    <%
                    try{
                        
                        String sql = "select * from client where uname='"+session.getAttribute("uname").toString()+"'";
                        Statement st = con.createStatement();
                        System.out.println(sql);
                        ResultSet rs = st.executeQuery(sql);
                        rs.last();
                        int id = rs.getInt(1);
                        session.setAttribute("clid", id);
                        sql = "select * from stock_h where cid="+id;
                        rs = st.executeQuery(sql);
                        rs.last();
                        int count = rs.getRow();
                        if(count!=0)
                        {
                        out.print("<font color='#375C89' size='20'>Your Hotels</font><br/>");
                        rs.first();
                        out.print("<table>");
                            out.print("<tr><td>Location</td><td>Single Bed Rooms</td><td>Single Bed Rate</td><td>Double Bed Rooms</td><td>Double Bed Rate</td><td>Action</td></tr>");
                            
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getInt(4)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getDouble(3)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getInt(7)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getDouble(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=edit.jsp?id="+rs.getInt(1)+"&mode=hotel&client="+id+">Edit</a></font></td>");
                            out.print("</tr>");
                        while(rs.next())
                        {
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getInt(4)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getDouble(3)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getInt(7)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getDouble(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=edit.jsp?id="+rs.getInt(1)+"&mode=hotel&client="+id+">Edit</a></font></td>");
                            out.print("</tr>");
                        }
                        out.print("</table>");
                        
                    }
                        //For cars
                        
                        
                        sql = "select * from stock_c where cid="+id;
                        rs = st.executeQuery(sql);
                        
                        rs.last();
                        int c = rs.getRow();
                        rs.first();
                        if(c!=0)
                        {
                            out.print("<font color='#375C89' size='20'>Your Cars</font><br/>");
                            out.print("<table>");
                            out.print("<tr><td>Location</td><td>Car</td><td>Quantity</td><td>Rate</td><td>Action</td></tr>");
                            
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getInt(4)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getDouble(3)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=edit.jsp?id="+rs.getInt(1)+"&mode=car&client="+id+">Edit</a></font></td>");
                            out.print("</tr>");
                        while(rs.next())
                        {
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getInt(4)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getDouble(3)+"</font></td>");
                            out.print("<td><font color='#0011ff'><a class='spec' href=edit.jsp?id="+rs.getInt(1)+"&mode=car&client="+id+">Edit</a></font></td>");
                            out.print("</tr>");
                        }
                        out.print("</table>");
                    }  
                    }catch(Exception e){out.print("<font color='red'>Error Occured</font>");} 
                        
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
