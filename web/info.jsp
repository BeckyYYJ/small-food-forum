<%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2018/12/23 0023
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <%@ include file="head.txt" %>
    <title>个人信息</title>
</head>

<body>
        <div style=";height: 350px;width: 900px;left: 13%;position: absolute;top: 120px;background-color: rgba(223,232,227,0.45);padding: 50px">
            <div style="position: relative;left: 80px">
                <img src="<%=loginBean.getImage()%>" alt="头像" height="120px" width="120px" style="float: left"  >
                <div  style="float: left;position: relative;left: 120px;top: -5px" >
                    <p style="font-family: 黑体;font-size: 30px;position: relative;top: -5px;color: #1458b1"><%=loginBean.getLogname()%></p>
                    <p style="font-family: 幼圆" >积分：<%=loginBean.getScore()%>&thinsp;&thinsp;&thinsp;
                        用户组：<%=loginBean.getUserclass()%></p>
                    <%if(loginBean.getUserclass().equals("管理员"))
                    {%><a href="reguser.jsp">进入管理员页面</a>
                      <%}%>
                    <p style="font-family: 幼圆">注册时间：<%=loginBean.getRegisterTime()%>&thinsp; UID：<%=loginBean.getUid()%></p>
                    <p style="font-family: 幼圆">发帖数： <%=loginBean.getLnum()%>&thinsp;&thinsp;&thinsp; 回帖数：<%=loginBean.getTnum()%>&thinsp;&thinsp;&thinsp;</p>

                </div>
                <div style="clear: both;"></div>
                <div  style="position:relative;top: 40px">
                    <form action="photoUpload" method="post" enctype="multipart/form-data">
                        <input type="file" name="upphoto" style="width: 350px;height: 30px;display: inline" >
                        <input type="submit" value="上传" style="width: 80px;height: 30px;position: relative;left: 30px">
                    </form>
                </div>
                <p style="position: relative;top: 30px">修改结果为：<%=request.getAttribute("smartResult")%></p>
                <div style="position:relative;top: 30px">
                    <form action="photoUpload" method="post" enctype="multipart/form-data">
                        <input type="password" name="alterpw" style="width: 347px;height: 25px" >
                        <input type="submit" value="修改密码" style="width: 80px;height: 30px;position: relative;left: 30px">
                    </form>
                </div>

            </div>
        </div>

</body>
</html>
