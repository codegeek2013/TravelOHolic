

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy</title>
        
        
        <style type="text/css">
            
        </style>
        
        
        <script type="text/javascript">
           
        
        
        
        
        
        </script>
        
    
        
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
           </center>
        </div>
        
        <div id="pbody">
            <div id="leftpart">
                
                
                
                    <form name="fna" action="avlins">
               <%     
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                    System.out.println("Connection Established");
                    Statement st = con.createStatement();
                    
                %>
                
                
                <%
                    try{
                    
                    out.print("Name: <input type='text' name='nm' readonly value='"+session.getAttribute("name").toString()+"' /><br/>");
                    out.print("User Name:<input type='text' name='uname' readonly value='"+session.getAttribute("uname").toString()+"' /><br/>");
                    String sql1 = "select a.*,b.cname from stock_h a,client b where a.hid="+request.getParameter("hid").toString()+" and a.cid=b.cid";
                    System.out.println(sql1);
                    ResultSet r1 = st.executeQuery(sql1);
                    r1.first();
                    out.print("Hotel Name: <input name='hname' readonly value='"+r1.getString(8)+"' /><br/>");
                    
                    
                        out.print("Double Bed rooms <select name='dbr' size='1'> <option>1</option><option>2</option><option>3</option> </select><br/>");
                        out.print("SINGLE rooms <select name='sbr' size='1'> <option>1</option><option>2</option><option>3</option> </select><br/>");
                    
                         /*<select  name = "ac" size = "2"
                                > <option> <  / option
                                > <option> <  / option
                                > < / select
                                >*/
                   //hotel
                    
                   String sql = "select a.*,b.cname from stock_c a,client b where a.carid="+request.getParameter("cid").toString()+" and a.cid=b.cid"; 
                   ResultSet rs = st.executeQuery(sql);
                   rs.first();
                   out.print("Car Name: <input name='cname' readonly value='"+rs.getString(6)+"' />");
                    if(rs.getInt(4) > 0)
                        out.print("Cars Required <select name='cars' size='1'> <option>1</option><option>2</option><option>3</option></select>");
                
                   out.print("<input type='text' hidden name='hid' value="+request.getParameter("hid")+" />");
                   out.print("<input type='text' hidden name='cid' value="+request.getParameter("cid")+" />"); 
                   out.print("Date of journey <input name='doj' value="+request.getParameter("doj")+" /><br/>");
                   out.print("Duration of stay <input name='dos' value="+request.getParameter("dos")+" /><br/>");
                   out.print("Location <input name='loch' value='"+request.getParameter("loc")+"' /><br/>");
                    }catch(Exception e){out.print("<font color='red'>ERROR OCCURED</font>");}  
                %>
            
            
            <%
                    
            %>
            
           
            <input type="submit" value="Proceed to Booking" name="go" />
         </form>
               </center> 
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
</html>

