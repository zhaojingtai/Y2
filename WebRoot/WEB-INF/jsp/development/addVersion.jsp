<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'addVersion.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath }/statics/css/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/statics/css/green.css"
	rel="stylesheet">
<!-- Datatables -->
<link
	href="${pageContext.request.contextPath }/statics/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/scroller.bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath }/statics/css/custom.min.css"
	rel="stylesheet">

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<%@include file="common/left.jsp"%>
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							新增APP版本信息 <i class="fa fa-user"></i><small>${devUser.devName}</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<c:if test="${appInfo.versionId!=null&&appInfo.versionId!='' }">
						<div class="x_title">
							<h2>历史版本列表</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<p class="text-muted font-13 m-b-30"></p>

							<table id="datatable-fixed-header"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>软件名称</th>
										<th>版本号</th>
										<th>版本大小(单位：M)</th>
										<th>发布状态</th>
										<th>APK文件下载</th>
										<th>最新更新时间</th>
									</tr>
								</thead>


								<tbody>
									<c:forEach items="${appInfo.versionList}" var="appVersion">
										<tr>
											<td>${appInfo.softwareName}</td>
											<td>${appVersion.versionNo}</td>
											<td>${appVersion.versionSize}</td>
											<td>${appVersion.publishStatusString}</td>
											<td><a href="${appVersion.downloadLink}">${appVersion.apkFileName
													}</a></td>
											<td>${appVersion.modifyDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</c:if>
					<div class="x_panel">
						<div class="x_title">
							<h2>新增版本信息</h2>

							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i> </a>
								</li>

							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<br />
							<form class="form-horizontal form-label-left"
								action="${pageContext.request.contextPath }/app/addVersion" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="appId" 
									value="${appInfo.id}">
								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="name">版本号 <span class="required">*</span> </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="versionNo" class="form-control col-md-7 col-xs-12"
											data-validate-length-range="20" data-validate-words="1"
											name="versionNo" placeholder="请输入版本号" type="text"
											required="required">
									</div>
								</div>
								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="number">版本大小 <span class="required">*</span> </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="number" id="versionSize" name="versionSize"
											required="required" data-validate-minmax="10,500"
											placeholder="请输入版本大小，单位为Mb"
											class="form-control col-md-7 col-xs-12">
									</div>
								</div>

								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="select">发布状态 <span class="required">*</span> </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="hidden" name="publishStatus" id="publishStatus"
											value="3">预发布
									</div>
								</div>

								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="textarea">版本简介 <span class="required">*</span> </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<textarea id="versionInfo" name="versionInfo"
											required="required"
											placeholder="请输入本版本的相关信息，本信息作为该版本的详细信息进行版本介绍。"
											class="form-control col-md-7 col-xs-12"></textarea>
									</div>
								</div>
								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="name">apk文件 <span class="required">*</span> </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="file" class="form-control col-md-7 col-xs-12"
											name="a_downloadLink" id="a_downloadLink" required="required" />
										${fileUploadError }
									</div>
								</div>
								<div class="ln_solid"></div>
								<div class="form-group">
									<div class="col-md-6 col-md-offset-3">
										<button id="send" type="submit" class="btn btn-success">保存</button>
										<button type="button" class="btn btn-primary" id="back">返回</button>
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>


			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
			<div class="pull-right">
				Gentelella - Bootstrap Admin Template by <a
					href="https://colorlib.com">Colorlib</a>
			</div>
			<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath }/statics/js/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath }/statics/js/nprogress.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath }/statics/js/icheck.min.js"></script>
	<!-- Datatables -->
	<script
		src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/buttons.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/responsive.bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/datatables.scroller.min.js"></script>

	<script
		src="${pageContext.request.contextPath }/statics/js/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/statics/localjs/appversionadd.js"></script>
	<!-- Datatables -->

	<!-- /Datatables -->
</body>
</html>
