<%@page import="model.User"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
//セッションの取得
User user = (User)session.getAttribute("user");
//リクエストの取得
User userDetail = (User)request.getAttribute("userDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報詳細参照</title>
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
	<div class="container">
		<h1>ユーザー情報詳細</h1>
		<div class="card details" style="width: 40rem;">
			<div class="card-body">
		    	<h4 class="card-title"><%= userDetail.getName() %></h4>
		    	<div class="form-group row">
  			  		<label for="login-id" class=" col-sm-4 col-form-label label-control-position">ログインID：</label>
    				<div class="col-sm-8">
    					<p class="form-control-position">
    						<%= userDetail.getLogin_id() %>
    					</p>
    				</div>
  				</div>
		    	<div class="form-group row">
  			  		<label for="birth" class=" col-sm-4 col-form-label label-control-position">生年月日：</label>
    				<div class="col-sm-8">
    					<p class="form-control-position">
    						<%= userDetail.getBirth_date() %>
    					</p>
    				</div>
  				</div>
  				<div class="form-group row">
  			  		<label for="conform" class=" col-sm-4 col-form-label label-control-position">登録日時：</label>
    				<div class="col-sm-8">
    					<p class="form-control-position">
    						<%= userDetail.getCreate_date() %>
    					</p>
    				</div>
  				</div>
  				<div class="form-group row">
  			  		<label for="update" class=" col-sm-4 col-form-label label-control-position">更新日時：</label>
    				<div class="col-sm-8">
    					<p class="form-control-position">
    						<%= userDetail.getUpdate_date() %>
    					</p>
    				</div>
  				</div>
			</div>
		</div>
		<div class="col-sm-3 back-page">
			<a href="/UserManagement/UserList">戻る</a>
		</div>
	</div>
</body>
<!-- /body -->

</html>