

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {

    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try{
            System.out.println("Entering Servlet");    
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Loaded");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
            System.out.println("Connection Established");
            Statement st = con.createStatement();
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            
            String sql = "select * from users where uname='"+uname+"' and pass='"+pass+"'";
            System.out.println(sql);
            ResultSet rs = st.executeQuery(sql);
            rs.last();
            if(rs.getRow()==1)
            {
                HttpSession s = request.getSession(true);
                rs.first();
                s.setAttribute("name", rs.getString(9));
                s.setAttribute("uname", uname);
                s.setAttribute("addr", rs.getString(8));
                if(rs.getInt(3)==1)
                {
                    s.setAttribute("type","cust");
                    
                    
                    response.sendRedirect("custhome.jsp");
                }
                else if(rs.getInt(3)==2)
                {
                    s.setAttribute("type", "client");
                    response.sendRedirect("client/clhome.jsp");
                }
            }
            else
            {
                response.sendRedirect("index.html");
            }   
            }
            catch(Exception e){}
    }

    
    

}
