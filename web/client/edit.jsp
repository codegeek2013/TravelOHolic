
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit your content</title>
        <link href="home.css" type="text/css" rel="stylesheet" />
        <style type="text/css">
            table, th, td{
                border: 1px solid #87ABD8;
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
            <a href="edit.jsp">Edit</a>
            <a href="profile.jsp">View Profile</a>
            <a href="vhist.jsp">View Booking History</a>
            </center>
        </div>
            
            <div id="pbody">
                <div id="leftpart">
        <%
            
            
            
            if(request.getParameter("id")!=null && request.getParameter("mode")!=null && request.getParameter("client")!=null)
            {
                Statement st = con.createStatement();
                int id = Integer.parseInt(request.getParameter("id").toString());
                int clid = Integer.parseInt(request.getParameter("client").toString());
                if(request.getParameter("mode").toString().equals("car"))
                {
                    String sql = "select * from stock_c where carid="+id+" and cid="+clid;
                    System.out.println(sql);
                    ResultSet rs = st.executeQuery(sql);
                    rs.last();
                    int count = rs.getRow();
                    if(count==0)
                        out.print("<font color='red'>You donot have the permission to access it</font>");
                    else
                    {
                        rs.first();
                        out.print("<form method='GET' action='update2'>");
                        out.print("<input type='text' name='type' hidden value='car' />");
                        out.print("<input type='text' name='id' hidden value='"+id+"' />");
                        out.print("<table>");
                        out.print("<tr><td>Location</td><td>Car</td><td>Quantity</td><td>Rate</td><td>Action</td></tr>");
                            
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'>"+rs.getString(6)+"</font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='qty' value='"+rs.getInt(4)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='rate' value='"+rs.getDouble(3)+"' /></font></td>");
                            out.print("</tr>");
                        out.print("</table>");
                        out.print("<input type='submit' value='UPDATE' />");
                        out.print("</form>");
                    }
                    
                }
                
                else if(request.getParameter("mode").toString().equals("hotel"))
                {
                    String sql = "select * from stock_h where hid="+id+" and cid="+clid;
                    System.out.println(sql);
                    ResultSet rs = st.executeQuery(sql);
                    rs.last();
                    int count = rs.getRow();
                    if(count==0)
                        out.print("<font color='red'>You donot have the permission to access it</font>");
                    else
                    {
                        rs.first();
                        out.print("<form method='GET' action='update2'>");
                        out.print("<input type='text' name='type' hidden value='hotel' />");
                        out.print("<input type='text' name='id' hidden value='"+id+"' />");
                        out.print("<table>");
                        out.print("<tr><td>Location</td><td>Single Bed Rooms</td><td>Single Bed Rate</td><td>Double Bed Rooms</td><td>Double Bed </td></tr>");
                            
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getString(5)+"</font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='sbqty' value='"+rs.getInt(4)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='sbr' value='"+rs.getDouble(3)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='dbqty' value='"+rs.getInt(7)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='dbr' value='"+rs.getDouble(6)+"' /></font></td>");
                            out.print("</tr>");
                        out.print("</table>");
                        out.print("<input type='submit' value='UPDATE' />");
                        out.print("</form>");
                    }
                    
                }
            
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
