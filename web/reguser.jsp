<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2019/1/8 0008
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>管理论坛</title>
    <%@ include file="head.txt" %>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" href="css/csss.css" />
</head>
<body>
    <%
        Context initCtx=new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds =(DataSource)ctx.lookup("jdbc/mydb");
        Connection con=ds.getConnection();
        Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


    %>
    <form action="" method="post">
        <input name="regu" type="radio" value="0" checked />用户管理
        <input name="regu" type="radio" value="1" />贴子管理
        <button type="submit">提交</button>
        <input type="hidden" value="1" name="page">
    </form>
    <%String s=request.getParameter("regu");String condition="";
        if(s!=null)
        {
            switch (s){
                case("0"):condition="select * from user;";break;
                case("1"):condition="select * from lou;";break;
                case("3"):condition="select * from lou order by place;";
        }
        ResultSet rs=statement.executeQuery(condition);
            rs.last();
            int totaltie=rs.getRow();
            int pagesize=5;int pages;//总页数
            if(totaltie%pagesize==0)
                pages =totaltie/pagesize;
            else
                pages = totaltie/pagesize+1;
            String p=request.getParameter("page");
            if(p==null) p="1";
            Integer currentp=Integer.parseInt(p);
            rs.absolute((currentp-1)*pagesize); %>
    <table class="table">
        <thead>
        <tr>
            <td>

            </td>
            <td>
                楼id
            </td>
            <td>
                楼主
            </td>
            <td>
                标题
            </td>

            <td>
                <form action="" method="post">
                    <button id="bk">板块</button>
                    <input type="hidden" value="3" name="regu">
                </form>
            </td>
            <td>
                最后回贴时间
            </td>
            <td>
                总楼层数
            </td>
        </tr>
    </thead>
        <tbody>
            <%for(int i=1;i<=pagesize&&rs.next();i++){
%>


        <form method="post" action="deleteServlet">
    <tr>
        <td>
            <input type="checkbox" name="lou" value="<%=rs.getInt(1)%>">
        </td>
        <td>
            <%=rs.getInt(1)%>
        </td>
        <td>
            <%=rs.getString(2)%>
        </td>
        <td>
            <%=rs.getString(3)%>
        </td>
        <%if(s.equals("0")){%>
        <td>
            <%=rs.getInt(4)%>
        </td>
        <td>
            <%=rs.getDate(6)%>
        </td>
    </tr>

    <%}else if(s.equals("1")){%>
            <td>
                <%=rs.getInt(4)%>
            </td>
        <td>
            <%=rs.getTimestamp(7)%>
        </td>
        <td>
            <%=rs.getInt(8)%>
        </td>
        </tr>
        </tbody>

   <% }
            }
    %>
        <input type="submit" value="删除"></form>

    </table>

    <ul class="pagination" style="width: 90%;position: relative;top: 10px;left: 60%">
        <% String url="reguser.jsp?regu="+s+"&page=";
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
    <%}
    %>
</body>
</html>