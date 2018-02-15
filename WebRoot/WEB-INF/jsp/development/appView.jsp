<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'appView.jsp' starting page</title>

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
							查看APP信息 <i class="fa fa-user"></i><small>BOSS</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_title">
						<h2>APP基础信息</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br />
						<form class="form-horizontal form-label-left"
							style="width:700px;margin:0px auto;padding-right:60px;">

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.softwareName}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">APK名称*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.apkname}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">支持ROM*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.supportRom}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">界面语言*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.interfaceLanguage}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">软件大小*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.softwareSize}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">下载次数*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.downloads }">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.flatformString}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">所属分类*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.categoryLevel1String}>${appInfo.categoryLevel2String}>${appInfo.categoryLevel3String}">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<input type="text" class="form-control" readonly="readonly"
										value="${appInfo.statusString}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">应用简介
									<span class="required">*</span> </label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<textarea class="form-control" rows="3" readonly="readonly">${appInfo.appInfo}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">LOGO图片*</label>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<c:choose>
										<c:when
											test="${appInfo.logoPicPath == null || appInfo.logoPicPath == ''}">   
				    	暂无
				  </c:when>
										<c:otherwise>
											<img src="${appInfo.logoPicPath}" width="100px;" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>

						</form>
					</div>
					<c:if test="${appInfo.versionId!=null&&appInfo.versionId!='' }">
						<div class="x_panel">

							<div class="x_title">
								<h2>历史版本列表</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i>
									</a></li>
								</ul>
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

										<c:forEach items="${appInfo.versionList}" var="appinfo">
											<tr>
												<td>${appInfo.softwareName}</td>
												<td>${appinfo.versionNo}</td>
												<td>${appinfo.versionSize}</td>
												<td>${appinfo.publishStatusString}</td>
												<td>${appinfo.apkFileName }</td>
												<td>${appinfo.modifyDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
					</c:if>
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

	<!-- Datatables -->

	<!-- /Datatables -->
</body>
</html>
