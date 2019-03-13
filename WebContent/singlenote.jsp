<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<script type="text/javascript">
	function checkLogin() {
		if (${sessionScope.userName==null}) {
			alert("请登录！！！");
			return false;
		}
		return true;
	}
</script>

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
				<div class="span8 page-content">

					<article class=" page type-page hentry clearfix">
						<h1 class="post-title">帖子名称： ${singlenote.notename }</h1>
						<span class="category"><a href="#"
							title="View all posts in Server &amp; Database">发表人： ${singlenote.username }</a></span>
						<span class="date">发表时间： ${singlenote.publishedtime }</span>
						<p>帖子内容：${singlenote.notecontent }</p>
					</article>
					<h1 class="post-title">评论：</h1>
					<c:forEach items="${commentlist }" var="commentlist">
						<p>#########################################################</p>
						<article class=" page type-page hentry clearfix">
							<p>评论内容： ${commentlist.content }</p>

							<span class="category"><a href="#"
								title="View all posts in Server &amp; Database">评论时间： ${commentlist.username }</a></span> <span
								class="date">评论时间： ${commentlist.commenttime }</span>

						</article>
						<p>#########################################################</p>
					</c:forEach>
					<div class="faqs clearfix">
						<article class="faq-item active">
							<span class="faq-icon"></span>
							<h3 class="faq-question">
								<P>发布评论</p>
							</h3>
							<div class="faq-answer">
								<div class="post-meta clearfix">
									<form action="./CommentServlet?action=add&commenttype=notecommenttable" onsubmit="return checkLogin()" method="post">
										<input type="hidden" name="id" value="${singlenote.noteid }" />
										<input type="hidden" name="username" value="${sessionScope.userName }" />
										<input type="hidden" name="userid" value="${sessionScope.userId }"/>
										<input type="text" name="commentcontent" value=" " /> 
										<input type="submit" value="发  表  评  论" />
									</form>
								</div>
							</div>
						</article>
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
	<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
	<script type='text/javascript'
		src='js/prettyphoto/jquery.prettyPhoto.js'></script>
	<script type='text/javascript' src='js/jflickrfeed.js'></script>
	<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
	<script type='text/javascript' src='js/jquery.form.js'></script>
	<script type='text/javascript' src='js/jquery.validate.min.js'></script>
	<script type='text/javascript' src='js/custom.js'></script>

</body>
</html>
