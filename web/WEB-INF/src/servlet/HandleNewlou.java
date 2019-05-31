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
import java.sql.*;
import java.util.Date;

public class HandleNewlou extends HttpServlet {
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
            String place=su.getRequest().getParameter("place");
            String text=su.getRequest().getParameter("text");
            String tit=su.getRequest().getParameter("tit");
            String img=su.getRequest().getParameter("isphoto");
            System.out.println(img);
            PreparedStatement insert =con.prepareStatement("insert into lou values(?,?,?,?,1,0,sysdate(),1)");
            sqls=" select max(id) from lou";
            ResultSet rs=sql.executeQuery(sqls);
            java.sql.Date date=new java.sql.Date(new Date().getTime());
            rs.next();int id=rs.getInt(1)+1;
            insert.setInt(1,id);
            insert.setString(2,loginBean.getLogname());
            insert.setString(3,tit);
            insert.setString(4,place);
            insert.executeUpdate();//插入楼表完成

            //保存图片
            String url;
            if(Integer.parseInt(img)==1){
                String ext = su.getFiles().getFile(0).getFileExt();  //取得文件后缀
                url=filePath + "/"+loginBean.getLogname()+place+id+"."+ext;
                //保存文件
                su.getFiles().getFile(0).saveAs(url);
                sqls="insert into  tie values("+id+","+1+",'"+loginBean.getLogname()+"','"+text+"','"+url+"',sysdate());";}
            else
                sqls="insert into  tie values("+id+","+1+",'"+loginBean.getLogname()+"','"+text+"',null,sysdate());";

            System.out.println(sqls);
            sql.executeUpdate(sqls); loginBean.setLnum(loginBean.getLnum()+1);
            if(loginBean.getScore()!=-1){
            loginBean.setScore(loginBean.getScore()+1);
            sqls="update user set score=score+1 where uname='"+loginBean.getLogname()+"';";
            sql.executeUpdate(sqls);
            }
            resp.sendRedirect("caipu.jsp?place="+place+"&page=1");
            //req.setAttribute("smartResult", result);
            // req.getRequestDispatcher("info.jsp").forward(req, resp);
        } catch (Exception e) {
            result = "上传失败！";
            e.printStackTrace();
        }

    }
}

