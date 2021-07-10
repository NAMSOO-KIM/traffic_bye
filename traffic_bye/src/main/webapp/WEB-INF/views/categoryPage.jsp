<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mediumCategoryList" value="${mediumCategoryList}" />
<c:set var="selectMainItemList" value="${selectMainItemList}" />
<c:set var="mainCategoryVO" value="${mainCategoryVO}" />
<c:set var="selectCategoryName" value="${selectCategoryName}" />


<!DOCTYPE html>
<html lang="en">

<body class="theme-color-1">
	<!-- header start -->
	
	
	<script src="${contextPath}/resources/assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){

	    $('#filterText').keyup(function(event) {
	        var temp = $(this).val();
	        console.log(temp);
	        if (temp == "") {
	        	
	            $('.col-grid-box').show();
	            
	        } else {
	            
	        	$('.col-grid-box').hide();
	        	$(".col-grid-box h6:contains('"+temp+"')").parents('.col-grid-box').show();

	        }
	    });
	});
	</script>
	<jsp:include page="header.jsp"></jsp:include>
	
    <!-- header end -->


    <!-- breadcrumb start -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-title" style="padding: 0 30px;">
                        <h2>${selectCategoryName}</h2>
                    </div>
                </div>
                <div class="col-sm-6">
                    <nav aria-label="breadcrumb" class="theme-breadcrumb">
                        <ol class="breadcrumb">
                        	
                            <li class="breadcrumb-item"><a href="${contextPath}/">home</a></li>
                            
                            <li class="breadcrumb-item active" aria-current="page">
	                            <a href="${contextPath}/mm/items/list/${mainCategoryVO.id}">
	                            	${mainCategoryVO.name}
	                            </a>            
                            </li>
                            	
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->


    <!-- section start -->
    <section class="section-b-space ratio_asos">
        <div class="collection-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 collection-filter">
                        <!-- side-bar colleps block stat -->
                        <div class="collection-filter-block">
                            <!-- brand filter start -->
                            <div class="collection-mobile-back"><span class="filter-back"><i class="fa fa-angle-left"
                                        aria-hidden="true"></i> back</span></div>
                            <div class="collection-collapse-block open">
                                <h3 class="collapse-block-title">${mainCategoryVO.name}</h3>
                                <div class="collection-collapse-block-content">
                                
                                    <div class="collection-brand-filter">
                                        
                                        <c:forEach items="${mediumCategoryList}" var="mediumCategoryVO">
                                            		
                                          <div class="form-check collection-filter-checkbox">
                                          <a href="${contextPath}/mm/items/list/${mediumCategoryVO.id}">
                                            <label class="form-check-label" for="zara">
                                            	${mediumCategoryVO.name}
                                            
                                            </label>
                                            </a>
                                          </div>
	                                                
                                        </c:forEach>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- silde-bar colleps block end here -->
                        <!-- side-bar single product slider start -->
                        <!-- -->
                        
                        <div class="theme-card">
                            <h5 class="title-border">new product</h5> 
                            <div class="offer-slider slide-1">
                            	
                            	<!-- 이중 for 문으로 처리 -->
                            	<c:forEach items="${newProductList}" var="newProductVO" step="3" varStatus="idx">
                            	
                                <div>
                                	
                                	<c:forEach var="j" begin="${idx.index}" end="${idx.index+2}">
                                	
                                    <div class="media">
                                        <a href="${contextPath}/items/${newProductList[j].id}"><img class="img-fluid blur-up lazyload"
                                                src="${newProductList[j].thumb_file_url}" alt=""></a>
                                        <div class="media-body align-self-center">
                                        
                                            <a href="${contextPath}/items/${newProductList[j].id}">
                                                <h6 >${newProductList[j].name}</h6>
                                            </a>
                                            <h4>$${newProductList[j].price}</h4>
                                        </div>
                                    </div>

                                    </c:forEach>
                                    
                                </div>
                                </c:forEach>
                                
                            </div>
                        </div>
                       
                        <!-- side-bar banner end here -->
                    </div>
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
                                                        	
                                                            <input id="filterText" class="form-control"
																				placeholder="상품 검색하기">
															
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
                                                <c:forEach items="${selectMainItemList}" var="selectItemVO">
                                                <div class="col-xl-3 col-6 col-grid-box">
                                                    <div class="product-box">
                                                        <div class="img-wrapper">
                                                            <div class="front">
                                                                <a href="${contextPath}/items/${selectItemVO.id}"><img src="${selectItemVO.thumb_file_url}"
                                                                        class="img-fluid blur-up lazyload bg-img"
                                                                        alt=""></a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="${contextPath}/items/${selectItemVO.id}"><img src="${selectItemVO.thumb_file_url}"
                                                                        class="img-fluid blur-up lazyload bg-img"
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
                                                                    <h6>[${selectItemVO.store_name}] ${selectItemVO.name}</h6>
                                                                </a>
                                                                
                                                                <h4>$${selectItemVO.price}</h4>
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
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- section End -->


    <!-- footer start -->
    <jsp:include page="footer.jsp"></jsp:include>
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