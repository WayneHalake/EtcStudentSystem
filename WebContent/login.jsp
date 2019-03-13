<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	function isEmprotyUserPwd() {
		if (document.getElementById("userPwd").value == "") {
			alert("请输入密码！！！");
			return false;
		}
		return true;
	}

	function checkUserNP() {
		return isEmprotyUserName() && isEmprotyUserPwd();
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
</script>
</head>
<title>登录注册页面</title>
<body>

	<div class="login" style="margin-top:50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn_focus" id="switch_qlogin"
					href="javascript:void(0);" tabindex="7">快速登录</a> <a
					class="switch_btn" id="switch_login" href="javascript:void(0);"
					tabindex="8">快速注册</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>

		<div class="web_qr_login" id="web_qr_login"
			style="display: block; height: 235px;">

			<!------------------------登录-------------------------------------->
			<div class="web_login" id="web_login">


				<div class="login-box">


					<div class="login_form">
						<form action="./UserServlet?action=login" name="loginform"
							onsubmit="return checkUserNP()" accept-charset="utf-8"
							id="login_form" class="loginForm" method="post">

							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">用户名：</label>
								<div class="inputOuter" id="uArea">

									<input type="text" id="userName" name="userName"
										class="inputstyle" />
								</div>
							</div>

							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">密码：</label>
								<div class="inputOuter" id="pArea">

									<input type="password" id="userPwd" name="userPwd"
										class="inputstyle" />
								</div>
							</div>

							<div style="padding-left:50px;margin-top:20px;">
								<input type="submit" value="登 录" style="width:150px;"
									class="button_blue" />
							</div>
						</form>
					</div>

				</div>

			</div>
			<!-------------------------登录end------------------------------------>
		</div>

		<!-----------------------------注册----------------------------------->
		<div class="qlogin" id="qlogin" style="display: none; ">

			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8"
					action="UserServlet?action=regist" onsubmit="return checkpwd()"
					method="post">
					<input type="hidden" name="to" value="reg" /> <input type="hidden"
						name="did" value="0" />
					<ul class="reg_form" id="reg-ul">
						<div id="userCue" class="cue">快速注册请注意格式</div>
						<li><label for="user" class="input-tips2">用户名：</label>
							<div class="inputOuter2">
								<input type="text" id="userName" name="userName" maxlength="16"
									class="inputstyle2" />
							</div></li>

						<li><label for="user" class="input-tips2">姓名：</label>
							<div class="inputOuter2">
								<input type="text" id="Name" name="Name" maxlength="16"
									class="inputstyle2" />
							</div></li>
						<li><label for="user">性别：</label> <input type="radio"
							name="gender" value="nan" checked /> <span>男</span> <input
							type="radio" name="gender" value="nv" /> <span>女</span></li>
						<li><label for="user">选择用户类型：</label> <input type="radio"
							name="userType" value="student" checked /> <span>学员</span> <input
							type="radio" name="userType" value="teacher" /> <span>教员</span></li>

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

						<li><label for="intake" class="input-tips2">入学时间</label>
							<div class="inputOuter2">
								<input name="intake" class="Wdate" type="text"
									onclick="WdatePicker()" value="" />
							</div></li>
						<li>
						<li><label for="outtake" class="input-tips2">毕业时间</label>
							<div class="inputOuter2">
								<input name="outtake" class="Wdate" type="text"
									onclick="WdatePicker()" value="" />
							</div></li>

						<li>
							<div style="padding-left:50px;margin-top:20px;">
								<input type="submit" value="注  册" style="width:150px;"
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