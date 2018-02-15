<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>APP维护</title>
     <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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

  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/localcss/appinfolist.css" type="text/css"></link></head>
  
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
       <%@include file="common/left.jsp" %>
       

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>APP信息管理维护<i class="fa fa-user"></i><small>${devUser.devName}-您可以通过搜索或其他筛选项对APP的信息进行比较、删除等管理操作(＾▽＾)。</small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   <form method="post" action="${pageContext.request.contextPath }/app/list">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
						&emsp;&emsp;&nbsp;
							<label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="softwareName" type="text" class="form-control" value="${appInfo.softwareName }">
							</div>
						</div>
					</li>
					
					<li>
				
						<div class="form-group">
						
							<label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="status" class="form-control">
								 <option value="0">&emsp;&emsp;&emsp;&emsp;---请选择--&emsp;&emsp;&emsp;&emsp;</option>
									<c:if test="${statusList != null }">
									   <c:forEach var="dataDictionary" items="${statusList}">
									   		<option <c:if test="${dataDictionary.valueId == appInfo.status }">selected="selected"</c:if>
									   		value="${dataDictionary.valueId}">${dataDictionary.valueName}</option>
									   </c:forEach> 
									</c:if> 
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="flatformId" class="form-control">
								  <option value="0">&emsp;&emsp;&emsp;&emsp;---请选择--&emsp;&emsp;&emsp;&emsp;</option>
									<c:if test="${flatFormList != null }">
									  <c:forEach var="dataDictionary" items="${flatFormList}">
									   		<option <c:if test="${dataDictionary.valueId == appInfo.flatformId }">selected="selected"</c:if>
									   		value="${dataDictionary.valueId}">${dataDictionary.valueName}</option>
									   </c:forEach> 
									</c:if>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="categoryLevel1" id="queryCategoryLevel1" class="form-control">
								  <option value="0">&emsp;&emsp;&emsp;&emsp;---请选择--&emsp;&emsp;&emsp;&emsp;</option>
									<c:if test="${categoryLevel1List != null }">
									   <c:forEach var="appCategory" items="${categoryLevel1List}">
									   		<option <c:if test="${appCategory.id == appInfo.categoryLevel1}">selected="selected"</c:if>
									   		value="${appCategory.id}">${appCategory.categoryName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" name="categorylevel2Select" value="${appInfo.categoryLevel2}" id="categorylevel2Select"/>
        						<select name="categoryLevel2" id="queryCategoryLevel2" class="form-control">
        						 <option value="0">&emsp;&emsp;&emsp;&emsp;---请选择--&emsp;&emsp;&emsp;&emsp;</option>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" name="categorylevel3Select" value="${appInfo.categoryLevel3}" id="categorylevel3Select"/>
        						<select name="categoryLevel3" id="queryCategoryLevel3" class="form-control">
        						  <option value="0">&emsp;&emsp;&emsp;&emsp;---请选择--&emsp;&emsp;&emsp;&emsp;</option>
        						</select>
							</div>
						</div>
					</li>
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button></li>
				</ul>
			</form>
                   
                  </div>
                </div>
              </div>

              


              <div class="col-md-12 col-sm-12 col-xs-14">
                <div class="x_panel">
                  <div class="x_title">
                    <a href="app/toAdd"><button type="button" class="btn btn-success btn-sm">新增APP基础信息</button></a>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <table  class="table table-striped table-bordered dt-responsive nowrap " cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th width="14%">软件名称</th>
                          <th width="18">APK名称</th>
                          <th width="8%">软件大小(单位：M)</th>
                          <th width="6%">所属平台</th>
                          <th width="22%">所属分类（一级分类、二级分类、三级分类）</th>
                          <th width="6%">状态</th>
                          <th width="5%">下载次数</th>
                          <th width="7%">最新版本号</th>
                          <th width="15%">操作</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${list}" varStatus="i" var="appInfo">
                        <tr>
                          <td>${appInfo.softwareName}</td>
                          <td>${appInfo.apkname}</td>
                          <td>${appInfo.softwareSize}</td>
                          <td>${appInfo.flatformString}</td>
                          <td>${appInfo.categoryLevel1String}->${appInfo.categoryLevel2String}->${appInfo.categoryLevel3String}</td>
                          <td id="appInfoStatus${appInfo.id}">${appInfo.statusString}</td>
                          <td>${appInfo.downloads}</td>
                          <td>${appInfo.versionString}</td>
                          <td>
                             <div class="btn-group">
                             <button type="button" class="btn btn-danger">点击操作</button>
                             <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                &thinsp;<span class="caret"></span>
                                
                             </button>
                            <ul class="dropdown-menu" role="menu">
                               <li>
                                 <c:choose>
								    <c:when test="${appInfo.status == 2 || appInfo.status == 5}">
							            <a class="saleSwichOpen" saleSwitch="open" appinfoid=${appInfo.id }  appsoftwarename=${appInfo.softwareName } >上架</a>
									</c:when>
									<c:when test="${appInfo.status == 4}">
										<a class="saleSwichClose" saleSwitch="close" appinfoid=${appInfo.id }  appsoftwarename=${appInfo.softwareName }>下架</a>
									</c:when>
								 </c:choose>
								</li>
                                <li><a class="addVersion" appinfoid="${appInfo.id}">新增版本 </a></li>
                                <li><a class="modifyVersion" status="${appInfo.status}" versionid="${appInfo.versionId}" appinfoid="${appInfo.id}" statusname="${appInfo.statusString}">修改版本</a></li>
                                <li><a class="modifyAppInfo" status="${appInfo.status}" appinfoid="${appInfo.id}" statusname="${appInfo.statusString}">修改</a></li>
                                <li><a class="viewApp" appinfoid=${appInfo.id }>查看</a></li>
                                <li><a class="deleteApp" appsoftwarename=${appInfo.softwareName } appinfoid=${appInfo.id }>删除</a></li>
                             </ul>
                             </div>
                          </td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>

                  </div>
                   <div >
                    <h2><small>共${page.totalCount }条记录&nbsp;&nbsp;${page.currentPageNo}/${page.totalPageCount}页</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <c:if test="${page.currentPageNo > 1}">
                      <li><a href="javascript:page_nav(document.getElementsByTagName('form')[0],1);"> <button type="button" class="btn btn-success btn-sm">首页</button></a></li>
                      <li><a href="javascript:page_nav(document.getElementsByTagName('form')[0],${page.currentPageNo-1});"> <button type="button" class="btn btn-success btn-sm">上一页</button></a></li>
                      </c:if>
                      <c:if test="${page.currentPageNo < page.totalPageCount }">
                      <li><a href="javascript:page_nav(document.getElementsByTagName('form')[0],${page.currentPageNo+1});"> <button type="button" class="btn btn-success btn-sm">下一页</button></a></li>
                      <li><a href="javascript:page_nav(document.getElementsByTagName('form')[0],${page.totalPageCount});"> <button type="button" class="btn btn-success btn-sm">尾页</button></a></li>
                      </c:if>
                    </ul>
                    <div class="clearfix"></div>
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

    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/appinfolist.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/rollpage.js"></script>
    <!-- Datatables -->
   
    <!-- /Datatables -->
  </body>
</html>
