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
    <title>������Ϣ</title>
</head>

<body>
        <div style=";height: 350px;width: 900px;left: 13%;position: absolute;top: 120px;background-color: rgba(223,232,227,0.45);padding: 50px">
            <div style="position: relative;left: 80px">
                <img src="<%=loginBean.getImage()%>" alt="ͷ��" height="120px" width="120px" style="float: left"  >
                <div  style="float: left;position: relative;left: 120px;top: -5px" >
                    <p style="font-family: ����;font-size: 30px;position: relative;top: -5px;color: #1458b1"><%=loginBean.getLogname()%></p>
                    <p style="font-family: ��Բ" >���֣�<%=loginBean.getScore()%>&thinsp;&thinsp;&thinsp;
                        �û��飺<%=loginBean.getUserclass()%></p>
                    <%if(loginBean.getUserclass().equals("����Ա"))
                    {%><a href="reguser.jsp">�������Աҳ��</a>
                      <%}%>
                    <p style="font-family: ��Բ">ע��ʱ�䣺<%=loginBean.getRegisterTime()%>&thinsp; UID��<%=loginBean.getUid()%></p>
                    <p style="font-family: ��Բ">�������� <%=loginBean.getLnum()%>&thinsp;&thinsp;&thinsp; ��������<%=loginBean.getTnum()%>&thinsp;&thinsp;&thinsp;</p>

                </div>
                <div style="clear: both;"></div>
                <div  style="position:relative;top: 40px">
                    <form action="photoUpload" method="post" enctype="multipart/form-data">
                        <input type="file" name="upphoto" style="width: 350px;height: 30px;display: inline" >
                        <input type="submit" value="�ϴ�" style="width: 80px;height: 30px;position: relative;left: 30px">
                    </form>
                </div>
                <p style="position: relative;top: 30px">�޸Ľ��Ϊ��<%=request.getAttribute("smartResult")%></p>
                <div style="position:relative;top: 30px">
                    <form action="photoUpload" method="post" enctype="multipart/form-data">
                        <input type="password" name="alterpw" style="width: 347px;height: 25px" >
                        <input type="submit" value="�޸�����" style="width: 80px;height: 30px;position: relative;left: 30px">
                    </form>
                </div>

            </div>
        </div>

</body>
</html>
