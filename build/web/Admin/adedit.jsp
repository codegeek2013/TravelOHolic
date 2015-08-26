
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.Date" %>
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
            <img src="../title.jpg" />
        </div>
        
        <div id="menu">
            <center>
            <a href="admin.jsp">Home</a>
            </center>
        </div>
            
            <div id="pbody">
                <div id="leftpart">
        <%
            
            
            
            if(request.getParameter("id")!=null && request.getParameter("mode")!=null && request.getParameter("mode").toString().equals("client"))
            {
                Statement st = con.createStatement();
                int id = Integer.parseInt(request.getParameter("id").toString());
                    String sql = "select * from client where cid="+id;
                    System.out.println(sql);
                    ResultSet rs = st.executeQuery(sql);
                    rs.last();
                    int count = rs.getRow();
                    if(count==0)
                        out.print("<font color='red'>No Such Client Exists</font>");
                    else
                    {
                        rs.first();
                        out.print("<form method='GET' action='updatecli'>");
                        out.print("<input type='text' name='id' hidden value='"+id+"' />");
                        out.print("<table>");
                            out.print("<tr><td>Id</td><td>Name</td><td>User Name</td><td>Address</td><td>Email</td><td>Phone</td></tr>");
              
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getInt(1)+"</font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='fname' value='"+rs.getString(2)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='uname' value='"+rs.getString(3)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='addr' value='"+rs.getString(4)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='mail' value='"+rs.getString(5)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='ph' value='"+rs.getString(6)+"' /></font></td>");
                            out.print("</tr>");
                        out.print("</table>");    
                        out.print("<input type='submit' value='UPDATE' />");
                        out.print("</form>");
                    }
                    
                }
                
                else if(request.getParameter("mode")!=null && request.getParameter("mode").toString().equals("user") && request.getParameter("uname")!=null)
                {
                    String sql = "select * from users where uname='"+request.getParameter("uname").toString()+"'";
                    System.out.println(sql);
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    rs.last();
                    int count = rs.getRow();
                    if(count==0)
                        out.print("<font color='red'>No such User</font>");
                    else
                    {
                        rs.first();
                        out.print("<form method='GET' action='updateusr'>");
                        
                        out.print("<table>");
                            out.print("<tr><td>Name</td><td>User Name</td><td>Address</td><td>Email</td><td>Phone</td></tr>");
              
                            out.print("<tr>");
                            
                            out.print("<td><font color='#0011ff'><input type='text' name='fname' value='"+rs.getString(9)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='uname' value='"+rs.getString(1)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='addr' value='"+rs.getString(8)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='mail' value='"+rs.getString(6)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='ph' value='"+rs.getString(5)+"' /></font></td>");
                            out.print("</tr>");
                        out.print("</table>");    
                        out.print("<input type='submit' value='UPDATE' />");
                        out.print("</form>");
                    }
                    
                }
            
                    
        %>
        </div>
                
                
                <div id="rightpart">
                    <%
                        try{
                        out.print("<right>");
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
