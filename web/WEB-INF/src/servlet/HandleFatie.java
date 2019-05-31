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
import java.io.PrintWriter;
import java.sql.*;

public class HandleFatie extends HttpServlet {
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
        //�����ϴ��ļ�����·��
        resp.setContentType("text/html;charset=gb2312");
        PrintWriter out = resp.getWriter();
        HttpSession session=req.getSession(true);
        Login loginBean=(Login)session.getAttribute("loginBean");
        //DataByPage dataBean =(DataByPage) session.getAttribute("dataBean");
        String sqls;
        String filePath = "/images";
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdir();
        }
        //ʵ�����ϴ����
        SmartUpload su = new SmartUpload();
        //��ʼ��SmartUpload
        su.initialize(getServletConfig(), req, resp);
        //�����ϴ��ļ�����10M
        su.setMaxFileSize(1024*1024*10);
        //���������ļ���С100M
        su.setTotalMaxFileSize(1024*1024*100);
        //���������ϴ��ļ�����
        su.setAllowedFilesList("txt,jpg,gif,png");
        String result = "�ϴ��ɹ���";

        try {
            //���ý�ֹ�ϴ��ļ�����
            su.setDeniedFilesList("rar,jsp,js");
            //�ϴ��ļ�
            su.upload();
            String lid=su.getRequest().getParameter("id");
            String text=su.getRequest().getParameter("text");
            String img=su.getRequest().getParameter("isphoto");
            System.out.println(img);
            sqls=" select max(num) from tie where id="+lid;System.out.println(sqls);
            ResultSet rs=sql.executeQuery(sqls);
            rs.next();int num=rs.getInt(1)+1;
            String url;
            if(Integer.parseInt(img)==1){
            String ext = su.getFiles().getFile(0).getFileExt();  //ȡ���ļ���׺
            url=filePath + "/"+loginBean.getLogname()+lid+num+"."+ext;
            //�����ļ�
            su.getFiles().getFile(0).saveAs(url);

            sqls="insert into  tie values("+lid+","+num+",'"+loginBean.getLogname()+"','"+text+"','"+url+"',sysdate())";}
            else
            sqls="insert into  tie values("+lid+","+num+",'"+loginBean.getLogname()+"','"+text+"',null,sysdate());";

            System.out.println(sqls);
            sql.executeUpdate(sqls);
            sql.executeUpdate("update lou set finalT=sysdate(),totallTie=totallTie+1 where id="+lid);
            rs=sql.executeQuery("select * from lou where id="+lid);
            rs.next();
            String lz= rs.getString("lz");
            sql.executeUpdate("insert into mesBox values(0,'"+lz+"','admin',0,sysdate(),'"
                    +loginBean.getLogname()+"�����¥"+rs.getString("ltitle")+"�лظ�����',"+lid+");");
            loginBean.setLnum(loginBean.getTnum()+1);
            if(loginBean.getScore()!=-1){
                loginBean.setScore(loginBean.getScore()+1);
                sqls="update user set score=score+1 where uname='"+loginBean.getLogname()+"';";
                sql.executeUpdate(sqls);
            }
            out.print("<head><meta http-equiv=��refresh�� content=�売; URL=/index.jsp��></head>");
            out.print("<p style=\"position: relative;left: 50%\">����ɹ�</p>");
            out.print("<p style=\"position: relative;left: 50%\">2s���Զ�ת�ظղŽ���</p>");
            //req.setAttribute("smartResult", result);
            // req.getRequestDispatcher("info.jsp").forward(req, resp);
        } catch (Exception e) {
            result = "�ϴ�ʧ�ܣ�";
            e.printStackTrace();

            out.println("������δ֪�Ĵ�������ϵ����Ա");

        }

    }
}
