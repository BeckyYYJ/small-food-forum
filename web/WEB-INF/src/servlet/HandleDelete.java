package servlet;

import bean.Login;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class HandleDelete extends HttpServlet {
    Connection con;
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try{ Context initCtx=new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds =(DataSource)ctx.lookup("jdbc/mydb");
            con=ds.getConnection();

        }
        catch(Exception e){}
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String values[]=req.getParameterValues("lou");

        try {
            PreparedStatement statement=con.prepareStatement("delete from lou where id=?");
            for (int i=0;i<values.length;i++){
                statement.setInt(1,Integer.parseInt(values[i]));
                statement.executeUpdate();
            }
        }catch (SQLException e){}
        resp.setContentType("text/html;charset=GB2312");
            PrintWriter out=resp.getWriter();
            out.println("<html><body>");
            out.println("<h1>删除成功</h1>") ;
            out.println("<br><a href =index.jsp>返回主页</a>");
            out.println("</body></html>");
    }
}