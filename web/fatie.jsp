<%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2018/12/24 0024
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>����</title>
    <link rel="stylesheet" type="text/css" href="css/all.css">
    <link rel="stylesheet" type="text/css" href="css/show.css">
    <%@ include file="head.txt" %>
</head>
<body>
<div class="senderbox" >
    <div class="senderbox-top">
        <p style="position: relative;left: 20px;border-style: dotted;border-width: 1px;width:62px">����</p>
    </div>
    <% request.setCharacterEncoding("gb2312");
        if(loginBean.getLogname().equals(""))
    {out.print("<div style=\"width: 700px;height: 300px;background-color: rgba(207,173,120,0.35)\">" +
            "<div class='enterbox'><p style=\"margin:100px;font-size=40px;letter-spacing:10px\">���ȵ�¼</p></div>"+
            "</div>");
    }
    else
    {%>

    <form action="newLou" method="post" enctype="multipart/form-data">
        <input type="file" name="upphoto" >
        <input type="hidden" name="place" value="<%=request.getParameter("place")%>">
        <input name="isphoto" type="radio" value="0" checked />��ͼ����
        <input name="isphoto" type="radio" value="1" />��ͼ����

        <br>����<input type="text" name="tit" required>
        <div class='box' >
        <textarea class='enterbox' name="text"  >
        </textarea>
        </div>
        <div class="senderbox-bottom">
            <input type="submit" value="����" id="fabiao">
        </div>
    </form>
    <%} %>
</div>
</body>
</html>
