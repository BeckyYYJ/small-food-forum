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

public class HandleRegister extends HttpServlet {
    Connection con;DataSource ds;
   public void init(ServletConfig config) throws ServletException {
       super.init(config);
       try{ Context initCtx=new InitialContext();
           Context ctx = (Context) initCtx.lookup("java:comp/env");
           ds =(DataSource)ctx.lookup("jdbc/mydb");

       }
       catch(Exception e){}
   }
   public String handleString(String s)
   {   try{ byte bb[]=s.getBytes("iso-8859-1");
            s=new String(bb);
       }
       catch(Exception ee){} 
       return s;  
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{

       String logname=request.getParameter("logname").trim();
       String password=request.getParameter("password").trim();
       String password2=request.getParameter("password2").trim();
       Register userBean=new Register();  //创建的Javabean模型
       request.setAttribute("userBean",userBean);
      if(!password.equals(password2)) {
        userBean.setBackNews("两次密码不同，注册失败，");
        RequestDispatcher dispatcher=
                request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);//转发
        return;
    }
       try{ con=ds.getConnection();
      java.sql.Date date= new java.sql.Date(new java.util.Date().getTime());
      Statement sql2 = con.createStatement();
      ResultSet resultSet = sql2.executeQuery("select max(id) from user;");
      resultSet.next();
      int id = resultSet.getInt(1) + 1;
          boolean isLD=true;
          for(int i=0;i<logname.length();i++){
              char c=logname.charAt(i);
              if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
                  isLD=false;
          }
          System.out.print("1");
          boolean boo=logname.length()>0&&password.length()>0&&isLD;
          String backNews="";
           String insertCondition = "INSERT INTO user VALUES (?,?,?,0,'/images/timg.jpg',?)";
           PreparedStatement sql = con.prepareStatement(insertCondition);
           sql.setInt(1, id);
           sql.setString(2, handleString(logname));
           sql.setString(3, handleString(password));
           sql.setDate(4, date);

           System.out.print("2");
           int m = sql.executeUpdate();

           System.out.print("3");
                  if(m!=0){
                      backNews="注册成功";
                      userBean.setBackNews(backNews);
                      userBean.setLogname(logname);
                  }

              else {
                  backNews="信息填写不完整或名字中有非法字符";
                  userBean.setBackNews(backNews);
              }
           con.close();
          }
          catch(SQLException exp){
              userBean.setBackNews("该会员名已被使用，请您更换名字"+exp);
          }
          RequestDispatcher dispatcher=
                  request.getRequestDispatcher("login.jsp");
          dispatcher.forward(request, response);//转发
      }
       public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
           doPost(request,response);
       }
   }
