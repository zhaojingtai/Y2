<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/statics/css/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="${pageContext.request.contextPath }/statics/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/scroller.bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">
    
    <title>查看并审核APP信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
    <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="common/left.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main"> 
             <div class="x_panel">
               <div class="x_title">
                    <h2>查看并审核APP信息 <i class="fa fa-user"></i><small>>${backendUser.userName}</small></h2>
                    <div class="clearfix"></div>
               </div>
               <div class="x_title">
                    <h2>APP基础信息 </h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form class="form-horizontal form-label-left" method="post" id="form" action="${pageContext.request.contextPath }/backend/check?isTrue=yes" style="width:700px;margin:0px auto;padding-right:60px;">
                       <input type="hidden" id="id" name="id" value="${appInfo.id}">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" readonly="readonly" value="${appInfo.softwareName}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">APK名称*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control"  readonly="readonly" value="${appInfo.apkname}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">支持ROM*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control"  readonly="readonly" value="${appInfo.supportRom}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">界面语言*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control"  readonly="readonly" value="${appInfo.interfaceLanguage}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">软件大小*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" readonly="readonly" value="${appInfo.softwareSize}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">下载次数*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control"  readonly="readonly" value="${appInfo.downloads}">
                        </div>
                      </div>
                     
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control"  readonly="readonly" value="${appInfo.flatformString}">
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">所属分类*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control"  readonly="readonly" value="${appInfo.categoryLevel1String} -> ${appInfo.categoryLevel2String} -> ${appInfo.categoryLevel3String}">
                        </div>
                      </div>
                       
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control"  readonly="readonly" value="${appInfo.statusString}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">应用简介 <span class="required">*</span>
                        </label>
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
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success" >审核通过</button>
                          <button type="button" id="no" class="btn btn-success">审核不通过</button>
                          <button type="button" id="back" class="btn btn-primary">返回</button>
                        </div>
                      </div>

                    </form>
                  </div>
               <div class="x_panel">
                
                  <div class="x_title">
                    <h2>最新版本信息 </h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>  
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form class="form-horizontal form-label-left">

                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">版本号*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" readonly="readonly" value="${appInfo.versionList.get(0).versionNo}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">版本大小*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" value="${appInfo.versionList.get(0).versionSize }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">发布状态*</label> 
                        <input type="hidden" name="publishStatus" id="publishStatus"
						value="${appInfo.versionList.get(0).publishStatus}">&emsp;${appInfo.versionList.get(0).publishStatusString}
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">版本简介 <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <textarea class="form-control" rows="3">${appInfo.versionList.get(0).versionInfo}</textarea>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">APK文件*</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                         ${appInfo.versionList.get(0).apkFileName}
                          <a href="${appInfo.versionList.get(0).downloadLink}?m="+Math.random()>下载</a>
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
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath }/statics/js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath }/statics/js/nprogress.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath }/statics/js/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/responsive.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/datatables.scroller.min.js"></script>

    <script src="${pageContext.request.contextPath }/statics/js/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/appcheck.js"></script>
    <!-- Datatables -->
   
    <!-- /Datatables -->
  </body>
</html>
