

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Area</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
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
    <div id="container">
        <div id="banner">
            <img src="title.jpg" />
        </div>
        
        <div id="menu">
            <center>
                <a  class="ab" href="custhome.jsp">Home</a>
            <a class="ab" href="buy.jsp">Buy</a>
            <a class="ab" href="vhist.jsp">View Booking History</a>
            </center>
        </div>
        
        <div id="pbody">
            <div id="leftpart">
                <%
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");        
                     String sql = "select * from trans where buyer='"+session.getAttribute("name").toString()+"'";
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery(sql);
                     rs.last();
                     if(rs.getRow()==0)
                     {
                         out.print("<font color=RED><h3>NO PREVIOUS RECORDS FOUND</h3></font>");
                     }
                     else
                     {
                         int c = rs.getRow();
                         rs.first();
                         out.print("<table border=1>");
                         out.print("<tr>");
                         out.print("<td>Transaction ID</td><td>Date</td><td>Amount</td><td>Details</td>");
                         out.print("</tr>");
                         while(c>0)
                         {
                             out.print("<tr>");
                             out.print("<td>"+rs.getInt(1)+"</td>");
                             out.print("<td>"+rs.getString(5)+"</td>");
                             out.print("<td>"+rs.getDouble(6)+"</td>");
                             out.print("<td><a class='spec' href='vbill.jsp?id="+rs.getInt(2)+"&tid="+rs.getInt(1)+"'>View Bill</a></td>");
                             out.print("</tr>");
                             c--;
                             rs.next();
                         }
                         out.print("</table>");
                     }
                     
                     rs.close();
                     st.close();
                     con.close();
                 %>               
            </div>
            <div id="righttpart">
                <%
                try{
                    out.println(session.getAttribute("name").toString()+"<br/>");
                    }
                    catch(Exception e){response.sendRedirect("index.html");}
                %>
                <a href="logout.jsp" class="ab">LOGOUT</a></div>
        </div>
        
    </div>
    </body>
</html>
