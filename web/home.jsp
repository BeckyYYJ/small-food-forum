<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2019/1/10 0010
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>个人空间</title>
    <%@ include file="head.txt" %>

    <link rel="stylesheet" type="text/css" href="css/index.css">
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/csss.css" />
</head>
<body>

<%  try{
    Context initCtx=new InitialContext();
    Context ctx = (Context) initCtx.lookup("java:comp/env");
    DataSource ds =(DataSource)ctx.lookup("jdbc/mydb");
    Connection con=ds.getConnection();
    Statement statement=con.createStatement();
    String uname=request.getParameter("user");
    if(uname==null)
        response.sendRedirect("index.jsp");
    ResultSet rs=statement.executeQuery("select * from user where uname='"+uname+"';");
    rs.next();

%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <%=rs.getString("uname")%>
                    <small><%=toClass(rs.getInt("score"),rs.getInt("id"))%></small>
                </h1>
            </div>
            <img class="img-circle" height="150px" width="150px" src="<%=rs.getString("image")%>" />
            <div class="jumbotron">
                <h1>
                    i love the world!
                </h1>
                <p>
                    My life didn't please me, so I created my life.
                </p>
                <p>
                    <a class="btn btn-primary btn-large" href="#">发送好友申请</a>
                    <a class="btn btn-primary btn-large" href="#">发送消息</a>
                </p>
            </div>
        </div>
    </div>
</div>
<%statement.close();
    con.close();
}catch (SQLException e)
{

}%>
</body>
</html>
<%!
 String toClass(int score,int uid){

     if(uid==1||uid==2) return "管理员";
         if (score>=100) return "米其林特级";
         if (score>=50) return"中华小当家";
         if(score>=25) return"大厨";
         if(score>=10) return"厨房帮工";
         if(score>=3) return"新手学徒";
         return "厨房破坏者";
 }

%>