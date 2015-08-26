

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Bill</title>
        <link href="style.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <%
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                    System.out.println("Connection Established");
                    Statement st = con.createStatement();
                    String name = request.getParameter("name").toString();
                    String addr = request.getParameter("addr").toString();
                    Double amt = Double.parseDouble(request.getParameter("amt").toString());
                    Double disc = Double.parseDouble(request.getParameter("disc").toString());
                    Double vat = Double.parseDouble(request.getParameter("vat").toString());
                    Double gross = (amt+vat) - disc;
                    String dt = request.getParameter("dt").toString();
                    int bno = Integer.parseInt(session.getAttribute("bno").toString());
                    String sql = "insert into bill(billno,cname,addr,amt,disc,vat,gross,dog) values("+bno+",'"+name+"','"+addr+"',"+amt+","+disc+","+vat+","+gross+",'"+dt+"')";
                    System.out.println(sql);
                    int succ = st.executeUpdate(sql);
                    if(succ==0)
                        out.print("</h3>Error in bill generation</h3>");
                    else
                    {
                        sql = "select * from sales where tid="+Integer.parseInt(session.getAttribute("tid").toString());
                        ResultSet rs = st.executeQuery(sql);
                        out.print("<center>");
                        out.print("<table border=1>");
                                out.print("<tr><td colspan=6>"+name+"</td></tr>");
                                out.print("<tr><td colspan=6>Date:  "+dt+"</td></tr>");
                                out.print("<tr><td colspan=6>Your Item Details</td></tr>");
                                //out.print("<tr><td>Item</td><td>Rate</td><td>Quantity</td><td>Total</td></tr>");
                                out.print("<tr><td>Item</td><td>Sibgle Bed Rate</td><td>Double Bed Rate</td><td>Quantity</td><td>Double bed rooms</td><td>Total</td></tr>");
                                while(rs.next())
                                {
                                  out.print("<tr><td>"+rs.getString(9)+"</td><td>"+rs.getDouble(10)+"</td><td>"+rs.getDouble(11)+"</td><td>"+rs.getInt(7)+"</td><td>"+rs.getInt(8)+"</td><td>"+rs.getDouble(12)+"</td></tr>");
                                }
                                rs.first();
                                out.print("<tr><td colspan=6>Duration of stay:     "+rs.getInt(16)+"</td></tr>");
                                out.print("<tr><td colspan=6>Total:     "+amt+"</td></tr>");
                                out.print("<tr><td colspan=6>Discount:  "+disc+"</td></tr>");
                                out.print("<tr><td colspan=6>Vat:       "+vat+"</td></tr>");
                                out.print("<tr><td colspan=6>Gross:     "+gross+"</td></tr>");
                                out.print("<tr><td colspan=6>Delivery Address: "+addr+"</td></tr>");
                        out.print("</table>");
                        out.print("</center>");
                        rs.close();
                    }
                    
                    
                    st.close();
                    con.close();
                    }catch(Exception ex){out.print("<font color='red'>Error Occured</font>");}
                    
                    
                    try{
                        String nm = session.getAttribute("name").toString();
                    }catch(Exception e){response.sendRedirect("index.html");
                    }
        %>
        <a class="ab" href="custhome.jsp">HOME</a>
    </body>
</html>
