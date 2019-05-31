package servlet;

import bean.DataByPage;
import bean.Login;
import com.jspsmart.upload.SmartUpload;

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
import java.sql.Connection;
import java.sql.Statement;

public class HandlePhoto extends HttpServlet {
    Connection con; Statement sql;
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{ Context initCtx=new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds =(DataSource)ctx.lookup("jdbc/mydb");
            con=ds.getConnection();
            sql=con.createStatement();
        }
        catch(Exception e){}
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置上传文件保存路径
        HttpSession session=req.getSession(true);
        Login loginBean=(Login)session.getAttribute("loginBean");
      //DataByPage dataBean =(DataByPage) session.getAttribute("dataBean");
        Object i =session.getAttribute("bg");

        if(loginBean.getLogname()==(null)) resp.sendRedirect("login.jsp");
        String sqls;
        String filePath = "/images";
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdir();
        }
        //实例化上传组件
        SmartUpload su = new SmartUpload();
        //初始化SmartUpload
        su.initialize(getServletConfig(), req, resp);
        //设置上传文件对象10M
        su.setMaxFileSize(1024*1024*10);
        //设置所有文件大小100M
        su.setTotalMaxFileSize(1024*1024*100);
        //设置允许上传文件类型
        su.setAllowedFilesList("txt,jpg,gif,png");
        String result = "上传成功！";

        try {
            //设置禁止上传文件类型
            su.setDeniedFilesList("rar,jsp,js");
            //上传文件
            su.upload();
            String ext = su.getFiles().getFile(0).getFileExt();  //取得文件后缀
            String url=filePath + "/"+loginBean.getLogname()+"tx."+ext;
            String url2=filePath + "/"+loginBean.getLogname()+"tx."+ext;
            //保存文件
            File file2=new File(filePath,loginBean.getLogname()+"tx."+ext);
            if(file2.exists()) file2.delete();
            su.getFiles().getFile(0).saveAs(url);
            loginBean.setimage(url2);
            sqls="update user set image='"+url2+"' where uname='"+loginBean.getLogname()+"'";
            sql.executeUpdate(sqls);
            resp.sendRedirect("info.jsp");
            //req.setAttribute("smartResult", result);
           // req.getRequestDispatcher("info.jsp").forward(req, resp);
        } catch (Exception e) {
            result = "上传失败！";
            e.printStackTrace();
        }

    }
}
