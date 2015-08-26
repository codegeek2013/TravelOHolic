

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class avlins extends HttpServlet {

    protected String nextDate(String fromDate)
    {
        
      int MILLIS_IN_DAY = 1000 * 60 * 60 * 24;
      
      java.text.SimpleDateFormat dateFormat =  	new java.text.SimpleDateFormat("yyyy-MM-dd");
      java.util.Date dateSelectedFrom = null;
      java.util.Date dateNextDate = null;
      

      // convert date present in the String to java.util.Date.
      try
      {
	  dateSelectedFrom = dateFormat.parse(fromDate);
      }
      catch(Exception e)
      {
	  e.printStackTrace();
      }

      //get the next date in String.
      String nextDate =  dateFormat.format(dateSelectedFrom.getTime() + MILLIS_IN_DAY);

      //get the next date in java.util.Date.
      try
      {
          //dateNextDate = dateFormat.parse(nextDate);
          System.out.println("Next day's date: "+nextDate);
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
       
      return nextDate;
    }

    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int carid = Integer.parseInt(request.getParameter("cid").toString());
        int hotelid = Integer.parseInt(request.getParameter("hid").toString());
        String doj = request.getParameter("doj").toString();
        int dos = Integer.parseInt(request.getParameter("dos").toString());
        String uname = request.getParameter("uname").toString();
        String name = request.getParameter("nm").toString();
        int dbr,sbr;
        if(request.getParameter("dbr")!=null)
        dbr = Integer.parseInt(request.getParameter("dbr").toString());
        else
           dbr = 0;
        
        if(request.getParameter("sbr")!=null)
        sbr = Integer.parseInt(request.getParameter("sbr").toString());
        else
           sbr = 0;
        
        
        int cqty = Integer.parseInt(request.getParameter("cars").toString());
        int fh = 0,fc = 0;
        String loc = request.getParameter("loch").toString();
        try{
        //start connecting
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
        System.out.print("\nConnection Established");
        for(int i=0;i<dos;i++)
        {    
        String sql = "insert into booking_h values('"+doj+"',"+hotelid+","+sbr+","+dbr+","+"'"+name+"')";
        
        String sql1 = "insert into booking_c values('"+doj+"','"+name+"',"+carid+","+cqty+")";
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        
        System.out.println(sql);
        st.executeUpdate(sql);
        System.out.println(sql1);
        st.executeUpdate(sql1);
        //Check if 0
        //System.out.println("Performing Hotel Check");
        
        //System.out.print(a);
        
        String ndoj = nextDate(doj);
        doj = ndoj;
       
        
        
        
        
        //hotel
                
        
        
        
        //car
        
        st.close();
        st1.close();
        
        
        }//for ends
        
        response.sendRedirect("buy?hid="+hotelid+"&cid="+carid+"&uname="+uname+"&doj="+doj+"&dos="+dos+"&sbr="+sbr+"&dbr="+dbr+"&carq="+cqty+"&name="+name);      
        
    }
        
        
        
        catch(Exception e)
        {
            
        }
    }
    
    

    
    

}
