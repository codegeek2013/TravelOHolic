/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author Typhoon
 */
public class register extends HttpServlet {

   
    
    
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
            String uname = request.getParameter("uname").toString();
            String pass = request.getParameter("pass").toString();
            String name = request.getParameter("name").toString();
            String mail = request.getParameter("mail").toString();
            String ph = request.getParameter("ph").toString();
            String add = request.getParameter("add").toString();
            
            String sql = "insert into users values('"+uname+"','"+pass+"',1,'No Remarks','"+ph+"','"+mail+"',1,'"+add+"','"+name+"')";
            System.out.println(sql);
            
            Statement st  = con.createStatement();
            int succ = st.executeUpdate(sql);
            if(succ==0)
            {
               response.sendRedirect("register.jsp?action=error");
            }
            else{
                response.sendRedirect("register.jsp?action=success");
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    
    

}
