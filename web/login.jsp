<%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2018/12/23 0023
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <%@ include file="head.txt" %>
    <meta charset="GB2312">
    <title>��¼</title>
    <jsp:useBean id="userBean" class="bean.Register" scope="request"/>
    <link rel="stylesheet" type="text/css" href="css/all.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- jQuery�ļ��������bootstrap.min.js ֮ǰ���� -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- ���µ� Bootstrap ���� JavaScript �ļ� -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <%Object bg="1";
        session.setAttribute("bg",bg);
        request.setCharacterEncoding("GB2312");
          String username = "";
          String password = "";
          //��ȡ��ǰվ�������Cookie
          Cookie[] cookies = request.getCookies();
          for (int i = 0; i < cookies.length; i++) {//��cookies�е����ݽ��б������ҵ��û��������������
              if ("username".equals(cookies[i].getName())) {
                         username = cookies[i].getValue();
                     } else if ("password".equals(cookies[i].getName())) {
                         password = cookies[i].getValue();
                     }
           }
         %>
    %>
</head>
<body>
<div class="container" style="position: relative;top: 70px;">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">

                <div class="col-md-8 column">
                    <img src="/images/bg.jpg" height="450px" width="130%">
                </div>
                <div class="col-md-4 column">
                    <div style=" background-color:white;width: fit-content;border-width: 1px;border-style: solid;padding: 25px;border-radius: 10px">
                        <div class="tabbable" id="tabs-977931">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#panel-361431" data-toggle="tab">��¼</a>
                                </li>
                                <li>
                                    <a href="#panel-566482" data-toggle="tab">ע��</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="panel-361431">
                                    <p>
                                        &thinsp;
                                    </p>
                                    <form role="form" method="post" action="loginServlet">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">�û���:</label>
                                            <input required name="logname" class="form-control" id="exampleInputEmail1" type="text" value="<%=username%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">����:</label>
                                            <input required name="password" class="form-control" id="exampleInputPassword1" type="password" value="<%=password%>" />
                                        </div>
                                        <input type="checkbox" value="y" name="isLogin">�Զ���¼<br/>
                                        <button class="btn btn-default" style="position: relative;left: 40%" type="submit">��¼</button>
                                    </form>
                                </div>
                                <div class="tab-pane" id="panel-566482">
                                    <p>
                                        ��ӭ������ʳ���£�
                                    </p>
                                    <form role="form" method="post" action="registerServlet">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">�û���:</label><input required name="logname" class="form-control" type="text" />
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">����:</label><input  required name="password" class="form-control" type="password" />
                                            <input required name="password2" class="form-control"  type="password" />
                                        </div>
                                        <p>
                                            &thinsp;
                                            <jsp:getProperty name="userBean" property="backNews"/>
                                        </p>

                                        <button class="btn btn-default" style="position: relative;left: 40%" type="submit">ע��</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>