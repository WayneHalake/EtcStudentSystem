<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<!-- META TAGS -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Knowledge Base Theme</title>

<link rel="shortcut icon" href="images/favicon.png" />

<!-- Style Sheet-->
<link rel="stylesheet" href="style.css" />
<link rel='stylesheet' id='bootstrap-css-css'
	href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css-css'
	href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css-css'
	href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css'
	media='all' />
<link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0'
	type='text/css' media='all' />
<link rel='stylesheet' id='custom-css-css'
	href='css/custom5152.html?ver=1.0' type='text/css' media='all' />

</head>

<div class="container"> <div class="row">
	 <!-- start of page content -->
		<div class="span8 page-content">

			<!-- Basic Home Page Template -->
			<div class="row separator">
				<!--------------------------------- 文章  start -------------------------------------->
				<section class="span4 articles-list">
					<h3>最新文章</h3>
					<c:choose>
						<c:when test="${sessionScope==null }">
							<c:import url="/ArticleServlet?action=init"></c:import>
						</c:when>
						<c:otherwise>
							<c:forEach items="${sessionScope.Articlelist }" var="article">
								<ul class="articles">
									<li class="article-entry standard">
										<h4>
											<a href="./CommentServlet?type=article&id=${article.articleid }" >${article.articlename }</a>
										</h4> 
										<span class="article-meta">${article.username }</span>
										<span>
											<p>${article.articlecontent }</p>
										</span> 
									<span class="article-meta">${article.publishedtime }</span>
									</li>
								</ul>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</section>
				<!--------------------------------- 文章 end ----------------------------------------->


				<!--------------------------------- 帖子  start -------------------------------------->
				<section class="span4 articles-list">
					<h3>最新帖子</h3>
					<c:choose>
						<c:when test="${sessionScope==null }">
							<c:import url="/ArticleServlet?action=init"></c:import>
						</c:when>
						<c:otherwise>
							<c:forEach items="${sessionScope.Notelist }" var="notes">
								<ul class="articles">
									<li class="article-entry standard">
										<h4>
											<a href="./CommentServlet?type=note&id=${notes.noteid }" >${notes.notename }</a>
										</h4> 
										<span class="article-meta">${notes.username }</span>
										<span>
											<p>${notes.notecontent }</p>
										</span> 
									<span class="article-meta">${notes.publishedtime }</span>
									</li>
								</ul>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</section>
				<!--------------------------------- 帖子  end -------------------------------------->
			</div>
		</div>
		<aside class="span4 page-sidebar">
			<section class="widget">
				<div class="support-widget">
					<h3 class="title">Support</h3>
					<p class="intro">Need more support? If you did not found an
						answer, contact us for further help.</p>
				</div>
			</section>
			<section class="widget">
				<div class="quick-links-widget">
					<h3 class="title">Quick Links</h3>
					<ul id="menu-quick-links" class="menu clearfix">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="articles.jsp">文章</a></li>
						<li><a href="articles.jsp">帖子</a></li>
						<li><a href="login.jsp">登录</a></li>
					</ul>
				</div>
			</section>
		</aside>
		<!-- end of sidebar -->
	</div>
</div>
</html>