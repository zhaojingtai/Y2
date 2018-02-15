<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'updateAppInfo.jsp' starting page</title>

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
							修改APP基础信息 <i class="fa fa-user"></i><small>${devUser.devName}</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br />
						<form class="form-horizontal form-label-left" id="form"
							action="${pageContext.request.contextPath }/app/update"
							method="post" enctype="multipart/form-data">
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">软件名称 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12"
										data-validate-length-range="20" data-validate-words="1"
										value="${appInfo.softwareName}" id="softwareName"
										name="softwareName" required="required" type="text">
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">APK名称 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12"
										data-validate-length-range="20" data-validate-words="1"
										readonly="readonly" value="${appInfo.apkname}" id="apkname"
										name="apkname" type="text">
								</div>
							</div>

							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">支持ROM <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12"
										data-validate-length-range="20" data-validate-words="1"
										required="required" value="${appInfo.supportRom}"
										id="supportRom" name="supportRom" type="text">
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">界面语言 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12"
										data-validate-length-range="20" data-validate-words="1"
										required="required" value="${appInfo.interfaceLanguage}"
										id="interfaceLanguage" name="interfaceLanguage" type="text">
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="number">软件大小 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="number" required="required"
										onkeyup="value=value.replace(/[^\d]/g,'')"
										data-validate-minmax="10,500" value="${appInfo.softwareSize}"
										id="softwareSize" name="softwareSize"
										class="form-control col-md-7 col-xs-12">
								</div>
							</div>

							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="number">下载次数 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="number" required="required"
										value="${appInfo.downloads}" id="downloads" name="downloads"
										data-validate-minmax="10,500"
										class="form-control col-md-7 col-xs-12">
								</div>
							</div>

							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="select">所属平台 <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="hidden" value="${appInfo.flatformId}" id="fid">
									<select id="flatformId" name="flatformId" class="form-control"
										required="required"></select>
								</div>
							</div>

							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="select">一级分类 <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="hidden" value="${appInfo.categoryLevel1}" id="cl1">
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
									<input type="hidden" value="${appInfo.categoryLevel2}" id="cl2">
									<select name="categoryLevel2" id="categoryLevel2"
										class="form-control" required="required"></select>
								</div>
							</div>

							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="select">三级分类 <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="hidden" value="${appInfo.categoryLevel3}" id="cl3">
									<select name="categoryLevel3" id="categoryLevel3"
										class="form-control" required="required"></select>
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">APP状态 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="hidden" name="status" id="status"
										value="${appInfo.status}">${appInfo.statusString}
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="textarea">应用简介 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<textarea id="appInfo" required="required"
										class="form-control col-md-7 col-xs-12" id="appInfo"
										name="appInfo">${appInfo.appInfo}</textarea>
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">LOGO图片 <span class="required">*</span> </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="hidden" id="id" name="id" value="${appInfo.id}" />
									<input type="hidden" id="logoPicPath"
										value="${appInfo.logoPicPath}" /> <input type="hidden"
										id="logoLocPath" value="${appInfo.logoLocPath}" />
									<div id="uploadfile" style="display: none">
										<p>
											<span style="color:red;font-weight: bold;">*注：1、大小不得超过500k.2、图片格式：jpg、png、gif</span>
										</p>
									</div>
									<div id="logoFile"></div>
									${fileUploadError}
								</div>
							</div>
							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-md-offset-3">
									<c:if test="${appInfo.status==3}">
										<button type="button" id="updateStatus"
											class="btn btn-success">保存并再次提交审核</button>
									</c:if>
									<button type="submit" class="btn btn-success">保存</button>
									<button type="button" id="back" class="btn btn-primary">返回</button>
									<br />
									<br />
								</div>
							</div>
						</form>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/statics/localjs/appinfomodify.js"></script>
	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>

	<!-- Datatables -->

	<!-- /Datatables -->
</body>
</html>
