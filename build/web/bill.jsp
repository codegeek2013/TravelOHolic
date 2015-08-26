

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*;"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Area</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    
    </head>


    
    
    <body>
    <div id="container">
        <div id="banner">
            <img src="title.jpg" />
        </div>
        
        <div id="menu">
            <center>
            <a class="ab" href="custhome.jsp">Home</a>
            <a class="ab" href="buy.jsp">Buy</a>
            </center>
        </div>
        
        <div id="pbody">
            <div id="leftpart">
                <%
                         
                    try{
                    out.println(request.getParameter("tid").toString());
                    session.setAttribute("tid",request.getParameter("tid"));
                    String sql = "select * from sales where tid="+request.getParameter("tid");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                    System.out.println("Connection Established");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    double tot = 0.0;
                    out.print("<table border='1'>");
                    out.print("<tr>");
                    out.print("<td>Item name</td><td>Single Bed Rate</td><td>Quantity</td><td>Double Bed ROOMS</td><td>Double Bed Charge</td><td>Total</td>");
                    out.print("</tr>");
                    //out.print("<br/>");
                    while(rs.next())
                    {
                        out.print("<tr>");
                        out.print("<td>"+rs.getString(9)+"</td>");
                        out.print("<td>"+rs.getDouble(10)+"</td>");
                        out.print("<td>"+rs.getInt(7)+"</td>");
                        out.print("<td>"+rs.getInt(8)+"</td>");
                        
                        out.print("<td>"+rs.getDouble(11)+"</td>");
                        out.print("<td>"+rs.getDouble(12)+"</td>");
                        out.print("</tr>");
                        tot = tot + rs.getDouble(12);
                    }
                    
                    rs.first();
                    out.print("<tr><td colspan=3>Sub Total</td><td colspan=3>"+tot+"</td></tr>");
                    out.print("<tr><td colspan=3>Duration of stay</td><td colspan=3>"+rs.getInt(16)+"</td></tr>");
                    out.print("<tr><td colspan=3>Total </td><td colspan=3>"+(rs.getInt(16)*tot)+"</td></tr>");
                    out.print("</table>");
                    
                %>
                <form name="fna" method="POST" action="confrm.jsp">
                    <%
                     out.print("<input type='text' name='tot' value='"+(rs.getInt(16)*tot)+"' hidden='true' />");        
                     rs.close();
                     st.close();
                     con.close();
                     }catch(Exception ex){out.print("<font color='red'>Error Occured</font>");}
                    %>
                    <input type="submit" value="confirm" />
                 </form>
                
            </div>
            <div id="righttpart">
                <a href="logout.jsp" class="ab">LOGOUT</a>
            <%
            try{
                    out.println(session.getAttribute("name").toString()+"<br/>");
                    }
                    catch(Exception e){response.sendRedirect("index.html");}
            
            %>
            
            </div>
        </div>
        
    </div>
    </body>
</html>
