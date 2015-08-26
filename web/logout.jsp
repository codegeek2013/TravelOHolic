

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging Out</title>
    </head>
    <body>
        <%
            session.invalidate();
            out.print("You have been successfully logged out");
            try{
            response.wait(5000);
            }catch(Exception e){out.print("Error occired");}
            response.sendRedirect("index.html");
        %>
    </body>
</html>
