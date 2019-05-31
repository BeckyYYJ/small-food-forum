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

public class HandleLogin extends HttpServlet{
    Connection con;DataSource ds;
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{ Context initCtx=new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds =(DataSource)ctx.lookup("jdbc/mydb");
            con=ds.getConnection();
        }
        catch(Exception e){}
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        request.setCharacterEncoding("GB2312");
        Statement sql; Statement sql2;
        String logname=request.getParameter("logname").trim(),
                password=request.getParameter("password").trim();
        boolean boo=(logname.length()>0)&&(password.length()>0);
        try{

            String condition="select * from user where uname = '"+logname+
                    "' and pw ='"+password+"'";
            String condition2=" select count(ltitle) from lou where lz='"+logname+ "' group by lz ;";
            String condition3=" select count(*) from tie where uname='"+logname+ "' group by uname ;";
            sql=con.createStatement();
            if(boo){
                ResultSet rs=sql.executeQuery(condition);
                boolean m=rs.next();
                System.out.print(password+logname);
                if(m==true){
                    int id=rs.getInt(1);
                    int score=rs.getInt(4);
                    String im=rs.getString(5);
                    Date date=rs.getDate(6);


                    //第二次查询
                    rs=sql.executeQuery(condition2);int lnum=0;
                    if(rs.next())
                        lnum=rs.getInt(1);


                    //第三次查询
                    rs=sql.executeQuery(condition3); int tnum=0;
                    if(rs.next())
                        rs.getInt(1);
                    sql.close();
                    System.out.print("2");
                    String flag=request.getParameter("isLogin");
                    if ("y".equals(flag)) {

                        Cookie nameCookie = new Cookie("username",logname);

                        nameCookie.setMaxAge(60 * 60 * 24 * 3);
                        Cookie pwdCookie = new Cookie("password",password);
                        pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                        response.addCookie(nameCookie);
                        response.addCookie(pwdCookie);
                    }
                    success(request,response,logname,id,score,im,date,lnum,tnum);


                        System.out.print("3");
                }

                else{
                    String backNews="您输入的用户名不存在，或密码不般配";
                    //调用登录失败的方法:
                    fail(request,response,logname,backNews);
                }
            }
            else{
                String backNews="请输入用户名和密码";
                fail(request,response,logname,backNews);
            }

        }
        catch(SQLException exp){
            String backNews="出错了"+exp;
            fail(request,response,logname,backNews);
        }
    }
    public  void  doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        doPost(request,response);
    }
    public void success(HttpServletRequest request,HttpServletResponse response
            ,String logname,int id,int score,String im,Date date,int lnum,int tnum) {
        Login loginBean=null;
        HttpSession session=request.getSession(true);
        try{  loginBean=(Login)session.getAttribute("loginBean");
            if(loginBean==null){
                loginBean=new Login();  //创建新的数据模型
                session.setAttribute("loginBean",loginBean);
                loginBean=(Login)session.getAttribute("loginBean");
            }
            String name =loginBean.getLogname();

                loginBean.setBackNews(logname+"登录成功");
                loginBean.setLogname(logname);
                loginBean.setUid(id);
                loginBean.setScore(score);
                loginBean.setRegisterTime(date);
                loginBean.setLnum(lnum);
                loginBean.setTnum(tnum);
                if(im!=null)
                  loginBean.setimage(im);
            //跳转
            Object i=session.getAttribute("bg");

            if(i.equals("2")){
                RequestDispatcher dispatcher=
                        request.getRequestDispatcher("caipu.jsp");//转发
                dispatcher.forward(request,response);}
            else if (i.equals("1"))
            {
                //RequestDispatcher dispatcher= request.getRequestDispatcher("byPageShow.jsp");//转发
                //   dispatcher.forward(request,response);
                response.sendRedirect("index.jsp");}

            else if (i.equals("4"))
            {
                //RequestDispatcher dispatcher= request.getRequestDispatcher("byPageShow.jsp");//转发
                //   dispatcher.forward(request,response);
                response.sendRedirect("lookShoppingCar.jsp");}
            else if (i.equals("5"))
            {
                //RequestDispatcher dispatcher= request.getRequestDispatcher("byPageShow.jsp");//转发
                //   dispatcher.forward(request,response);
                response.sendRedirect("lookOrderForm.jsp");}

        }
        catch(Exception ee){
            loginBean=new Login();
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackNews(logname+"登录成功");
            loginBean.setLogname(logname);
        }
    }
    public void fail(HttpServletRequest request,HttpServletResponse response
            ,String logname,String backNews) {
        response.setContentType("text/html;charset=GB2312");
        try {
            PrintWriter out=response.getWriter();
            out.println("<html><body>");
            out.println("<h2>"+logname+"登录反馈结果<br>"+backNews+"</h2>") ;
            out.println("<br><a href =index.jsp>主页</a>");
            out.println("</body></html>");
        }
        catch(IOException exp){}
    }
}
