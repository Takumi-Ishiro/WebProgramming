<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.User"%>
<%@page import="java.util.*"%>
<%
//セッションの取得
User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
<!-- BootstrapのCSS読み込み -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- 自分で作成したCSS読み込み -->
<link href="css/original.css" rel="stylesheet">
</head>

<!-- header -->
<header>
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="/UserManagement/UserList">ユーザー情報管理システム</a>
			</div>
			<ul class="nav nav-pills pull-right">
	  			<li class="nav-link"><%= user.getName() %></li>
	  		    <li class="nav-link">
	  		    	<a href="/UserManagement/Logout" class="navbar-link logout-link">ログアウト</a>
	            </li>
	  	    </ul>
	  	</div>
	</nav>
</header>
<!-- /header -->

<!-- body -->
<body>
	<div class="container ">
		<h1>ユーザー新規登録</h1>
		<p style="color:red;" class="text-center">${complete}</p>
		<p style="color:red;" class="text-center">${errorMessage}</p>
		<p style="color:red;" class="text-center">${falseMessage}</p>
		<form action="UserCreate" method="post" class="new-data">
		 	 <div class="form-group">
		   	 	<label class="col-form-label" for="login-id">ログインID</label>
		   	 	<input type="text" class="form-control" name="login-id" id="login-id" placeholder="ログインIDを入力" required>
		 	 </div>
		 	 <div class="form-group">
		   	 	<label class="col-form-label" for="password">パスワード</label>
		   	 	<input type="password" class="form-control" name="password" id="password" placeholder="パスワードを入力" required>
		 	 </div>
		  	 <div class="form-group">
		    	<label class="col-form-label" for="conform-password">パスワード(確認)</label>
		    	<input type="password" class="form-control" name="conform-password" id="conform-password" placeholder="パスワード(確認)を入力" required>
		  	 </div>
		  	 <div class="form-group">
		   	 	<label class="col-form-label" for="user-name">ユーザー名</label>
		   	 	<input type="text" class="form-control" name="user-name" id="user-name" placeholder="ユーザー名を入力" required>
		 	 </div>
		 	 <div class="form-group">
		   	 	<label class="col-form-label" for="birth">生年月日</label>
		   	 	<input type="date" class="form-control" name="birth" id="birth" placeholder="生年月日を入力" required>
		 	 </div>
		 	 <div class="col-sm-12 new-ragistration">
		 	 	<button type="submit" class="btn btn-success btn-lg">登録</button>
		 	 </div>
		</form>
		<div class="col-sm-3 back-page">
			<a href="/UserManagement/UserList">戻る</a>
		</div>
	</div>
</body>
<!-- /body -->

</html>