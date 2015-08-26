

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Area</title>
        
        <link href="style.css" type="text/css" rel="stylesheet" />
    
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
            <a class="ab" href="vhist.jsp">View Booking History</a>
            </center>
        </div>
        
        <div id="pbody">
            <div id="leftpart">2321313</div>
            <div id="righttpart">
            <center>
                <%
             try{
                    out.println(session.getAttribute("name").toString()+"<br/>");
                    }
                    catch(Exception e){response.sendRedirect("index.html");}
             %>
                
                <a href="logout.jsp" class="ab">LOGOUT</a>
            </center>
            
            </div>
        </div>
        
    </div>
    </body>
</html>
