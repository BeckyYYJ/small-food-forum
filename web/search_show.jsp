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
    <title>�������</title>
    <% request.setCharacterEncoding("GB2312");%>
</head>
<body>

<table class="table table-hover">
    <thead>
    <tr>
        <th>
            ����
        </th>
        <th>
            ������
        </th>
        <th>
            ���
        </th>
        <th>
            ��ע
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
            û���ѵ�
        </td>
        <td>
            �������
        </td>
        <td>
            �����������
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
