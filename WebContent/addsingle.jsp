<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


</head>
<body>

	<!-- Start of Header -->
	<div class="header-wrapper">
		<%@ include file="../header.jsp"%>
	</div>
	<!-- End of Header -->

	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 page-content">

					<article class="type-page hentry clearfix">
					<h1 class="post-title">
						<a href="#">发布新鲜事</a>
					</h1>
					<hr>
					<p>有什么问题，或是脑洞突然大开，一些好玩好笑的事情，都可以写在这里，分享给他人一起开心开心。</p>
					</article>


					<form id="contact-form" class="row"
						action="./UserServlet?action=addsingle" method="post">
						<input type="hidden" name="userid" value="${sessionScope.userId }" />
						<input type="hidden" name="username"
							value="${sessionScope.userName }" />
						<div class="span2">
							<label for="name">标 题：<span>*</span>
							</label>
						</div>
						<div class="span6">
							<input type="text" name="name" id="name"
								class="required input-xlarge" value="" title="给你的新鲜事取一个拉风的标题吧">
						</div>

						<div class="span2">
							<label for="email">类 型：<span>*</span></label>
						</div>
						<div class="span6">
							<input type="radio" name="type" value="article" checked /> <span>文章</span>
							<input type="radio" name="type" value="note" /> <span>帖子</span>
						</div>

						<div class="span2">
							<label for="message">内容： </label>
						</div>
						<div class="span6">
							<textarea name="content" id="content" class="required span6"
								rows="6" title="写一些牛逼的瞎话吧！"></textarea>
						</div>

						<div class="span6 offset2 bm30">
							<input type="submit" name="submit" value="发  布"
								class="btn btn-inverse" />
						</div>

						<div class="span6 offset2 error-container"></div>
						<div class="span8 offset2" id="message-sent"></div>

					</form>
				</div>
				<!-- end of page content -->


				<!-- start of sidebar -->
				<aside class="span4 page-sidebar"> <section class="widget">
				<div class="support-widget">
					<h3 class="title">Support</h3>
					<p class="intro">Need more support? If you did not found an
						answer, contact us for further help.</p>
				</div>
				</section> <section class="widget">
				<h3 class="title">Latest Articles</h3>
				<ul class="articles">
					<li class="article-entry standard">
						<h4>
							<a href="single.html">Integrating WordPress with Your Website</a>
						</h4> <span class="article-meta">25 Feb, 2013 in <a href="#"
							title="View all posts in Server &amp; Database">Server &amp;
								Database</a></span> <span class="like-count">66</span>
					</li>
					<li class="article-entry standard">
						<h4>
							<a href="single.html">WordPress Site Maintenance</a>
						</h4> <span class="article-meta">24 Feb, 2013 in <a href="#"
							title="View all posts in Website Dev">Website Dev</a></span> <span
						class="like-count">15</span>
					</li>
					<li class="article-entry video">
						<h4>
							<a href="single.html">Meta Tags in WordPress</a>
						</h4> <span class="article-meta">23 Feb, 2013 in <a href="#"
							title="View all posts in Website Dev">Website Dev</a></span> <span
						class="like-count">8</span>
					</li>
					<li class="article-entry image">
						<h4>
							<a href="single.html">WordPress in Your Language</a>
						</h4> <span class="article-meta">22 Feb, 2013 in <a href="#"
							title="View all posts in Advanced Techniques">Advanced
								Techniques</a></span> <span class="like-count">6</span>
					</li>
				</ul>
				</section> </aside>
				<!-- end of sidebar -->
			</div>
		</div>
	</div>
</body>
<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
<script type='text/javascript'
	src='js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='js/jquery.form.js'></script>
<script type='text/javascript' src='js/jquery.validate.min.js'></script>
<script type='text/javascript' src='js/custom.js'></script>
</html>
