

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.Date"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Bookings</title>
  
        <link href="home.css" type="text/css" rel="stylesheet" />
        <style type="text/css">
       table, th, td{
                border: 1px solid #87ABD8;
            }
    </style>
    
    <script type="text/javascript">
            function frmsub()
            {
                document.forms["srch"].submit();
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
            <a href="cp.jsp">Change Your Password</a>
            <a href="profile.jsp">View Profile</a>
            <a href="vbook.jsp">View My Bookings</a>
            </center>
        </div>
        
        <div id="pbody">
            <div id="leftpart">
                <form id="srch" action="vbook.jsp" action="post">
                    <center>
                         <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                            Statement st = con.createStatement();
                            String sql1 = "select * from stock_h where cid="+Integer.parseInt(session.getAttribute("clid").toString());
                            ResultSet rs = st.executeQuery(sql1);
                            rs.last();
                            if(rs.getRow()!=0)
                            {
                                rs.first();
                            out.print("Select Hotel <select name='hlid' size='1'><option>"+rs.getInt(1)+"</option>");
                            while(rs.next())
                                out.print("<option>"+rs.getInt(1)+"</option>");
                            out.print("</select><br/>");
                            }
                            
                            sql1 = "select * from stock_c where cid="+Integer.parseInt(session.getAttribute("clid").toString());
                            rs = st.executeQuery(sql1);
                            rs.last();
                            if(rs.getRow()!=0)
                            {
                             rs.first();
                            out.print("Select Car <select name='carid' size='1'><option>"+rs.getInt(1)+"</option>");
                            while(rs.next())
                                out.print("<option>"+rs.getInt(1)+"</option>");
                            out.print("</select>");
                            }
                        %>
                        <a href="javascript: frmsub()">Search</a>
                    </center>    
                </form><br/>    
                
                <%
                     if(request.getParameter("hlid")!=null)
                    {
                            //String dt = request.getParameter("dt").toString();
                            int hlid = Integer.parseInt(request.getParameter("hlid").toString());
                            String sql = "select a.*,b.addr from booking_h a,stock_h b where a.hotelid=b.hid and b.hid="+hlid;
                            System.out.println(sql);
                            ResultSet rs1 = st.executeQuery(sql);
                            rs1.last();
                            if(rs1.getRow() > 0)
                            {
                                rs1.first();
                            try{
                                out.print("<table border=1>");
                                out.print("<tr><td>Date</td><td>Single Bed Room</td><td>Double Bed Room</td><td>Location</td><td>Customer Name</td></tr>");
                                out.print("<tr>");
                                out.print("<td>"+rs1.getString(1)+"</td>");
                                out.print("<td>"+rs1.getInt(3)+"</td>");
                                out.print("<td>"+rs1.getInt(4)+"</td>");
                                out.print("<td>"+rs1.getString(6)+"</td>");
                                out.print("<td>"+rs1.getString(5)+"</td>");
                                out.print("</tr>");
                                while(rs1.next())
                                {
                                    out.print("<tr>");
                                    out.print("<td>"+rs1.getString(1)+"</td>");
                                    out.print("<td>"+rs1.getInt(3)+"</td>");
                                    out.print("<td>"+rs1.getInt(4)+"</td>");
                                    out.print("<td>"+rs1.getString(6)+"</td>");
                                    out.print("<td>"+rs1.getString(5)+"</td>");
                                    out.print("</tr>");
                                }
                                out.print("</table>");
                               
                            }catch(Exception e){out.print("<font color='RED'>Error Occured</font><br/>");}
                            }
                            else
                                out.print("<font size='20' color='red'>Sorry No Orderes Yet</font>");
                        
                        
                }
                     
                     else if(request.getParameter("carid")!=null)
                     {
                            //String dt = request.getParameter("dt").toString();
                            int carid = Integer.parseInt(request.getParameter("carid").toString());
                            String sql = "select a.*,b.addr,b.car from booking_c a,stock_c b where a.carid=b.carid and a.carid="+carid;
                            System.out.println(sql);
                            ResultSet rs1 = st.executeQuery(sql);
                            rs1.last();
                            if(rs1.getRow() > 0)
                            {
                                rs1.first();
                            try{
                                out.print("<table border=1>");
                                out.print("<tr><td>Date</td><td>Quantity</td><td>Location</td><td>Car</td><td>Customer Name</td></tr>");
                                out.print("<tr>");
                                out.print("<td>"+rs1.getString(1)+"</td>");
                                out.print("<td>"+rs1.getInt(4)+"</td>");
                                out.print("<td>"+rs1.getString(5)+"</td>");
                                out.print("<td>"+rs1.getString(6)+"</td>");
                                out.print("<td>"+rs1.getString(2)+"</td>");
                                out.print("</tr>");
                                while(rs1.next())
                                {
                                    out.print("<tr>");
                                    out.print("<td>"+rs1.getString(1)+"</td>");
                                    out.print("<td>"+rs1.getInt(4)+"</td>");
                                    out.print("<td>"+rs1.getString(5)+"</td>");
                                    out.print("<td>"+rs1.getString(6)+"</td>");
                                    out.print("<td>"+rs1.getString(2)+"</td>");
                                    out.print("</tr>");
                                }
                                out.print("</table>");
                                
                            }catch(Exception e){out.print("<font color='RED'>Error Occured</font><br/>");}
                     
                            }
                            
                            else
                                out.print("<font size='20' color='red'>Sorry No Orderes Yet</font>");
                     }
                     
                  st.close();
                  con.close();
                 %>               
            </div>
            <div id="righttpart">
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
                <a href="logout.jsp" class="ab">LOGOUT</a></div>
        </div>
        
    </div>
    </body>
</html>
