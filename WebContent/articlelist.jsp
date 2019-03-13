<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//String path = request.getContextPath();
	//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>

<body>

	<!-- Start of Header -->
	<div class="header-wrapper">
		<%@include file="../header.jsp"%>
	</div>
	<!-- End of Header -->

	<!-- Start of Search Wrapper -->
	<div class="search-area-wrapper">
		<%@ include file="../search_area.jsp"%>
	</div>
	<!-- End of Search Wrapper -->

	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">
				<!-- start of page content -->
				<div class="span8 main-listing">

					<h3 class="post-title">文章列表</h3>

					<c:forEach items="${articles }" var="article">
						<article class="format-standard type-post hentry clearfix">
							<header class="clearfix">

								<h3 class="post-title">
									<!-- 文章标题 -->
									<a href="./CommentServlet?type=article&id=${article.articleid }">${article.articlename } </a>
								</h3>

								<div class="post-meta clearfix">
									<!-- 文章发布时间 -->
									<span class="date">${article.publishedtime }</span>
									<!-- 文章发布作者 -->
									<span class="category"> <a href="#"
										title="View all posts in Server &amp; Database">${article.username }
									</a></span>
									<!-- 文章评论 -->
									<span class="comments"><a href="#"
										title="Comment on Integrating WordPress with Your Website">3
											Comments</a></span> <span class="like-count">66</span>
								</div>
								<!-- end of post meta -->

							</header>
							<!-- 文章评论 -->
							<p>${article.articlecontent }</p>

						</article>
					</c:forEach>
					<div id="pagination">
						<a href="#" class="btn active">1</a> <a href="#" class="btn">2</a>
						<a href="#" class="btn">3</a> <a href="#" class="btn">Next »</a> <a
							href="#" class="btn">Last »</a>
					</div>
				</div>
				<!-- end of page content -->


				<!-- start of sidebar -->
				<aside class="span4 page-sidebar">

					<section class="widget">
						<div class="support-widget">
							<h3 class="title">Support</h3>
							<p class="intro">Need more support? If you did not found an
								answer, contact us for further help.</p>
						</div>
					</section>


					<section class="widget">
						<h3 class="title">Featured Articles</h3>
						<ul class="articles">
							<li class="article-entry standard">
								<h4>
									<a href="single.html">Integrating WordPress with Your
										Website</a>
								</h4> <span class="article-meta">25 Feb, 2013 in <a href="#"
									title="View all posts in Server &amp; Database">Server
										&amp; Database</a></span> <span class="like-count">66</span>
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
					</section>



					<section class="widget">
						<h3 class="title">Categories</h3>
						<ul>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Advanced
									Techniques</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Designing
									in WordPress</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Server
									&amp; Database</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet, ">Theme
									Development</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Website
									Dev</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">WordPress
									for Beginners</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet, ">WordPress
									Plugins</a></li>
						</ul>
					</section>

					<section class="widget">
						<h3 class="title">Recent Comments</h3>
						<ul id="recentcomments">
							<li class="recentcomments"><a href="#"
								rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating
									WordPress with Your Website</a></li>
							<li class="recentcomments">saqib sarwar on <a href="#">Integrating
									WordPress with Your Website</a></li>
							<li class="recentcomments"><a href="#"
								rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating
									WordPress with Your Website</a></li>
							<li class="recentcomments"><a href="#"
								rel="external nofollow" class="url">Mr WordPress</a> on <a
								href="#">Installing WordPress</a></li>
						</ul>
					</section>

				</aside>
				<!-- end of sidebar -->
			</div>
		</div>
	</div>
	<!-- End of Page Container -->

	<!-- Start of Footer -->
	<footer id="footer-wrapper">
		<div id="footer" class="container">
			<div class="row">

				<div class="span3">
					<section class="widget">
						<h3 class="title">How it works</h3>
						<div class="textwidget">
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
								sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
								aliquam erat volutpat.</p>
							<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
								ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
								consequat.</p>
						</div>
					</section>
				</div>

				<div class="span3">
					<section class="widget">
						<h3 class="title">Categories</h3>
						<ul>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Advanced
									Techniques</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Designing
									in WordPress</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Server
									&amp; Database</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet, ">Theme
									Development</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">Website
									Dev</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">WordPress
									for Beginners</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet, ">WordPress
									Plugins</a></li>
						</ul>
					</section>
				</div>

				<div class="span3">
					<section class="widget">
						<h3 class="title">Latest Tweets</h3>
						<div id="twitter_update_list">
							<ul>
								<li>No Tweets loaded !</li>
							</ul>
						</div>
						<script
							src="http://twitterjs.googlecode.com/svn/trunk/src/twitter.min.js"
							type="text/javascript"></script>
						<script type="text/javascript">
							getTwitters("twitter_update_list", {
								id : "960development",
								count : 3,
								enableLinks : true,
								ignoreReplies : true,
								clearContents : true,
								template : "%text% <span>%time%</span>"
							});
						</script>
					</section>
				</div>

				<div class="span3">
					<section class="widget">
						<h3 class="title">Flickr Photos</h3>
						<div class="flickr-photos" id="basicuse"></div>
					</section>
				</div>

			</div>
		</div>
		<!-- end of #footer -->

		<!-- Footer Bottom -->
		<div id="footer-bottom-wrapper">
			<div id="footer-bottom" class="container">
				<div class="row">
					<div class="span6">
						<p class="copyright">
							Copyright © 2013. All Rights Reserved by KnowledgeBase.Collect
							from <a href="http://www.cssmoban.com/" title="网页模板"
								target="_blank">网页模板</a>
						</p>
					</div>
					<div class="span6">
						<!-- Social Navigation -->
						<ul class="social-nav clearfix">
							<li class="linkedin"><a target="_blank" href="#"></a></li>
							<li class="stumble"><a target="_blank" href="#"></a></li>
							<li class="google"><a target="_blank" href="#"></a></li>
							<li class="deviantart"><a target="_blank" href="#"></a></li>
							<li class="flickr"><a target="_blank" href="#"></a></li>
							<li class="skype"><a target="_blank" href="skype:#?call"></a></li>
							<li class="rss"><a target="_blank" href="#"></a></li>
							<li class="twitter"><a target="_blank" href="#"></a></li>
							<li class="facebook"><a target="_blank" href="#"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End of Footer Bottom -->

	</footer>
	<!-- End of Footer -->

	<a href="#top" id="scroll-top"></a>

	<!-- script -->
	<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
	<script type='text/javascript'
		src='js/jquery.easing.1.34e44.js?ver=1.3'></script>
	<script type='text/javascript'
		src='js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
	<script type='text/javascript'
		src='js/jquery.liveSearchd5f7.js?ver=2.0'></script>
	<script type='text/javascript' src='js/jflickrfeed.js'></script>
	<script type='text/javascript' src='js/jquery.formd471.js?ver=3.18'></script>
	<script type='text/javascript'
		src='js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
	<script type='text/javascript' src='js/custom5152.js?ver=1.0'></script>

</body>
</html>

