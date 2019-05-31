<%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2018/12/22 0022
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@ page import="bean.DataByPage" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import= "javax.naming.* "%>
<%@ page import= "javax.sql.DataSource "%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <%@ include file="head.txt" %>
    <link rel="stylesheet" type="text/css" href="css/all.css">
    <link rel="stylesheet" type="text/css" href="css/caipu.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>菜谱</title>

</head>
<body>
<%Object bg="2";
    session.setAttribute("bg",bg);
    request.setCharacterEncoding("GB2312");
    String place=request.getParameter("place");
    if(place==null) response.sendRedirect("index.jsp");
%>
<div style="width: 85%;position: relative;top: 80px;left: 8%">
    <div class="col-md-12 column" >
        <ul class="breadcrumb">
            <li>
                <a href="index.jsp">主页</a>
            </li>
            <li class="active">
                菜谱
            </li>
            <li class="active">
                中式料理
            </li>
            <li class="active">
                图文
            </li>
        </ul>
    </div>
    <div class="jumbotron" style="width: 95%;position: relative;top:39px;left: 2.5%">
        <h2>
            请大家遵守发帖回帖规则，爱护论坛！
        </h2>
        <p>
        </p>
        <p>
            <a class="btn btn-primary btn-large" href="fatie.jsp?place=<%=place%>">我要发帖</a>
        </p>
    </div>
<%
    Context initCtx=new InitialContext();
    Context ctx = (Context) initCtx.lookup("java:comp/env");
    DataSource ds =(DataSource)ctx.lookup("jdbc/mydb");
    Connection conn = ds.getConnection();
    Statement sql =conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    String s="select * from lou where place="+place+" order by finalT desc";
    Statement sql2=conn.createStatement();
    String s2="select * from lou where place=000";
    ResultSet fixtie=sql2.executeQuery(s2);
    ResultSet rs=sql.executeQuery(s);
    rs.last();
    int totaltie=rs.getRow();
    int pagesize=5;int pages;//总页数
    if(totaltie%pagesize==0)
        pages =totaltie/pagesize;
    else
        pages = totaltie/pagesize+1;
    String p=request.getParameter("page");
    if(p==null) p="1";
    Integer currentp=Integer.parseInt(request.getParameter("page"));
    rs.absolute((currentp-1)*pagesize);%>


    <div class="list-group" style="width: 95%;position: relative;top: 20px;left: 2.5%">
        <a class="list-group-item active" href="#">主页</a>
        <%while(fixtie.next())
            out.print("<div style=\"background-color: rgba(204,232,255,0.20)\" class=\"list-group-item\"><a style=\"color: red\" href=show.jsp?id=" + fixtie.getInt(1) + ">" + fixtie.getString(3) + "</a></div>");%>
        <%for(int i=1;i<=pagesize&&rs.next();i++){
            out.print("<div class=\"list-group-item\"><a href=show.jsp?curPage=1&id=" + rs.getInt(1) + ">" + rs.getString(3) + "</a>");
        %><img src="images/hot.png" height="20px" width="20px" >
        <span class="badge"><a  style="color: white" href="home.jsp?user=<%=rs.getString(2)%>"><%=rs.getString(2)%></a></span>
       <span class="badge"><% SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str = df.format(rs.getTimestamp("finalT"));
       %><%=str%>
       </span>
        <%if(rs.getInt("state")==1){%> <span class="badge" style="background-color: #cc0000">精</span><%}%></div>
    <%}%>
     <a class="list-group-item active"> <span class="badge"><%=totaltie%></span> Help</a>
    </div>

    <%  rs.close();
        fixtie.close();
        sql.close();
        conn.close();
        //ctx.close();%>
    <ul class="pagination" style="width: 90%;position: relative;top: 10px;left: 60%">
        <% String url="caipu.jsp?place="+place+"&page=";
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
</div>
</body>
</html>
