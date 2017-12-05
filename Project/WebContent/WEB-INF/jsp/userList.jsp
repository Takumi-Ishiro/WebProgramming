<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
User user = (User)session.getAttribute("user");
user.getName();
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
	<div class="container">
		<h1>ユーザー一覧</h1>
		<div class="text-right">
    		<a href="userCreate.html">新規登録</a>
    	</div>
		<form>
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
		<table class="table table-striped" style="margin-top:30px">
			<thead>
			   	<tr>
			   	    <th>ログインID</th>
			    	<th>ユーザー名</th>
			    	<th>生年月日</th>
			    	<th></th>
			    </tr>
			</thead>
			<tbody>


		    	<tr>
			      	<td> id0001</td>
		    	  	<td>田中太郎</td>
		      		<td>1987年05月22日</td>
		      		<td>
		      			<a href="userDetail.html" class="btn btn-success">詳細</a>
		      			<a href="userUpdate.html" class="btn btn-info">更新</a>
		      			<a href="userDelete.html" class="btn btn-danger">削除</a>
		      		</td>
		    	</tr>


		    	<tr>
			      	<td>id0002</td>
			      	<td>佐藤次郎</td>
			      	<td>1979年02月15日</td>
			      	<td>
			      		<a href="userDetail.html" class="btn btn-success">詳細</a>
			      		<a href="userUpdate.html" class="btn btn-info">更新</a>
			      		<a href="userDelete.html" class="btn btn-danger">削除</a>
			        </td>
		    	</tr>
		    	<tr>
			      	<td>id0003</td>
			      	<td>佐川真治</td>
			      	<td>1965年12月31日</td>
			      	<td>
			      		<a href="userDetail.html" class="btn btn-success">詳細</a>
			      		<a href="userUpdate.html" class="btn btn-info">更新</a>
			      		<a href="userDelete.html" class="btn btn-danger">削除</a>
			      	</td>
		    	</tr>
		   	</tbody>
		</table>
	</div>
</body>
<!-- /body -->

</html>