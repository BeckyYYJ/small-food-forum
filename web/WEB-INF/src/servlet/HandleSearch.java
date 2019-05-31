package servlet;
import bean.*;
import java.sql.*;
import java.io.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.util.*;
import java.util.Date;

public class HandleSearch extends HttpServlet{
    Connection con;
    DataSource ds;
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{ Context initCtx=new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
             ds =(DataSource)ctx.lookup("jdbc/mydb");

        }
        catch(Exception e){}
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        request.setCharacterEncoding("GB2312");
        Statement sql; Statement sql2;
        String s=request.getParameter("search").trim();
        if(s.equals("搜索贴子(单词使用空格隔开)")) {response.sendRedirect("index.jsp");return;}
        String[] stringList=s.split(" ");String condition="select * from lou where ltitle regexp '^";
        for(String l:stringList)
            condition=condition+"(?=.*?("+l+"))";
        condition=condition+"';";System.out.println("test: "+condition);
        try{
            con=ds.getConnection();
        //    String condition="select * from user where uname = '"+logname+
              //      "' and pw ='"+password+"'";
          //  String condition2=" select count(ltitle) from lou where lz='"+logname+ "' group by lz ;";
            //String condition3=" select count(*) from tie where uname='"+logname+ "' group by uname ;";
            sql=con.createStatement();
            ResultSet rs=sql.executeQuery(condition);
            request.setAttribute("result",rs);
            RequestDispatcher dispatcher= request.getRequestDispatcher("search_show.jsp");//转发
            dispatcher.forward(request,response);


        }
        catch(SQLException exp){
            String backNews="出错了"+exp;
            System.out.println(backNews);
        }
    }
    public  void  doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        doPost(request,response);
    }

}
