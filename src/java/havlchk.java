

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class havlchk extends HttpServlet {

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
        int carid = Integer.parseInt(request.getParameter("car").toString());
        int hotelid = Integer.parseInt(request.getParameter("hotel").toString());
        String doj = request.getParameter("doj").toString();
        int dos = Integer.parseInt(request.getParameter("dos").toString());
        int fh = 0,fc = 0;
        String loc = request.getParameter("loch").toString();
        try{
        //start checking
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
        System.out.println("\nConnection Established");
        for(int i=0;i<dos;i++)
        {    
        String sql = "select * from booking_h where hotelid="+hotelid+" and date='"+doj+"'";
        String sql1 = "select * from booking_c where carid="+carid+" and date='"+doj+"'";
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        //System.out.println(sql);
        System.out.println(sql);
        ResultSet rs = st1.executeQuery(sql);
        //System.out.println("RESULT 1");
        ResultSet rs1 = st.executeQuery(sql1);
        //System.out.println("RESULT 2");
        int sbr = 0;
        int dbr = 0;
        int car = 0;
        //Check if 0
        //System.out.println("Performing Hotel Check");
        
        //System.out.print(a);
        if(rs.last())
        {
        System.out.println("LOOP");
        rs.first();
        
        System.out.println(sql);
        //Hotel Check
        sbr = rs.getInt(3);
        dbr = rs.getInt(4);
        while(rs.next())
        {
            sbr = sbr + rs.getInt(3);
            dbr = dbr + rs.getInt(4);
        }
        }
        
        System.out.println("Value of sbr = "+sbr);
        
        if(rs1.last())
        {
        System.out.println("LOOPING");    
        rs1.first();
        //car check
        car = rs1.getInt(4);
        while(rs1.next())
        {
            car  = car + rs1.getInt(4);
        }
        }
        
        
        //hotel
        sql = "select * from stock_h where hid="+hotelid;
        System.out.println(sql);
        rs = st.executeQuery(sql);
        rs.first();
        int dbavail = rs.getInt(7) - dbr;
        int sbavail = rs.getInt(4) - sbr;
        System.out.println("DBAVAIL    "+dbavail);
        if((dbavail < 3) || (sbavail < 3) )
           break;
        else
            fh++;
        
        
        
        
        //car
        sql1 = "select * from stock_c where carid="+carid;
        System.out.println(sql1);
        rs1 = st.executeQuery(sql1);
        rs1.first();
        int cavail = rs1.getInt(4) - car;
        
        if(cavail <= 0 )
            break;
        else
            fc++;
        
        //increament doj
        String ndoj = nextDate(doj);
        doj = ndoj;
        
        rs.close();
        rs1.close();
        st.close();
        st1.close();
        
        
        }//for ends
        
        
        //out.print("Hotel Avaibility = "+fh);
        //out.print("Car Avaibility = "+fc);
        doj = request.getParameter("doj").toString();
        if(fh==dos && fc==dos)
            response.sendRedirect("buyfinal.jsp?avl=1&loc="+loc+"&hid="+hotelid+"&cid="+carid+"&doj="+doj+"&dos="+dos);
        else if(fh < dos && fc < dos)
            response.sendRedirect("buy.jsp?avl=2&fc="+fc+"&fh="+fh+"&loc="+loc);

    }
        
        
        
        catch(Exception e)
        {
            
        }
    }
    
    

    
    

}
