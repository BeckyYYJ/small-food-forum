<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 10984
  Date: 2018/12/15 0015
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
  <head>
      <%@ include file="head.txt" %>
    <title>��ʳ������ҳ</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
      <meta charset="utf-8">
          <link rel="stylesheet" href="css/csss.css" />
      <%Object bg="1";
        request.setCharacterEncoding("GB2312");
          session.setAttribute("bg",bg);%>
      </head>
  <body>
  <%Date date=new Date();//response.setHeader("refresh","2");
  out.print("�����ǣ� "+date.toString());
  out.print("<br>�鳤����ӱ٥");
  %>
  <div class="main" id="main">
      <div class="menu-box">

      </div>
      <!--��-->
      <div class="sub-menu hide" id="sub-menu">
          <!--�ֻ�-->
          <div class="inner-box ">
              <div class="sub-inner-box">
                  <div class="tittle">���ˣ����������</div>
                  <div class="sub-row">
                      <span class="bold mr10">��ʽ����</span>
                      <a href="caipu.jsp?place=111&page=1" >ͼ��</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=112">��Ƶ</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=113">����</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">������⿣�</span>
                      <a href="caipu.jsp?place=121">ͼ��</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=122">��Ƶ</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=123">����</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">������</span>
                      <a href="caipu.jsp?place=131">����</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=132">����</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=133">��������</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=134">С�ڿ�ζ</a>
                  </div>

              </div>

          </div>
          <!--����-->
          <div class="inner-box">
              <div class="sub-inner-box">
                  <div class="tittle">�����кóԵ�ѽ</div>
                  <div class="sub-row">
                      <span class="bold mr10">�����Ƽ�</span>
                      <a href="#">�ҳ���</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">�տ����������</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">�պ���</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">������ı����</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">����</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">��ʳ�Ƽ�</span>
                      <a href="#">������ʳ</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">����</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">ŷ����</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">����</a>
                  </div>
              </div>

          </div>
          <!--����-->
          <div class="inner-box">
              <div class="sub-inner-box">
                  <div class="tittle">������</div>
                  <div class="sub-row">
                      <span class="bold mr10">����է��</span>
                      <a href="#">�³������֤</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">���ﻥ��</span>
                      <a href="#">�ҳ���</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">������</a>

                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">�׼�����</span>
                      <a href="#">��ʦ��</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">��ͽ��</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">������</a>
                  </div>

              </div>

          </div>
          <!--�Ҿ�-->
          <div class="inner-box">
              <div class="sub-inner-box">
                  <div class="tittle">�õĹ��߿����°빦��</div>
                  <div class="sub-row">
                      <span class="bold mr10">���߲���</span>
                      <a href="#">��~һ������</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">΢��¯�����������</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">��~һ�Ѻõ�������</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">ʳ�Ĳ���</span>
                      <a href="#">����~�ɸ���Ϊ����֮��</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">�߲�ˮ��</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">ˮ��</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">����</a>
                  </div>
              </div>

          </div>

      </div>

      <!--��-->
      <div class="menu-contern" id="menu-contern">
          <div class="menu-item">
              <a href="">
                  <span>����</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
          <div class="menu-item">
              <a href="">
                  <span>��ʳ�Ƽ�</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
          <div class="menu-item">
              <a href="">
                  <span>����</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
          <div class="menu-item">
              <a href="">
                  <span>����</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
      </div>

      <!--ͼƬ�ֲ�-->
      <div class="banner" id="banner">
          <a href="">
              <div class="banner-slide slide1 slide_active"></div>
          </a>
          <a href="">
              <div class="banner-slide slide2"></div>
          </a>
          <a href="">
              <div class="banner-slide slide3"></div>
          </a>
      </div>

      <!--���°�ť-->
      <a href="javascript:void(0)" class="button prev" id="prev"></a>
      <a href="javascript:void(0)" class="button next" id="next"></a>
      <!--Բ��-->
      <div class="dots" id="dots">
          <span class="active"></span>
          <span></span>
          <span></span>
      </div>
  </div>
  <script src="js/jsss.js"></script>

  </body>
</html>