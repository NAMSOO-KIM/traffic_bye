<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

 <!-- tracking page start -->
    <section class="tracking-page section-b-space">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h3>status for order no: 54151548</h3>
                    <div class="row border-part">
                        <div class="col-xl-2 col-md-3 col-sm-4">
                            <div class="product-detail">
                                <img src="../assets/images/fashion/pro/1.jpg" class="img-fluid blur-up lazyload" alt="">
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 col-sm-8">
                            <div class="tracking-detail">
                                <ul>
                                    <li>
                                        <div class="left">
                                            <span>Order name</span>
                                        </div>
                                        <div class="right">
                                            <span>Slim Fit Dress</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left">
                                            <span>customer number</span>
                                        </div>
                                        <div class="right">
                                            <span>54151548</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left">
                                            <span>order date</span>
                                        </div>
                                        <div class="right">
                                            <span>20 Nov 2020</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left">
                                            <span>Ship Date</span>
                                        </div>
                                        <div class="right">
                                            <span>20 Nov 2020</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left">
                                            <span>shipping address</span>
                                        </div>
                                        <div class="right">
                                            <span>2253 Short Street <br>Austin, TX<br>Texas, 78701</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left">
                                            <span>carrier</span>
                                        </div>
                                        <div class="right">
                                            <span>FedEx</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left">
                                            <span>carrier tracking number</span>
                                        </div>
                                        <div class="right">
                                            <span>656974541515484</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-4">
                            <div class="order-map">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d55107.59629446948!2d-97.77629221286301!3d30.316123884942762!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8644ca7d7a2a6d0d%3A0x209a4c2782a39461!2sCentral%20Market!5e0!3m2!1sen!2sin!4v1607754725548!5m2!1sen!2sin"
                                    frameborder="0" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="arrow-steps clearfix">
                            <div class="step done"> <span> order placed</span> </div>
                            <div class="step current"> <span>preparing to ship</span> </div>
                            <div class="step"><span> shipped</span> </div>
                            <div class="step"><span>delivered</span> </div>
                        </div>
                    </div>
                    <div class="order-table table-responsive-sm">
                        <table class="table mb-0 table-striped table-borderless">
                            <thead class="">
                                <tr>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Location</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>20 Nov 2020</td>
                                    <td>12.00 AM</td>
                                    <td>shipped</td>
                                    <td>california</td>
                                </tr>
                                <tr>
                                    <td>20 Nov 2020</td>
                                    <td>12.00 AM</td>
                                    <td>shipping info received</td>
                                    <td>california</td>
                                </tr>
                                <tr>
                                    <td>20 Nov 2020</td>
                                    <td>12.00 AM</td>
                                    <td>origin scan</td>
                                    <td>california</td>
                                </tr>
                                <tr>
                                    <td>20 Nov 2020</td>
                                    <td>12.00 AM</td>
                                    <td>shipping info received</td>
                                    <td>california</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- tracking page end -->
    
    
    <jsp:include page="../footer.jsp"></jsp:include>
	<script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src =
                'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
	<!-- Your customer chat code -->
	<div class="fb-customerchat" attribution=setup_tool
		page_id="2123438804574660" theme_color="#0084ff"
		logged_in_greeting="Hi! Welcome to PixelStrap Themes  How can we help you?"
		logged_out_greeting="Hi! Welcome to PixelStrap Themes  How can we help you?">
	</div>
	<!-- facebook chat section end -->


	<!-- tap to top -->
	<div class="tap-top top-cls">
		<div>
			<i class="fa fa-angle-double-up"></i>
		</div>
	</div>
	<!-- tap to top end -->




	<!-- slick js-->
	<script src="${contextPath}/resources/assets/js/slick.js"></script>

	<!-- menu js-->
	<script src="${contextPath}/resources/assets/js/menu.js"></script>

	<!-- lazyload js-->
	<script src="${contextPath}/resources/assets/js/lazysizes.min.js"></script>

	<!-- Bootstrap js-->
	<script
		src="${contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Bootstrap Notification js-->
	<script
		src="${contextPath}/resources/assets/js/bootstrap-notify.min.js"></script>

	<!-- Fly cart js-->
	<script src="${contextPath}/resources/assets/js/fly-cart.js"></script>

	<!-- Theme js-->
	<script src="${contextPath}/resources/assets/js/theme-setting.js"></script>
	<script src="${contextPath}/resources/assets/js/script.js"></script>
    
	<script>
        function openSearch() {
            document.getElementById("search-overlay").style.display = "block";
        }

        function closeSearch() {
            document.getElementById("search-overlay").style.display = "none";
        }
    </script>
    

</body>
</html>