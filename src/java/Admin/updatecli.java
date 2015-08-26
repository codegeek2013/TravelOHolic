package Admin;

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
public class updatecli extends HttpServlet {

   
    
    
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
            Statement st = con.createStatement();
            System.out.println("Inside Client Update");
            int id = Integer.parseInt(request.getParameter("id").toString());
            String fname = request.getParameter("fname").toString();
            String uname = request.getParameter("uname").toString();
            String addr = request.getParameter("addr").toString();
            String mail = request.getParameter("mail").toString();
            String ph = request.getParameter("ph").toString();
           String sql = "update client set cname='"+fname+"',uname='"+uname+"',addr='"+addr+"',email='"+mail+"',phone='"+ph+"' where cid="+id;         
           System.out.println(sql);
           st.executeUpdate(sql);
           
            st.close();
            con.close();
            response.sendRedirect("admin.jsp");
        }
        catch(Exception e)
        {
            out.print("Error occured");
        }
    }

    
    

}
