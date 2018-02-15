<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'addAppInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/appinfo.css"
	type="text/css"></link>
<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath }/statics/css/custom.min.css"
	rel="stylesheet">

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<%@include file="common/left.jsp"%>

			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										新增APP基础信息 <i class="fa fa-user"></i><small>${devUser.devName}</small>
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

									<div class="clearfix"></div>
									<form class="form-horizontal form-label-left"
										action="${pageContext.request.contextPath }/app/add"
										method="post" enctype="multipart/form-data">
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">软件名称 <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="softwareName"
													class="form-control col-md-7 col-xs-12"
													data-validate-length-range="20" data-validate-words="1"
													name="softwareName" required="required"
													placeholder="请输入软件名称" type="text">
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">APK名称 <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="apkname" class="form-control col-md-7 col-xs-12"
													data-validate-length-range="20" data-validate-words="1"
													name="apkname" required="required" placeholder="请输入APK名称"
													type="text">
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">支持ROM <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="supportRom"
													class="form-control col-md-7 col-xs-12" name="supportRom"
													data-validate-length-range="20" data-validate-words="1"
													required="required" placeholder="请输入支持的ROM" type="text">
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">界面语言 <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="interfaceLanguage"
													class="form-control col-md-7 col-xs-12"
													data-validate-length-range="20" data-validate-words="1"
													name="interfaceLanguage" required="required"
													placeholder="请输入软件支持的界面语言" type="text">
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="number">软件大小 <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="number" id="softwareSize" name="softwareSize"
													required="required"
													onkeyup="value=value.replace(/[^\d]/g,'')"
													data-validate-minmax="10,500" placeholder="请输入软件大小，单位为Mb"
													class="form-control col-md-7 col-xs-12">
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="number">下载次数 <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="number" id="downloads" name="downloads"
													required="required" data-validate-minmax="10,500"
													placeholder="请输入下载次数"
													class="form-control col-md-7 col-xs-12">
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="select">所属平台 <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select name="flatformId" id="flatformId"
													class="form-control" required="required"></select>
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="select">一级分类 <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select name="categoryLevel1" id="categoryLevel1"
													class="form-control" required="required">
												</select>
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="select">二级分类 <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select name="categoryLevel2" id="categoryLevel2"
													class="form-control" required="required"></select>
											</div>
										</div>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="select">三级分类 <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select name="categoryLevel3" id="categoryLevel3"
													class="form-control" required="required"></select>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">APP状态 <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="hidden" name="status" id="status" value="1">待审核
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="textarea">应用简介 <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea id="appInfo" name="appInfo" required="required"
													placeholder="请输入本软件的相关信息，本信息作为软件的详细信息进行软件的介绍。"
													class="form-control col-md-7 col-xs-12"></textarea>
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">LOGO图片 <span class="required">*</span> </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="file" class="form-control col-md-7 col-xs-12"
													name="a_logoPicPath" required="required" id="a_logoPicPath" />
												${fileUploadError }
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-md-offset-3">
												<button id="send" type="submit" class="btn btn-success">保存</button>
												<button type="button" class="btn btn-primary" id="back">返回</button>
												<br />
												<br />
											</div>
										</div>
									</form>
								</div>
							</div>
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
		src="${pageContext.request.contextPath }/statics/localjs/appinfoadd.js"></script>

	<!-- Datatables -->

	<!-- /Datatables -->
</body>
</html>
