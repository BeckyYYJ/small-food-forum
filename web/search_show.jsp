<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2018/12/25 0025
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <meta charset="GB2312">
    <%@ include file="head.txt" %>
    <title>搜索结果</title>
    <% request.setCharacterEncoding("GB2312");%>
</head>
<body>

<table class="table table-hover">
    <thead>
    <tr>
        <th>
            标题
        </th>
        <th>
            发表人
        </th>
        <th>
            板块
        </th>
        <th>
            备注
        </th>
    </tr>
    </thead>
    <tbody>
    <%ResultSet rs =(ResultSet) request.getAttribute("result");
        if(rs!=null)
        { if(!rs.next())
        {
    %>
    <tr>
        <td>
           sorry
        </td>
        <td>
            没有搜到
        </td>
        <td>
            相关贴子
        </td>
        <td>
            请更换搜索词
        </td>
    </tr>
    <%}
    else
    do{%>
    <tr>
        <td>
            <%=rs.getString("ltitle")%>
        </td>
        <td>
            <%=rs.getString("lz")%>
        </td>
        <td>
            <%=rs.getInt("place")%>
        </td>
        <td>
            <%=rs.getString("state")%>
        </td>
    </tr>

    <%}while (rs.next());
    }%>
    </tbody>
</table>
</body>
</html>
