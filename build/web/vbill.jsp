

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Bill</title>
        <link href="style.css" type="text/css" rel="stylesheet" />
    </head>
    
    <body>
        <%
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                    System.out.println("Connection Established");
                    Statement st = con.createStatement();
                    String sql = "select * from bill where billno="+Integer.parseInt(request.getParameter("id").toString());
                    ResultSet rs = st.executeQuery(sql);
                    rs.last();
                    
                    if(rs.getRow()==0)
                        out.print("</h3>Error in bill Retrival</h3>");
                    else
                    {
                        rs.first();
                        //out.print("Moving");
                        //out.print(rs.getRow());
                        sql = "select * from sales where tid="+Integer.parseInt(request.getParameter("tid").toString());
                        Statement st1 = con.createStatement();
                        ResultSet rs1 = st1.executeQuery(sql);
                        out.print("<center>");
                        out.print("<table border=1>");
                                out.print("<tr><td colspan=6>"+rs.getString(2)+"</td></tr>");
                                out.print("<tr><td colspan=6>Date:  "+rs.getString(9)+"</td></tr>");
                                out.print("<tr><td colspan=6>Your Item Details</td></tr>");
                                out.print("<tr><td>Item</td><td>Rate</td><td>AC CHARGE</td><td>Quantity</td><td>AC ROOMS</td><td>Total</td></tr>");
                                while(rs1.next())
                                {
                                  out.print("<tr><td>"+rs1.getString(9)+"</td><td>"+rs1.getDouble(10)+"</td><td>"+rs1.getDouble(11)+"</td><td>"+rs1.getInt(7)+"</td><td>"+rs1.getInt(8)+"</td><td>"+rs1.getDouble(12)+"</td></tr>");
                                }
                                out.print("<tr><td colspan=6>Total:     "+rs.getDouble(5)+"</td></tr>");
                                out.print("<tr><td colspan=6>Discount:  "+rs.getDouble(6)+"</td></tr>");
                                out.print("<tr><td colspan=6>Vat:       "+rs.getDouble(7)+"</td></tr>");
                                out.print("<tr><td colspan=6>Gross:     "+rs.getDouble(8)+"</td></tr>");
                                out.print("<tr><td colspan=6>Delivery Address: "+rs.getString(4)+"</td></tr>");
                        out.print("</table>");
                        out.print("</center>");
                        
                       rs1.close();
                    }
                    rs.close();
                    
                    st.close();
                    con.close();
        %>
            <center>
                <a class="ab" href="custhome.jsp">HOME</a> 
            </center>
    </body>
</html>
