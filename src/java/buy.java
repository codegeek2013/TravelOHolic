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
import java.util.Date;
import java.text.*;
/**
 *
 * @author Typhoon
 */
public class buy extends HttpServlet {

   
    
    
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
            System.out.println("Connection Successfull");
            String sql = "select * from trans";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.last();
            int tid;
            if(rs.getRow()==0)
                tid = 0;
            else
                tid = rs.getInt(1);
            
            out.println("<h1>"+tid+"</h1>");
            
           tid++;
           sql = "insert into trans(tid) values("+tid+")";
           st.executeUpdate(sql);
           
           int hid = Integer.parseInt(request.getParameter("hid"));
           int cid = Integer.parseInt(request.getParameter("cid"));
           String uname = request.getParameter("uname").toString();
           String name = request.getParameter("name");
           java.util.Date dt = new java.util.Date();
           SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd");
           String date = df.format(dt);
           int dbr = Integer.parseInt(request.getParameter("dbr").toString()); //double bed rooms
           int dos = Integer.parseInt(request.getParameter("dos").toString());
           String doj = request.getParameter("doj").toString();
           int sbr = Integer.parseInt(request.getParameter("sbr").toString());//single bed room
           
           
           
           sql = "select * from stock_h where hid="+hid;
           System.out.println(sql);
           rs = st.executeQuery(sql);
           rs.last();
           double hcost = rs.getDouble(3);
           int clid = rs.getInt(2);
           double acc = rs.getDouble(6);
           String item = rs.getInt(2)+"Hotel at"+rs.getString(5);
           double total = ((hcost*sbr)+((acc + hcost)*dbr))*dos;
           double disc = 0.0;
           double gross = total - disc;
           sql = "insert into sales(uname,cid,sdate,tid,name,qty,db,item,rate,dbr,total,disc,gross,doj,dos)"; 
           String val = "'"+uname+"'";
           val = val + ","+clid+",";
           val = val +"'"+date+"',";
           val = val + tid + ",";
           val = val + "'"+name+"',";
           val = val + sbr+",";
           val = val + dbr + ",";
           val = val + "'"+item+"',";
           val = val +hcost+",";
           val = val + acc+",";
           val = val +total+",";
           val = val + disc+",";
           val = val + gross+",'";
           val = val + doj+"',";
           val = val + dos;
           sql = sql + " values("+val+")";
           System.out.println(sql);
           int succ = st.executeUpdate(sql);
           
           
           
           
           
           
           int qtyc = Integer.parseInt(request.getParameter("carq").toString());
           sql = "select * from stock_c where carid="+cid;
           System.out.println(sql);
           rs = st.executeQuery(sql);
           rs.last();
           double ccost = rs.getDouble(3);
           clid = rs.getInt(2);
           item = rs.getString(6);
           total = ccost*qtyc*dos;
           //double disc = 0.0;
           gross = total - disc;
           sql = "insert into sales(uname,cid,sdate,tid,name,qty,item,rate,total,disc,gross,doj,dos)"; 
           val = "'"+uname+"'";
           val = val + ","+clid+",";
           val = val +"'"+date+"',";
           val = val + tid + ",";
           val = val + "'"+name+"',";
           val = val + qtyc+",";
           val = val + "'"+item+"',";
           val = val +ccost+",";
           val = val +total+",";
           val = val + disc+",";
           val = val + gross+",'";
           val = val + doj+"',";
           val = val + dos;
           sql = sql + " values("+val+")";
           System.out.println(sql);
           succ = st.executeUpdate(sql);
           
           
           //sql = "insert into sales values";
           
           rs.close();
           st.close();
           con.close();
           response.sendRedirect("bill.jsp?tid="+tid); 
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    
    

}
