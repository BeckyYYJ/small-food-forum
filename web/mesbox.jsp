<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="bean.Login" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2019/1/10 0010
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>消息</title>
    <%@ include file="head.txt" %>
    <link rel="stylesheet" type="text/css" href="css/all.css">
    <link rel="stylesheet" type="text/css" href="css/caipu.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

</head>
<body>

<%
    request.setCharacterEncoding("gb2312");
    Context initCtx=new InitialContext();
    Context ctx = (Context) initCtx.lookup("java:comp/env");
    DataSource ds =(DataSource)ctx.lookup("jdbc/mydb");
    Connection conn = ds.getConnection();
    Statement sql =conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=sql.executeQuery("select * from mesBox where rer ='"+loginBean.getLogname()+"' order by t desc;");
    rs.last();
    int totaltie=rs.getRow();
    int pagesize=5;int pages;//总页数
    if(totaltie%pagesize==0)
        pages =totaltie/pagesize;
    else
        pages = totaltie/pagesize+1;
    String s=request.getParameter("page");
    if(s==null)
        s="1";
    Integer currentp=Integer.parseInt(s);
    rs.absolute((currentp-1)*pagesize);

%>

<div class="list-group" style="width: 95%;position: relative;top: 20px;left: 2.5%">
    <a class="list-group-item active" href="#">你有<%=totaltie%>个消息</a>
    <%
    for(int i=1;i<=pagesize&&rs.next();i++){
        if(rs.getInt("class")==0){
    %>
    <div class="list-group-item">
        <h4 class="list-group-item-heading">
           管理员
        </h4>
        <h5>
            <%SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String str = df.format(rs.getTimestamp("t"));
                out.print(str);%>
        </h5>
        <a class="list-group-item-text" href="show.jsp?curPage=1&id=<%=rs.getInt("lid")%>">
            <%if(rs.getInt("state")==0){%>
            <b> <%=rs.getString("text")%> </b>
            <%}else{%>
                <%=rs.getString("text")%>
            <%}%>
        </a>
    </div>
   <%}
   else if(rs.getInt("class")==1){%>
    <div class="list-group-item">
        <h4 class="list-group-item-heading">
            <%=rs.getString("ser")%>
        </h4>
        <h5>
            <%SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              String str = df.format(rs.getTimestamp("t"));
              out.print(str);%>
        </h5>
        <p class="list-group-item-text">
            <%if(rs.getInt("state")==0){%>
            <b> <%=rs.getString("text")%> </b>
            <%}else{%>
            <%=rs.getString("text")%>
            <%}%>
        </p>
    </div>
      <% }else{%>
    <div class="list-group-item">
        <h4 class="list-group-item-heading">
            管理员
        </h4>
        <h5>
            <%SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String str = df.format(rs.getTimestamp("t"));
                out.print(str);%>
        </h5>
        <p class="list-group-item-text" style="color: #8c8c8c">
            <%if(rs.getInt("state")==0){%>
            <b> <%=rs.getString("text")%> </b>
            <%}else{%>
            <%=rs.getString("text")%>
            <%}%>
        </p>
    </div>
<%    }}%>
</div>
<%
    // Enumeration a=request.getParameterNames();
    //while(a.hasMoreElements()){
    //  String s=(String)a.nextElement();
    //out.print(s);
    //}
    rs.close();
    sql.close();
    conn.close();//}
    // catch(Exception ex)
    //{response.sendRedirect("index.jsp");}
%>
<ul class="pagination" style="width: 90%;position: relative;top: 10px;left: 60%">
    <% String url="mesbox.jsp?page=";
        if (currentp!=1){
    %>

    <li>
        <a href="<%=url+(currentp-1)%>">Prev</a>
    </li>

    <%}
        for(int i=currentp;i<=pages&&i<=2+currentp;i++){
    %>
    <li>
        <a href=<%=url+i%>><%=i%></a>
    </li>
    <%}
        if (currentp!=pages){%>
    <li>
        <a href="<%=url+(currentp+1)%>">Next</a>
    </li>
    <%}
    %>

</ul>
</body>
</html>
