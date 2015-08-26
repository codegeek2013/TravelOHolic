

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class adlogin extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
            
            String sql = "select * from admin where uname='"+uname+"' and apass='"+pass+"'";
            System.out.println(sql);
            ResultSet rs = st.executeQuery(sql);
            rs.last();
            if(rs.getRow()==1)
            {
                HttpSession s = request.getSession(true);
                rs.first();
                s.setAttribute("uname", uname);
                s.setAttribute("type","admin");
                response.sendRedirect("Admin/admin.jsp");
                   
            }
            else
            {
                response.sendRedirect("Admin/login.jsp?res=0");
            }   
            }
            catch(Exception e){}
    }

    
    

}
