

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>

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
                     double amt = Double.parseDouble(request.getParameter("tot"));
                     double disc = 100.0;
                     double vat = 4.0;
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");        
                     String sql = "select * from bill";
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery(sql);
                     rs.last();
                     int bno;
                     if(rs.getRow()==0)
                         bno = 0;
                     else
                         bno = rs.getInt(1);
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd");
                    String date = df.format(new java.util.Date());
                    bno++;
                    session.setAttribute("bno", bno);
                    String name = session.getAttribute("name").toString();
                    int tid = Integer.parseInt(session.getAttribute("tid").toString());
                    //sql = "insert into trans(tid,billno,utype,buyer,tdate,tamt) values("+tid+","+bno+",1,'"+name+"','"+date+"',"+amt+")";
                    sql = "update trans set billno="+bno+", utype=1, buyer='"+name+"', tdate='"+date+"', tamt="+amt+" where tid="+tid;
                    
                    System.out.println(sql);
                    int succ = st.executeUpdate(sql);
                            
                %>
                
                <form name="fna" action="final.jsp" method="post">
                    <table>
                    <%
                         out.print("<tr><td>Name <input type='text' readonly='true' name='name' value='"+name+"' /></td></tr>");
                    %>
                    <%
                         out.print("<tr><td>Address <input type='text' readonly='true' name='addr' value='"+session.getAttribute("addr").toString()+"' /></td></tr>");
                    %>
                    <%
                         out.print("<tr><td>Amount <input type='text' readonly='true' name='amt' value='"+amt+"' /></td></tr>");
                    %>
                    <%
                         out.print("<tr><td>Discount <input type='text' readonly='true' name='disc' value='"+disc+"' /></td></tr>");
                    %>
                   <%
                         out.print("<tr><td>Vat <input type='text' readonly='true' name='vat' value='"+vat+"' /></td></tr>");
                    %>
                    
                    <%
                         out.print("<tr><td>Date <input type='text' readonly='true' name='dt' value='"+date+"' /></td></tr>");
                    %>
                    
                   <%
                         out.print("<tr><td>Gross <input type='text' readonly='true' name='gross' value='"+(amt-disc+vat)+"' /></td></tr>");
                         rs.close();
                         st.close();
                         con.close();
                   }catch(Exception ex){out.print("<font color='red'>Error Occured</font>");}
                   %>
                    </table>
                   <input type="submit" value="Confirm Purchase" name="conf" />
                </form>
                
            </div>
            <div id="righttpart">
                <%
             try{
                    out.println(session.getAttribute("name").toString()+"<br/>");
                    }
                    catch(Exception e){response.sendRedirect("index.html");}
             %>
             <a href="logout.jsp" class="ab">LOGOUT</a>
            </div>
        </div>
        
    </div>
    </body>
</html>

