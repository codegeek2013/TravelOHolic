package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;

public final class editad_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Edit your content</title>\n");
      out.write("        <link href=\"home.css\" type=\"text/css\" rel=\"stylesheet\" />\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            table, th, td{\n");
      out.write("                border: 1px solid #87ABD8;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveloholic","root","1234");
                    System.out.println("Connection Established in Client");
                    
        
      out.write("\n");
      out.write("        \n");
      out.write("        <div id=\"container\">\n");
      out.write("        <div id=\"banner\">\n");
      out.write("            <img src=\"title.jpg\" />\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div id=\"menu\">\n");
      out.write("            <center>\n");
      out.write("            <a href=\"clhome.jsp\">Home</a>\n");
      out.write("            <a href=\"edit.jsp\">Edit</a>\n");
      out.write("            <a href=\"vhist.jsp\">View Booking</a>\n");
      out.write("            </center>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("            <div id=\"pbody\">\n");
      out.write("                <div id=\"leftpart\">\n");
      out.write("        ");

            
            
            
            if(request.getParameter("id")!=null && request.getParameter("mode")!=null && request.getParameter("mode").toString().equals("client"))
            {
                Statement st = con.createStatement();
                int id = Integer.parseInt(request.getParameter("id").toString());
                    String sql = "select * from client where cid="+id;
                    System.out.println(sql);
                    ResultSet rs = st.executeQuery(sql);
                    rs.last();
                    int count = rs.getRow();
                    if(count==0)
                        out.print("<font color='red'>No Such Client Exists</font>");
                    else
                    {
                        rs.first();
                        out.print("<form method='GET' action='updatecli'>");
                        out.print("<input type='text' name='id' hidden value='"+id+"' />");
                        out.print("<table>");
                            out.print("<tr><td>Id</td><td>Name</td><td>User Name</td><td>Address</td><td>Email</td><td>Phone</td></tr>");
              
                            out.print("<tr>");
                            out.print("<td><font color='#375C89'>"+rs.getInt(1)+"</font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='fname' value='"+rs.getString(2)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='uname' value='"+rs.getString(3)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='addr' value='"+rs.getString(4)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='mail' value='"+rs.getString(4)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='ph' value='"+rs.getString(4)+"' /></font></td>");
                            out.print("</tr>");
                        out.print("</table>");    
                        out.print("<input type='submit' value='UPDATE' />");
                        out.print("</form>");
                    }
                    
                }
                
                else if(request.getParameter("mode")!=null && request.getParameter("mode").toString().equals("user") && request.getParameter("uname")!=null)
                {
                    String sql = "select * from users where uname='"+request.getParameter("uname").toString()+"'";
                    System.out.println(sql);
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    rs.last();
                    int count = rs.getRow();
                    if(count==0)
                        out.print("<font color='red'>No such User</font>");
                    else
                    {
                        rs.first();
                        out.print("<form method='GET' action='updateuser'>");
                        
                        out.print("<table>");
                            out.print("<tr><td>Name</td><td>User Name</td><td>Address</td><td>Email</td><td>Phone</td></tr>");
              
                            out.print("<tr>");
                            
                            out.print("<td><font color='#0011ff'><input type='text' name='fname' value='"+rs.getString(9)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='uname' value='"+rs.getString(1)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='addr' value='"+rs.getString(8)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='mail' value='"+rs.getString(6)+"' /></font></td>");
                            out.print("<td><font color='#0011ff'><input type='text' name='ph' value='"+rs.getString(5)+"' /></font></td>");
                            out.print("</tr>");
                        out.print("</table>");    
                        out.print("<input type='submit' value='UPDATE' />");
                        out.print("</form>");
                    }
                    
                }
            
            }
        
        
      out.write("\n");
      out.write("        </div>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <div id=\"rightpart\">\n");
      out.write("                    ");

                        out.print("<right>");
                        try{
                                                
                        out.print("<font color='#375C89'>"+session.getAttribute("uname").toString()+"</font><br/><br/>");
                        out.print("</right>");
                        java.util.Date d = new Date();
                        
                        out.print("<font color='#375C89'>"+d.toString()+"</font>");
                        }catch(Exception ex){response.sendRedirect("../");}
                    
      out.write("\n");
      out.write("                    <a href=\"logout.jsp\" class=\"ab\">LOGOUT</a>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
