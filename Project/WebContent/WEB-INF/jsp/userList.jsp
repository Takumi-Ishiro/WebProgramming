<%@page import="model.User"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
//セッションの取得
User user = (User)session.getAttribute("user");
List<User> userList = (List<User>)request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー一覧</title>
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
				<a class="navbar-brand" href="/UserManagement/Index">ユーザー情報管理システム</a>
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
	<div class="container" style="margin-bottom:75px;">
		<h1>ユーザー一覧</h1>
		<div class="text-right">
    		<a href="/UserManagement/UserCreate">新規登録</a>
    	</div>
		<form style="margin-bottom:30px;">
	  		<div class="form-row id-name">
	    		<div class="form-group col-md-6">
	      			<label for="login-id">ログインID</label>
	      			<input type="text" class="form-control" id="login-id" placeholder="ログインIDを入力">
	    		</div>
	    		<div class="form-group col-md-6">
	      			<label for="user-name">ユーザー名</label>
	      			<input type="text" class="form-control" id="user-name" placeholder="ユーザー名を入力">
	    		</div>
	  		</div>
	  	 	<div class="form-group">
	     		<label for="birth" class="control-label">生年月日</label>
	        	<div class="row birthday">
		            <div class="col-sm-5">
		                <input type="date" name="date-start" id="date-start" class="form-control" size="30"/>
		            </div>
		            ~
		            <div class="col-sm-5">
		                <input type="date" name="date-end" id="date-end" class="form-control"/>
		            </div>
		        </div>
			</div>
			<button type="submit" class="btn btn-primary">検索</button>
	    </form>
		<div style="height:500px; overflow-y:scroll;">
		<table class="table table-striped">
			<thead>
			   	<tr>
			   	    <th>ログインID</th>
			    	<th>ユーザー名</th>
			    	<th>生年月日</th>
			    	<th></th>
			    </tr>
			</thead>
			<tbody>
		    	<%
		    	for(User list : userList){
		    	%>
			    	<tr>
				      	<td style="vertical-align:middle"><%= list.getLogin_id() %></td>
			    	  	<td style="vertical-align:middle"><%= list.getName() %></td>
			      		<td style="vertical-align:middle"><%= list.getBirth_date() %></td>
			      		<td>
			      			<a href="/UserManagement/UserDetail?id=<%= list.getId() %>" class="btn btn-success">詳細</a>
			      			<a href="/UserManagement/UserUpdate?id=<%= list.getId() %>" class="btn btn-info">更新</a>
			      			<a href="userDelete.html" class="btn btn-danger">削除</a>
			      		</td>
			      	</tr>
		      	<%
		      	}
		      	%>
		   	</tbody>
		</table>
		</div>
	</div>
</body>
<!-- /body -->

</html>