<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="images/login.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<link href="css/login2.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function isEmprotyUserName() {
		if (document.getElementById("userName").value == "") {
			alert("请输入用户名！！！");
			return false;
		}
		return true;
	}

	function checkpwd() {
		if (document.getElementById("Name").value == "") {
			alert("输入用户名为空！！");
			return false;
		} else if (document.getElementById("Pwd").value == "") {
			alert("输入密码为空！！");
			return false;
		} else if (document.getElementById("Pwd").equalTo(
				document.getElementById("Pwd2"))) {
			return true;
		} else {
			alert("两次输入的密码不一致，请重新输入！");
			return false;
		}
	}

	function checkUserNP() {
		return isEmprotyUserName() && checkpwd();
	}
</script>
</head>
<title>登录注册页面</title>
<body>

	<div class="login" style="margin-top:50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a href="#">保存\更新信息</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>

		<!-----------------------------注册----------------------------------->
		<div class="qlogin" id="qlogin" style="display: block; ">

			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8"
					action="UserServlet?action=update" onsubmit="return checkUserNP()"
					method="post">


					<ul class="reg_form" id="reg-ul">
						<div id="userCue" class="cue">填写请注意格式</div>
						<input type="hidden" id="userid" name="userid"
							value="${user.userid }" />
						<li><label for="user" class="input-tips2">用户名：</label>
							<div class="inputOuter2">
								<input type="text" id="userName" name="userName" maxlength="16"
									class="inputstyle2" value="${user.username }" />
							</div></li>

						<li><label for="user" class="input-tips2">姓名：</label>
							<div class="inputOuter2">
								<input type="text" id="Name" name="Name" maxlength="16"
									class="inputstyle2" value="${user.name }" />
							</div></li>

						 <input type="hidden"
							name="userType" value="${user.type }"  />
						<input type="hidden"
							name="gender" value="${user.gender }"  />

						<li><label for="passwd" class="input-tips2">密码：</label>
							<div class="inputOuter2">
								<input type="password" id="Pwd" name="Pwd" maxlength="16"
									class="inputstyle2" />
							</div></li>
						<li><label for="passwd2" class="input-tips2">确认密码：</label>
							<div class="inputOuter2">
								<input type="password" id="Pwd2" name="Pwd2" maxlength="16"
									class="inputstyle2" />
							</div></li>
						<li>
						<li><label for="intake" class="input-tips2">入学时间</label>
							<div class="inputOuter2">
								<input name="intake" class="Wdate" type="text"
									onclick="WdatePicker()" value="${user.intake }" />
							</div></li>
						<li>
						<li><label for="outtake" class="input-tips2">毕业时间</label>
							<div class="inputOuter2">
								<input name="outtake" class="Wdate" type="text"
									onclick="WdatePicker()" value="${user.outtake }" />
							</div></li>

						<li>
							<div style="padding-left:50px;margin-top:20px;">
								<input type="submit" value="保  存" style="width:150px;"
									class="button_blue" />
							</div>
						</li>
					</ul>

				</form>

			</div>
		</div>
		<!---------------------------注册end----------------------------------------------------->
	</div>
</body>
</html>
