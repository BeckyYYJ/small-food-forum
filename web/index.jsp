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
    <title>美食天下首页</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
      <meta charset="utf-8">
          <link rel="stylesheet" href="css/csss.css" />
      <%Object bg="1";
        request.setCharacterEncoding("GB2312");
          session.setAttribute("bg",bg);%>
      </head>
  <body>
  <%Date date=new Date();//response.setHeader("refresh","2");
  out.print("现在是： "+date.toString());
  out.print("<br>组长：颜颖佶");
  %>
  <div class="main" id="main">
      <div class="menu-box">

      </div>
      <!--子-->
      <div class="sub-menu hide" id="sub-menu">
          <!--手机-->
          <div class="inner-box ">
              <div class="sub-inner-box">
                  <div class="tittle">做菜，生活的享受</div>
                  <div class="sub-row">
                      <span class="bold mr10">中式料理：</span>
                      <a href="caipu.jsp?place=111&page=1" >图文</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=112">视频</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=113">创新</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">西方烹饪：</span>
                      <a href="caipu.jsp?place=121">图文</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=122">视频</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=123">创新</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">其他：</span>
                      <a href="caipu.jsp?place=131">日料</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=132">韩料</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=133">拉丁风情</a>
                      <span class="ml10 mr10">/</span>
                      <a href="caipu.jsp?place=134">小众口味</a>
                  </div>

              </div>

          </div>
          <!--电脑-->
          <div class="inner-box">
              <div class="sub-inner-box">
                  <div class="tittle">哪里有好吃的呀</div>
                  <div class="sub-row">
                      <span class="bold mr10">店铺推荐</span>
                      <a href="#">家常菜</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">烧烤火锅麻辣烫</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">日韩料</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">面包点心冰淇淋</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">其他</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">美食推荐</span>
                      <a href="#">国产美食</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">亚洲</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">欧美洲</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">澳洲</a>
                  </div>
              </div>

          </div>
          <!--电器-->
          <div class="inner-box">
              <div class="sub-inner-box">
                  <div class="tittle">交友区</div>
                  <div class="sub-row">
                      <span class="bold mr10">初来乍到</span>
                      <a href="#">新厨身份认证</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">互帮互助</span>
                      <a href="#">找厨友</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">爆照区</a>

                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">阶级扶弱</span>
                      <a href="#">找师傅</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">收徒弟</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">求助区</a>
                  </div>

              </div>

          </div>
          <!--家具-->
          <div class="inner-box">
              <div class="sub-inner-box">
                  <div class="tittle">好的工具可以事半功倍</div>
                  <div class="sub-row">
                      <span class="bold mr10">厨具测评</span>
                      <a href="#">锅~一锅在手</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">微波炉烤箱面包机等</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">刀~一把好刀走天下</a>
                  </div>
                  <div class="sub-row">
                      <span class="bold mr10">食材测评</span>
                      <a href="#">粮油~巧妇难为无米之炊</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">蔬菜水果</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">水产</a>
                      <span class="ml10 mr10">/</span>
                      <a href="#">其他</a>
                  </div>
              </div>

          </div>

      </div>

      <!--主-->
      <div class="menu-contern" id="menu-contern">
          <div class="menu-item">
              <a href="">
                  <span>菜谱</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
          <div class="menu-item">
              <a href="">
                  <span>美食推荐</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
          <div class="menu-item">
              <a href="">
                  <span>交友</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
          <div class="menu-item">
              <a href="">
                  <span>测评</span>
                  <i class="icon">&#xe665;</i>
              </a>
          </div>
      </div>

      <!--图片轮播-->
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

      <!--上下按钮-->
      <a href="javascript:void(0)" class="button prev" id="prev"></a>
      <a href="javascript:void(0)" class="button next" id="next"></a>
      <!--圆点-->
      <div class="dots" id="dots">
          <span class="active"></span>
          <span></span>
          <span></span>
      </div>
  </div>
  <script src="js/jsss.js"></script>

  </body>
</html>