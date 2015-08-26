

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
            .spec{
              font-size: 15px; 
              font-family: monospace;
              margin: 2px;
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
            <img src="../title.jpg" />
        </div>
        
        <div id="menu">
            <center>
            <a href="admin.jsp">Home</a>
            <a href="cp.jsp">Change Your Password</a>
            </center>
        </div>
        
        <div id="pbody">
            <div id="leftpart">
                <form id="srch" action="vbook.jsp" method="post">
                    <center>
                         <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                            Statement st = con.createStatement();
                            String sql1 = "select * from users where type=1"; 
                            ResultSet rs = st.executeQuery(sql1);
                            rs.last();
                            if(rs.getRow()!=0)
                            {
                                rs.first();
                            out.print("Select User <select name='usr' size='1'><option>"+rs.getString(1)+"</option>");
                            while(rs.next())
                                out.print("<option>"+rs.getString(1)+"</option>");
                            out.print("</select><br/>");
                            }
                            
                          %>                          
                        <a href="javascript: frmsub()">Search</a>
                    </center>    
                </form><br/>    
                
                <%
                     if(request.getParameter("usr")!=null)
                    {
                            //String dt = request.getParameter("dt").toString();
                            String usr = request.getParameter("usr").toString();
                            String sql = "select * from sales where uname='"+usr+"'";
                            System.out.println(sql);
                            ResultSet rs1 = st.executeQuery(sql);
                            rs1.last();
                            if(rs1.getRow() > 0)
                            {
                                rs1.first();
                            try{
                                out.print("<table border=1>");
                                out.print("<tr><td>Transaction ID</td><td>Sale ID</td><td>Date</td><td>Single Bed Room/Cars</td><td>Double Bed Room</td><td>Hotel/Car Name</td><td>Total</td><td>Customer Name</td><td>Date of Journey</td><td>Action</td></tr>");
                                out.print("<tr>");
                                if((rs1.getRow()%2)!=0)
                                out.print("<td rowspan='2'>"+rs1.getInt(5)+"</td>");
                                out.print("<td>"+rs1.getInt(1)+"</td>");
                                out.print("<td>"+rs1.getString(4)+"</td>");
                                out.print("<td>"+rs1.getInt(7)+"</td>");
                                out.print("<td>"+rs1.getInt(8)+"</td>");
                                out.print("<td>"+rs1.getString(9)+"</td>");
                                out.print("<td>"+rs1.getDouble(12)+"</td>");
                                out.print("<td>"+rs1.getString(6)+"</td>");
                                out.print("<td>"+rs1.getString(15)+"</td>");
                                if((rs1.getRow()%2)!=0)
                                out.print("<td rowspan='2'><a class='spec' href='vbill.jsp?tid="+rs1.getInt(5)+"'>Show</a></td>");
                                out.print("</tr>");
                                while(rs1.next())
                                {
                                    out.print("<tr>");
                                    if((rs1.getRow()%2)!=0)
                                    out.print("<td rowspan='2'>"+rs1.getInt(5)+"</td>");
                                    out.print("<td>"+rs1.getInt(1)+"</td>");
                                    out.print("<td>"+rs1.getString(4)+"</td>");
                                    out.print("<td>"+rs1.getInt(7)+"</td>");
                                    out.print("<td>"+rs1.getInt(8)+"</td>");
                                    out.print("<td>"+rs1.getString(9)+"</td>");
                                    out.print("<td>"+rs1.getDouble(12)+"</td>");
                                    out.print("<td>"+rs1.getString(6)+"</td>");
                                    out.print("<td>"+rs1.getString(15)+"</td>");
                                    if((rs1.getRow()%2)!=0)
                                    out.print("<td rowspan='2'><a class='spec' href='vbill.jsp?tid="+rs1.getInt(5)+"'>Show</a></td>");
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
                        
                        try{
                        
                        out.print("<right>");
                        out.print("<font color='#375C89'>"+session.getAttribute("uname").toString()+"</font><br/><br/>");
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
