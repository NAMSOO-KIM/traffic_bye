<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="item" value="${item}" />
<c:set var="itemDetailList" value="${itemDetailList}" />
<c:set var="store" value="${store}" />




<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="icon" href="${contextPath}/resources/imgs/favicon.ico" type="image/x-icon">

</head>
<jsp:include page="header.jsp"></jsp:include>
<body class="theme-color-1">

	<!--Modal: modalVM-->
	<div class="modal fade" id="modalVM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	  aria-hidden="true">
	  <div class="modal-dialog modal-xl" role="document">
	
	    <!--Content-->
	    <div class="modal-content">
	    	
	    	<div>
	    		<p class="modal-title" style="font-size: 20px; font-weight: 700; color: black; text-align: center; padding-top: 20px;">매장 이름</p>
	    	</div>
	
	      	<!--Body-->
	    	<div class="modal-body">
	
		        <div class="" id="modal-video" style="text-align: center;">
					<img src="" width="640" height="480" id="mjpeg-stream"/>
		        </div>
		        
		        <div>
		        	<span class="modal-capacity" style="font-size: 15px; font-weight: 500; color: black; text-align: center; padding-top: 20px;">혼잡도 : </span>
		        	<span class="json-data" style="font-size: 15px; font-weight: 500; color: black; text-align: center; padding-top: 20px;">-</span>
		        </div>
	
	      	</div>
	
	      <!--Footer-->
	      <div class="modal-footer justify-content-center flex-column flex-md-row">
	      	<button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4"
	          data-dismiss="modal" id="modal-detail-btn">상세</button>
	        <button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4"
	          data-dismiss="modal" id="modal-close-btn">닫기</button>
	      </div>
	
	    </div>
	    <!--/.Content-->
	
	  </div>
	</div>
	<!--Modal: modalVM-->

    <!-- breadcrumb start -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-title">
                        <h2>product</h2>
                    </div>
                </div>
                <div class="col-sm-6">
                    <nav aria-label="breadcrumb" class="theme-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">product</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb End -->


    <!-- section start -->
    <section class="section-b-space">
        <div class="collection-wrapper">
            <div class="container">
                <div class="row data-sticky_parent">
                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="container-fluid p-0">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-12 product_img_scroll image-scroll" data-sticky_column>
                                            <div>
                                            	<div><img src="${item.main_thumb_file_url}" alt=" "
	                                                        class="img-fluid blur-up lazyload" width="546px" height="742px"></div>
                                            	
                                            	<c:forEach items="${itemDetailList}" var="itemDetailVO">
                                            		
	                                                <div><img src="${itemDetailVO.origin_file_url}" alt=" "
	                                                        class="img-fluid blur-up lazyload" width="546px" height="742px" onerror="this.style.display='none'"></div>

                                                </c:forEach>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 rtl-text">
                                    <div class="product-right pro_sticky_info" data-sticky_column>
                                        <h2>[${store.name}] ${item.name}</h2>
                                        <input type="text" id="item_id" value="${item.id}" style= "display:none"/>
                                       
                                         
                                        <div class="label-section">
                                            <span class="badge badge-grey-color">남은 재고 수량</span>
                                            <span class="label-text" id="remain-stock" data-point="${item.stock}">${item.stock}</span>
                                        </div>
                                        <h3 class="price-detail">$${item.price}</h3>
                                        
                                        <div id="selectSize"
                                            class="addeffect-section product-description border-product">
                                           
                                            <div class="modal fade" id="sizemodal" tabindex="-1" role="dialog"
                                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Sheer
                                                                Straight Kurta</h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"><span
                                                                    aria-hidden="true">&times;</span></button>
                                                        </div>
                                                        <div class="modal-body"><img
                                                                src="${contextPath}/resources/assets/images/size-chart.jpg" alt=""
                                                                class="img-fluid blur-up lazyload"></div>
                                                    </div>
                                                </div>
                                            </div>
                                           
                                            <h6 class="product-title">quantity</h6>
                                            <div class="qty-box">
                                                <div class="input-group"><span class="input-group-prepend"><button
                                                            type="button" class="btn quantity-left-minus"
                                                            data-type="minus" data-field=""><i
                                                                class="ti-angle-left"></i></button> </span>
                                                    <input type="text" name="quantity" id="selected-quantity" class="form-control input-number"
                                                        value="1"> <span class="input-group-prepend"><button
                                                            type="button" class="btn quantity-right-plus"
                                                            data-type="plus" data-field=""><i
                                                                class="ti-angle-right"></i></button></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-buttons"><a href="javascript:void(0)" id="cartEffect"
                                                class="btn btn-solid hover-solid btn-animation"><i
                                                    class="fa fa-shopping-cart me-1" aria-hidden="true"></i> add to
                                                cart</a> <a href="#" class="btn btn-solid" id="addCartBtn"><i
                                                    class="fa fa-bookmark fz-16 me-2"
                                                    aria-hidden="true"></i>wishlist</a></div>
                                        
                                        
                                        <div class="product-count">
                                            <ul>
                                                <li>
                                                    <img src="${contextPath}/resources/assets/images/icon/truck.png" class="img-fluid"
                                                        alt="image">
                                                    <span class="lang">사이렌 오더 가능 상품</span>
                                                </li>
                                            </ul>
                                        </div>
                                        
                                        <div class="border-product">
                                        	<a href="${contextPath}/store/${store.id}">
                                            	<h6 class="product-title">${store.name}</h6>
                                            </a>
                                            <div class="product-icon">
                                            	
                                            	 
                                            	<h5>위치 : ${store.location}</h5>
                                            	
                                            </div>
                                        </div>
                                         
                                        <div class="store-view">
                                        	<span class="btn btn-solid btn-sm btn-xs me-3" id="complex-btn">혼잡도 보기</span>
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
    <!-- Section ends -->

	
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
                                        <a href="${contextPath}/store/${store.id}"><img src="${store.repre_file_url}"
                                                class="img-fluid blur-up lazyload" alt=""></a>
                                        <div class="top-banner-content small-section">
                                            <h4>${store.name}</h4>
                                            <p>${store.detail}</p>
                                        </div>
                                    </div>
                                
                            </div>
                            
                        </div>
                        <div class="tab-pane fade" id="top-profile" role="tabpanel" aria-labelledby="profile-top-tab">
                            <p>The Model is wearing a white blouse from our stylist's collection, see the image for a
                                mock-up of what the actual blouse would look like.it has text written on it in a black
                                cursive language which looks great on a white color.</p>
                            <div class="single-product-tables">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>Sleeve Length</td>
                                            <td>Sleevless</td>
                                        </tr>
                                        <tr>
                                            <td>Neck</td>
                                            <td>Round Neck</td>
                                        </tr>
                                        <tr>
                                            <td>Occasion</td>
                                            <td>Sports</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>Fabric</td>
                                            <td>Polyester</td>
                                        </tr>
                                        <tr>
                                            <td>Fit</td>
                                            <td>Regular Fit</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="top-contact" role="tabpanel" aria-labelledby="contact-top-tab">
                            <div class="">
                                <iframe width="560" height="315" src="https://www.youtube.com/embed/BUWzX78Ye_8"
                                    allow="autoplay; encrypted-media" allowfullscreen></iframe>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="top-review" role="tabpanel" aria-labelledby="review-top-tab">
                            <form class="theme-form">
                                <div class="form-row row">
                                    <div class="col-md-12">
                                        <div class="media">
                                        	
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="name">Name</label>
                                        <input type="text" class="form-control" id="name" placeholder="Enter Your name"
                                            required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" id="email" placeholder="Email" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="review">Review Title</label>
                                        <input type="text" class="form-control" id="review"
                                            placeholder="Enter your Review Subjects" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="review">Review Title</label>
                                        <textarea class="form-control" placeholder="Wrire Your Testimonial Here"
                                            id="exampleFormControlTextarea1" rows="6"></textarea>
                                    </div>
                                    <div class="col-md-12">
                                        <button class="btn btn-solid" type="submit">Submit YOur
                                            Review</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product-tab ends -->


    <!-- product section start -->
    <section class="section-b-space ratio_asos">
        <div class="container">
            <div class="row">
                <div class="col-12 product-related">
                    <h2>related products</h2>
                </div>
            </div>
            <div class="row search-product">
              <c:forEach items="${RelatedItemlist}" var="RelatedItemVar">       
                <div class="col-xl-2 col-md-4 col-6">
                    <div class="product-box">
                        <div class="img-wrapper">
                            <div class="front">
                                <a href="${contextPath}/items/${RelatedItemVar.id}"><img src="${RelatedItemVar.main_thumb_file_url}"
                                        class="img-fluid blur-up lazyload bg-img" alt=""></a>
                            </div>
                            <div class="back">
                                <a href="${contextPath}/items/${RelatedItemVar.id}"><img src="${RelatedItemVar.main_thumb_file_url}"
                                        class="img-fluid blur-up lazyload bg-img" alt=""></a>
                            </div>
                            
                        </div>
                        <div class="product-detail">
                        	<!-- 
                            <div class="rating"><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i></div>
                            -->
                            <a href="product-page(no-sidebar).html">
                                <h6>[${RelatedItemVar.store_name}] ${RelatedItemVar.name}</h6>
                            </a>
                            <h4>$${RelatedItemVar.price}</h4>
                            
                        </div>
                    </div>
                </div>
              </c:forEach>
                
            </div>
        </div>
    </section>
    <!-- product section end -->

	<jsp:include page="footer.jsp"></jsp:include>

    <!-- theme setting -->
    
    <!-- theme setting -->
	

    <!-- Add to cart modal popup start-->
   
    <!-- Add to cart modal popup end-->

    <!-- added to cart notification -->
    <div class="added-notification">
        <img src="${item.main_thumb_file_url}" class="img-fluid" alt="">
        <h3>상품이 장바구니에 등록 되었습니다.</h3>
    </div>
    <!-- added to cart notification -->



    <!-- sticky sidebar -->
    <script type="text/javascript" src="${contextPath}/resources/assets/js/sticky-kit.js"></script>
	

    <script>
		var timer;
		var storeCapacity;
		function openSearch() {
			document.getElementById("search-overlay").style.display = "block";
		}

		function closeSearch() {
			document.getElementById("search-overlay").style.display = "none";
		}
		
		function getCapacity(duration){
			timer = duration * 3600;
			
			var interval = setInterval(function(){
				
				$.ajax({
					url: "http://175.205.200.40:8080/store2.txt",
					method: "GET",
					dataType: "json",
					success : function(data){
						console.log(data.objects);
						var personCnt = 0;
						for(var i = 0; i < data.objects.length; i++){
							if(data.objects[i].name === 'person'){
								personCnt++;
							}
						}
						
						console.log('person cnt : ' + personCnt);
						
						var percent = parseInt((personCnt / storeCapacity) * 100);
						console.log('percent : ' + percent + '%');
						
						if(percent < 60){
							$('.json-data').html('원활');
						} else if(60 < percent && percent < 80){
							$('.json-data').html('혼잡');
						} else{
							$('.json-data').html('포화');
						}
						
					},
					complete : function(){
						console.log("complete");
					}
				});
				
			
				
			if(--timer < 0){
				timer = 0;
				clearInterval(interval);
			}
			}, 1000);
		}
		
		$(document).ready(function(){
			var imgTime = 3600 * 3;
			$('#complex-btn').click(function(){
				console.log($(this).data('storeid'));
				$('#modalVM').modal('show');
				
				$('.modal-title').text('${store.name}');
				$('.modal-title').attr('data-storeid', '${store.id}');
				
				storeCapacity = ${store.capacity};
				
				getCapacity(3);
				imgTime = 3600*3;
				var imgInterval = setInterval(function(){
					var url = 'http://175.205.200.40:8080/store/2/video?frame=' + imgTime;
					
					$('#mjpeg-stream').attr('src', url);
					
					console.log('img time : ' + imgTime);
					
					if(--imgTime < 0){
						imgTime = 0;
						clearInterval(imgInterval);
					}
					
				}, 1000);
			});
			
			$('#modal-close-btn').click(function(){
				$('#modalVM').modal('hide');
			});
			$('#modal-detail-btn').click(function(){
				window.location.href = '/app/store/' + ${store.id};
			});
			
			$('#modalVM').on('hidden.bs.modal', function () {
				timer = 0;
				imgTime = 0;
			});
			
			
            if ($(window).width() > 991) {	
                $(".product_img_scroll, .pro_sticky_info").stick_in_parent();	
            }	
	        		
	        
			
		});
	</script>
</body>

</html>