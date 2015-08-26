

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
public class update2 extends HttpServlet {

   
    
    
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
            Statement st = con.createStatement();
            String type = request.getParameter("type").toString();
            int id = Integer.parseInt(request.getParameter("id").toString());
            if(type.equals("hotel"))
            {
                int sbqty = Integer.parseInt(request.getParameter("sbqty").toString());
                int dbqty = Integer.parseInt(request.getParameter("dbqty").toString());
                double sbr = Double.parseDouble(request.getParameter("sbr").toString());
                double dbr = Double.parseDouble(request.getParameter("dbr").toString());
                String sql = "update stock_h set rate="+sbr+", qty="+sbqty+", dbqty="+dbqty+", dbrate="+dbr+" where hid="+id;
                System.out.println(sql);
                st.executeUpdate(sql);
            }
            else if(type.equals("car"))
            {
                int qty = Integer.parseInt(request.getParameter("qty").toString());
                
                double rate = Double.parseDouble(request.getParameter("rate").toString());
                String sql = "update stock_c set qty="+qty+", rate="+rate+" where carid="+id;
                System.out.println(sql);
                st.executeUpdate(sql);
            }
            st.close();
            con.close();
            response.sendRedirect("clhome.jsp");
        }
        catch(Exception e)
        {
            e.printStackTrace();
            out.print("Error occured");
        }
    }

    
    

}
