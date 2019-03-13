<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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


<script type="text/javascript">
	function checkLogin() {
		if (${sessionScope.userName==null}) {
			alert("请登录！！！");
			return false;
		}
		return true;
	}
</script>

        </head>
	<div class="search-area-wrapper">
			<div class="search-area container">
					<h3 class="search-header">写点什么呢？</h3>
					<p class="search-tag-line">有什么问题，或是脑洞突然大开，一些好玩好笑的事情，都可以写在这里分享给他人一起开心开心。</p>

					<form  class="search-form clearfix" method="post" action="./addsingle.jsp" onsubmit="return checkLogin()" autocomplete="off">
							<input class="search-term required" type="text" id="s" name="s" placeholder="把好玩的事情分享给他人吧！" />
							<input class="search-btn" type="submit" value="发  布" />
							<div id="search-error-container"></div>
					</form>
			</div>
	</div>
</html>				