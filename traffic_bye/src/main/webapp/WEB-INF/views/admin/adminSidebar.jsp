<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentPath"
	value="${contextPath}/admin/${loginInfo.storeId}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Page Sidebar Start-->
	<div class="page-sidebar">
		<div class="main-header-left d-none d-lg-block">
			<div class="logo-wrapper">
				<a href="${contextPath}"><img class="blur-up lazyloaded"
					src="${contextPath}/resources/assets/images/icon/logos2.png"
					class="img-fluid blur-up lazyload" alt=""
					style="width: 179px; height: 34px;"></a>
			</div>
		</div>
		<div class="sidebar custom-scrollbar">
			<div class="sidebar-user text-center">
				<div>
				</div>
				<h6 class="mt-3 f-14">${loginInfo.storeName}</h6>
				<p>${loginInfo.memberName}</p>
			</div>
			<ul class="sidebar-menu">
				<li><a class="sidebar-header" href="${currentPath}"><i
						data-feather="home"></i><span>주문관리</span></a></li>
				<li><a class="sidebar-header" href="${currentPath}/items"><i
						data-feather="box"></i><span>상품목록</span></a></li>
				<li><a class="sidebar-header" href="${currentPath}/addItem"><i
						data-feather="dollar-sign"></i><span>상품등록</span></a></li>
				<li><a class="sidebar-header" href="${currentPath}/manage"><i
						data-feather="tag"></i><span>매장관리</span></a></li>

				<li><a class="sidebar-header" href=""><i
						data-feather="users"></i><span>고객센터</span></a></li>
			</ul>
		</div>
	</div>
	<!-- Page Sidebar Ends-->

</body>
</html>