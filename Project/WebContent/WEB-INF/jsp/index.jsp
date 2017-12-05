<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<!-- BootstrapのCSS読み込み -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- 自分で作成したCSS読み込み -->
<link href="css/original.css" rel="stylesheet">
<!-- ログインフォームCSSの読み込み -->
<link href="css/loginform.css" rel="stylesheet">
</head>

<!-- header -->
<header>
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="/UserManagement/Index">ユーザー情報管理システム</a>
			</div>
		</div>
	</nav>
</header>
<!-- /header -->

<!-- body -->
<body>
	<div class = "container">
		<div class="wrapper">
			<form action="Index" method="post" name="Login_Form" class="form-signin">
		    	<h3 class="form-signin-heading">ログイン画面</h3>
			  	<hr class="colorgraph"><br>
			  	<input type="text" class="form-control" name="login_id" placeholder="ログインID" required/>
			  	<input type="password" class="form-control" name="password" placeholder="パスワード" required/>
			  	<button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit">ログイン</button>
			</form>
		</div>
		<p style="color:red; padding:30px;" class="text-center">
			${errorMessage}
		</p>
	</div>
</body>
<!-- body -->

</html>