<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<body class="theme-color-1">
	<!-- header start -->
	
	<!-- Price range icon -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/price-range.css">
	
	<jsp:include page="../header.jsp"></jsp:include>
	
    <!-- header end -->

	<c:choose>
		<c:when test="${not empty msg}">
			<script>
				alert("${msg}");
			</script>
		</c:when>
	</c:choose>
	
	<!-- breadcrumb start -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-title">
                        <h2>${store.name}</h2>
                    </div>
                </div>
                <div class="col-sm-6">
                    <nav aria-label="breadcrumb" class="theme-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item"><a href="index.html">Store</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${store.name}</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb End -->
	
	<!-- product-tab starts -->
    <section class="tab-product pt-0 m-0">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <ul class="nav nav-tabs nav-material" id="top-tab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="top-home-tab" data-bs-toggle="tab"
                                href="#top-home" role="tab" aria-selected="true"><i
                                    class="icofont icofont-ui-home"></i>Details</a>
                            <div class="material-border"></div>
                        </li>
                        
                    </ul>
                    <div class="tab-content nav-material" id="top-tabContent">
                        <div class="tab-pane fade show active" id="top-home" role="tabpanel"
                            aria-labelledby="top-home-tab">
                            <div class="product-tab-discription">
                            	<div class="top-banner-wrapper">
                                     <a href="${contextPath}/store/${store.id}"><img src="${store.thumb_file_url}"
                                             class="img-fluid blur-up lazyload" alt=""></a>
                                     <div class="top-banner-content small-section">
                                         <h4>${store.name}</h4>
                                         <p>${store.detail}</p>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product-tab ends -->
    
    <div class="container">
    	<div class="collection-content col">
                        <div class="page-main-content">
                            <div class="row">
                                <div class="col-sm-12">
                                	
                                    <div class="collection-product-wrapper">
                                        <div class="product-top-filter">
                                            <div class="row">
                                                <div class="col-xl-12">
                                                    <div class="filter-main-btn"><span
                                                            class="filter-btn btn btn-theme"><i class="fa fa-filter"
                                                                aria-hidden="true"></i> Filter</span></div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="product-filter-content">
                                                    	 
                                                        <div class="search-count">
                                                            <h5>맞춤 보기 설정</h5>
                                                        </div>
                                                         
                                                        <div class="collection-view">
                                                            <ul>
                                                                <li><i class="fa fa-th grid-layout-view"></i></li>
                                                                <li><i class="fa fa-list-ul list-layout-view"></i></li>
                                                            </ul>
                                                        </div>
                                                        <div class="collection-grid-view">
                                                            <ul>
                                                                <li><img src="${contextPath}/resources/assets/images/icon/2.png" alt=""
                                                                        class="product-2-layout-view"></li>
                                                                <li><img src="${contextPath}/resources/assets/images/icon/3.png" alt=""
                                                                        class="product-3-layout-view"></li>
                                                                <li><img src="${contextPath}/resources/assets/images/icon/4.png" alt=""
                                                                        class="product-4-layout-view"></li>
                                                                <li><img src="${contextPath}/resources/assets/images/icon/6.png" alt=""
                                                                        class="product-6-layout-view"></li>
                                                            </ul>
                                                        </div>
                                                        <div class="product-page-per-view">
                                                            <select>
                                                                <option value="High to low">24 개씩 보기
                                                                </option>
                                                                <option value="Low to High">50 개씩 보기
                                                                </option>
                                                                <option value="Low to High">100 개씩 보기
                                                                </option>
                                                            </select>
                                                        </div>
                                                        <div class="product-page-filter">
                                                            <select>
                                                                <option value="High to low">정렬하기</option>
                                                                <option value="Low to High">50 Products</option>
                                                                <option value="Low to High">100 Products</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-wrapper-grid">
                                            <div class="row margin-res">
                                            <!-- 상품 입력 부분 -->
                                                <c:forEach items="${itemList}" var="item">
                                                <div class="col-xl-3 col-6 col-grid-box">
                                                    <div class="product-box">
                                                        <div class="img-wrapper">
                                                            <div class="front">
                                                                <a href="${contextPath}/items/${item.id}"><img src="${item.thumb_file_url}"
                                                                        class="img-fluid  "
                                                                        alt=""></a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="${contextPath}/items/${item.id}"><img src="${item.thumb_file_url}"
                                                                        class="img-fluid   "
                                                                        alt=""></a>
                                                            </div>
                                                            <div class="cart-info cart-wrap">
                                                                <button data-bs-toggle="modal"
                                                                    data-bs-target="#addtocart" title="Add to cart"><i
                                                                        class="ti-shopping-cart"></i></button> <a
                                                                    href="javascript:void(0)" title="Add to Wishlist"><i
                                                                        class="ti-heart" aria-hidden="true"></i></a> <a
                                                                    href="#" data-bs-toggle="modal"
                                                                    data-bs-target="#quick-view" title="Quick View"><i
                                                                        class="ti-search" aria-hidden="true"></i></a> <a
                                                                    href="compare.html" title="Compare"><i
                                                                        class="ti-reload" aria-hidden="true"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="product-detail">
                                                            <div>
                                                                
                                                                <a href="product-page(no-sidebar).html">
                                                                    <h6>[${store.name}] ${item.name}</h6>
                                                                </a>
                                                                <!-- 
                                                                <p>Lorem Ipsum is simply dummy text of the printing and
                                                                    typesetting industry. Lorem Ipsum has been the
                                                                    industry's standard dummy text ever since the 1500s,
                                                                    when an unknown printer took a galley
                                                                    of type and scrambled it to make a type specimen
                                                                    book
                                                                </p>
                                                                 -->
                                                                <h4>$${item.price}</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="product-pagination">
                                            <div class="theme-paggination-block">
                                                <div class="row">
                                                    <div class="col-xl-6 col-md-6 col-sm-12">
                                                        <nav aria-label="Page navigation">
                                                            <ul class="pagination">
                                                                <li class="page-item"><a class="page-link" href="#"
                                                                        aria-label="Previous"><span
                                                                            aria-hidden="true"><i
                                                                                class="fa fa-chevron-left"
                                                                                aria-hidden="true"></i></span> <span
                                                                            class="sr-only">Previous</span></a></li>
                                                                <li class="page-item active"><a class="page-link"
                                                                        href="#">1</a></li>
                                                                <li class="page-item"><a class="page-link"
                                                                        href="#">2</a></li>
                                                                <li class="page-item"><a class="page-link"
                                                                        href="#">3</a></li>
                                                                <li class="page-item"><a class="page-link" href="#"
                                                                        aria-label="Next"><span aria-hidden="true"><i
                                                                                class="fa fa-chevron-right"
                                                                                aria-hidden="true"></i></span> <span
                                                                            class="sr-only">Next</span></a></li>
                                                            </ul>
                                                        </nav>
                                                    </div>
                                                    <!-- 
                                                    <div class="col-xl-6 col-md-6 col-sm-12">
                                                        <div class="product-search-count-bottom">
                                                            <h5>Showing Products 1-24 of 10 Result</h5>
                                                        </div>
                                                    </div>
                                                     -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </div>
     

	<!-- footer start -->
    <jsp:include page="../footer.jsp"></jsp:include>
    <!-- theme setting -->
	

    <!-- tap to top start -->
    <div class="tap-top">
        <div><i class="fa fa-angle-double-up"></i></div>
    </div>
    <!-- tap to top end -->

    <!-- price range js -->
    <script src="${contextPath}/resources/assets/js/price-range.js"></script>
</body>

</html>