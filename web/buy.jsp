

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy</title>
        <link rel="stylesheet" href="jquery/jquery-ui.css" />
        <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="jquery/jquery-ui.js"></script>
        
        <style type="text/css">
            #ui-datepicker-div{
                    font-size: 60%;
            }
            
            .ui-datepicker-trigger{
                height: 16px;
                width: 16px;
            }
            
         </style>
        <link rel="stylesheet" type="text/css" href="style.css" />
        
        <script type="text/javascript">
           
                     
            //date pick
            $(function() {
                $( "#datepicker" ).datepicker({
            showOn: "button",
            buttonImage: "jquery/cal.gif",
            buttonImageOnly: true,
            dateFormat: "yy-mm-dd",
            changeYear: true,
            changeMonth: true,
            showAnim: "drop",
            buttonText: "Select date"
	  
	});
        });
        
        function chk()
            {
                var val_search= document.forms["f1"].loc.value;
                
                if(!val_search || val_search==="")
                {
                    alert('Please enter a proper loaction');
                    return false;
                    
                }
                return true;
            }
        
        
        
        function avchk()
        {
            var hotel_id = document.fna.hotel.value;
            window.location('avlchk?hid='+hotel_id);
            
        }
        
        function frmsubmit()
            {
                document.forms["f1"].submit();
            }
        
        
        </script>
        
        
        
        
    
    
    </head>
    <body>
        <div id="container">
        <div id="banner">
            <img class="ban" src="title.jpg" />
        </div>
        
        <div id="menu">
            <center>
             <a class="ab" href="custhome.jsp">Home</a>
            <a class="ab" href="buy.jsp">Buy</a>
            <a class="ab" href="vhist.jsp">View Booking History</a>
            </center>
        </div>
        
        <div id="pbody">
            <div id="leftpart">
                
                <center>
                <form id="f1" action="buy.jsp" onsubmit="return chk()">
                    Enter Your Destination <input type="text" name="loc" /><br/>
                    <a href="javascript: frmsubmit()" class="ab" >Search</a>
                </form>
                <%
                    if(request.getParameter("avl")!=null && request.getParameter("avl").toString().equals("1"))
                        out.print("<form name='fna' action='avlins'");
                    else
                        out.print("<form name='fna' action='havlchk'>");
                %>
                    
                    
                    
                    
                    <%
                     
                    
                    if(request.getParameter("loc")!= null)
                    {    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                    System.out.println("Connection Established");
                    Statement st = con.createStatement();
                    String sql = "select a.carid,b.cname,a.rate,a.qty,a.car from client b,stock_c a where a.cid=b.cid and a.addr='"+request.getParameter("loc").toString()+"'";
                    ResultSet rs = st.executeQuery(sql);
                    out.print("Select Car <br/>");
                    out.print("<table border=1>");
                    out.print("<tr><td>Select</td><td>Car ID</td><td>Car Name</td><td>Car Service</td><td>Rate(per day)</td></tr>");
                    while(rs.next())
                    {
                        out.print("<tr>");
                        out.print("<td><input type='radio' name='car' value='"+rs.getInt(1)+"' /></td>");
                        out.print("<td>"+rs.getInt(1)+"</td>");
                        out.print("<td>"+rs.getString(5)+"</td>");
                        out.print("<td>"+rs.getString(2)+"</td>");
                        out.print("<td>"+rs.getDouble(3)+" INR</td>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
                    out.print("<input name='loch' type='text' hidden='true' value='"+request.getParameter("loc").toString()+"'/>");
                %>
            <br/>
            
                <%
                    
                    String sql1 = "select b.*,a.cname from client a,stock_h b where a.cid=b.cid and b.addr='"+request.getParameter("loc").toString()+"'";
                    System.out.println(sql1);
                    ResultSet r1 = st.executeQuery(sql1);
                    out.print("Select Hotel <br/>");
                    out.print("<table border=1>");
                    out.print("<tr><td>Select</td><td>Hotel ID</td><td>Provided By</td><td>SINGLE BED(room/day)</td><td>DOUBLE BED RATE</td></tr>");
                    while(r1.next())
                    {
                        out.print("<tr>");
                        out.print("<td><input type='radio' name='hotel' value='"+r1.getInt(1)+"' /></td>");
                        out.print("<td>"+r1.getInt(1)+"</td>");
                        out.print("<td>"+r1.getString(8)+"</td>");
                        out.print("<td>"+r1.getDouble(3)+" INR</td>");
                        out.print("<td>"+r1.getDouble(6)+" INR</td>"); //rates complete
                        
                        out.print("</tr>");
                    }
                    out.print("</table>");
                    
                    
                    st.close();
                    con.close();
                    }
                    
                    
                %>
            
            
            
            
           <br/> <p>Select your date of Check-in <input id="datepicker" type="text" name="doj" /></p>
           <p>How many days do you plan to stay? <input type="text" name="dos" /></p>
            
            <%
                    if(request.getParameter("avl")!=null && request.getParameter("avl").toString().equals("1"))
                    {
                        out.print("<font color='WHITE' font-size=12>Available. Please proceed to book and confirm your plan</font>");
                        out.print("Your Name: <input type='text'name='nm' readonly value='"+session.getAttribute("name").toString()+"'>");
                        out.print("<br/>Enter the number of double bed-rooms <input type='text' name='dbr'/>");
                        out.print("<br/>Enter the number of single bed-rooms <input type='text' name='sbr'/>");
                        out.print("<br/>Enter the number of cars <input type='text' name='cars'/><br/>");
                        out.print("<input type='submit' name='go' value='Proceed to Booking' />");
                    }
                    else if(request.getParameter("avl")!=null && request.getParameter("avl").toString().equals("2"))
                    {
                        out.print("<font color='RED' font-size=12>Avaibility only for "+request.getParameter("fc").toString()+" days.Please replan your travel</font>");
                        out.print("<input type='submit' name='go' value='Check Availibility'/>");
                    }
                    else
                        out.print("<input type='submit' name='go' value='Check Availibility'/>");
            %>
         </form>
               </center> 
            </div>
            
            
         <div id="righttpart">
             <%
             try{
                    out.println(session.getAttribute("name").toString()+"<br/>");
                    System.out.print(session.getAttribute("name").toString());
                    }
                    catch(Exception e){response.sendRedirect("index.html");}
             %>
             <a href="logout.jsp" class="ab">LOGOUT</a>
         </div>
        </div>
        
    </div>
</html>
