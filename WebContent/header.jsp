<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
	<head>
          <!-- META TAGS -->
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <title>Knowledge Base Theme</title>

          <link rel="shortcut icon" href="images/favicon.png" />

          <!-- Style Sheet-->
          <link rel="stylesheet" href="style.css"/>
          <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
          <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
          <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
          <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
          <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


        </head>
	<div class="header-wrapper">
		<header>
			<div class="container">
				<div class="logo-container">
					<!-- Website Logo -->
					<a href="index-2.html"  title="Knowledge Base Theme">
							<img src="images/logo.png" alt="Knowledge Base Theme">
					</a>
					<span class="tag-line">Etc学员社区</span>
				</div>
				<!-- Start of Main Navigation -->
				<nav class="main-nav">
					<div class="menu-top-menu-container">
						<ul id="menu-top-menu" class="clearfix">
								
							<li><a href="./index.jsp">首页</a></li>
							<li><a href="./ArticleServlet?action=showall&type=article">文章</a></li>
							<li><a href="./ArticleServlet?action=showall&type=note">帖子</a></li>
					<!--sessionScope 获取servlet中session中userName的值  -->
					<c:choose>
					
						<c:when test="${sessionScope.userName==null }">				
							<li><a href="./login.jsp">登录</a></li>
						</c:when>
						<c:when test="${sessionScope.userName!=null }">
							<li><a href="#">${sessionScope.userName}</a>
								<ul class="sub-menu">
                                  <li><a href="./UserServlet?action=showmessage&userid=${sessionScope.userId}">个人中心</a></li>
                                  <li><a href="./UserServlet?action=myarticles&userid=${sessionScope.userId}">我的文章</a></li>
                                  <li><a href="./UserServlet?action=mynotes&userid=${sessionScope.userId}">我的帖子</a></li>
                                  <li><a href="./UserServlet?action=loginout">安全退出</a></li>
                               </ul>
							</li>
						</c:when>
					</c:choose>
								
						</ul>
					</div>
				</nav>
				<!-- End of Main Navigation -->

			</div>
		</header>
	</div>
</html>