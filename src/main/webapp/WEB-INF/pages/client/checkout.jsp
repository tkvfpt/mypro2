<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <title>${shop.name }</title>

    <link href="https://fonts.googleapis.com/css?family=PT+Serif:400,400i,700,700ii%7CRoboto:300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/ion.rangeSlider.skinFlat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/jquery.bxslider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/jquery.fancybox.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/flexslider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/swiper.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/swiper.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/client/css/media.css">
    </head>
    <body>
<!-- Header - start -->
<header class="header">

    <!-- Topbar - start -->
    <div class="header_top">
        <div class="container">
            <ul class="contactinfo nav nav-pills">
                <li>
                    <i class='fa fa-phone'></i> +${shop.phone }
                </li>
                <li>
                    <i class="fa fa-envelope"></i> ${shop.mail }
                </li>
            </ul>
            <!-- Social links -->
            <ul class="social-icons nav navbar-nav">
                <li>
                    <a href="${shop.fanpageUrl }" rel="nofollow" target="_blank">
                        <i class="fa fa-facebook"></i>
                    </a>
                </li>
                <li>
                    <a href="http://google.com" rel="nofollow" target="_blank">
                        <i class="fa fa-google-plus"></i>
                    </a>
                </li>
                <li>
                    <a href="${shop.twitter }" rel="nofollow" target="_blank">
                        <i class="fa fa-twitter"></i>
                    </a>
                </li>
                
            </ul>		</div>
    </div>
    <!-- Topbar - end -->

    <!-- Logo, Shop-menu - start -->
    <div class="header-middle">
        <div class="container header-middle-cont">
            <div class="toplogo">
                <a href="index.html">
                    <img src="${shop.logo }" alt="${shop.name }">
                </a>
            </div>
            <div class="shop-menu">
                <ul>

                    
                    <li class="topauth">
                        <a href="auth.html">
                            <span class="shop-menu-ttl">Login</span>
                        </a>
                    </li>

                    <li>
                        <div class="h-cart">
                           <a href="${pageContext.request.contextPath }/product/cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="shop-menu-ttl">Cart</span>
                                (<b>${sessionScope.listCart.size() }</b>)
                            </a>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <!-- Logo, Shop-menu - end -->

    <!-- Topmenu - start -->
    <div class="header-bottom">
        <div class="container">
            <nav class="topmenu">

                <!-- Catalog menu - start -->
                <div class="topcatalog">
                    <a class="topcatalog-btn" href="catalog-list.html"><span>All</span> catalog</a>
                    <ul class="topcatalog-list">
                        <c:forEach items="${requestScope.cates }" var="cate">
                        	<li><a href="${pageContext.request.contextPath}/product/list">${cate.name }</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- Catalog menu - end -->

                <!-- Main menu - start -->
                <button type="button" class="mainmenu-btn">Menu</button>

                <ul class="mainmenu">
                    <li>
                        <a href="index.html" class="active">
                            Home
                        </a>
                    </li>
                    <li class="menu-item-has-children">
                        
                    <li class="menu-item-has-children">
                        <a href="${pageContext.request.contextPath}/product/list">
                            Product <i class="fa fa-angle-down"></i>
                        </a>
                    </li>
                    
                </ul>
                <!-- Main menu - end -->

                <!-- Search - start -->
                <div class="topsearch">
                    <a id="topsearch-btn" class="topsearch-btn" href="#"><i class="fa fa-search"></i></a>
                    <form class="topsearch-form" action="#">
                        <input type="text" placeholder="Search products">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
                <!-- Search - end -->

            </nav>		</div>
    </div>
    <!-- Topmenu - end -->

</header>
<!-- Header - end -->


<!-- Main Content - start -->
<main>
<section class="container stylization maincont">
<form action="${pageContext.request.contextPath }/product/checkout">
	<c:if test="${sessionScope.client == null}">
		<input type="text" data-required="text" placeholder="Name" name="fullname">
		<input type="text" placeholder="Phone" name="phone" onkeypress="checkNumb(this)">
		<span style="color:red" id="error"></span>
		<input data-required="text" data-required-email="email" type="text" placeholder="Email" name="email">
		<input type="text" placeholder="Woker" name="occupation">
		<input type="text" placeholder="Age" name="age">
	</c:if>
	<input data-required="text" type="text" placeholder="Address" name="address">
	<input type="text" placeholder="District" name="district">
	<input type="text" placeholder="Ho Chi Minh" name="city">
	
	<input type="submit" value="Send">
</form>
<script>
	function checkNumb(input){
		var phoneno = /^\d{8,12}$/;
		if( input.value.match(phoneno) ){
			document.getElementById("error").innerHTML = "";
    		}else{
    			document.getElementById("error").innerHTML = "phone number must be a valid number";	
        		}
	}
</script>
    </section>

</main>
<!-- Main Content - end -->


<!-- Footer - start -->
<footer class="footer-wrap">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="companyinfo">
                    <a href="index.html">
                        <img src="img/logo-b.png" alt="AllStore - MultiConcept eCommerce Responsive HTML5 Template">
                        AllStore - MultiConcept eCommerce Responsive HTML5 Template
                    </a>
                </div>
                <div class="f-block-list">
                    <div class="f-block-wrap">
                        <div class="f-block">
                            <a href="#" class="f-block-btn" data-id="#f-block-modal-1">
                                <div class="iframe-img">
                                    <img src="http://placehold.it/300x127" alt="About us">
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-info-circle"></i>
                                </div>
                            </a>
                            <p class="f-info-ttl">About us</p>
                            <p>Shipping and payment information.</p>
                        </div>
                    </div>
                    <div class="f-block-wrap">
                        <div class="f-block">
                            <a href="#" class="f-block-btn" data-id="#f-block-modal-2">
                                <div class="iframe-img">
                                    <img src="http://placehold.it/300x127" alt="Ask questions">
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                            </a>
                            <p class="f-info-ttl">Ask questions</p>
                            <p>We call back within 10 minutes</p>
                        </div>
                    </div>
                    <div class="f-block-wrap">
                        <div class="f-block">
                            <a href="#" class="f-block-btn" data-id="#f-block-modal-3" data-content="<iframe width='853' height='480' src='https://www.youtube.com/embed/kaOVHSkDoPY?rel=0&amp;showinfo=0' allowfullscreen></iframe>">
                                <div class="iframe-img">
                                    <img src="http://placehold.it/300x127" alt="Video (2 min)">
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-play-circle"></i>
                                </div>
                            </a>
                            <p class="f-info-ttl">Video (2 min)</p>
                            <p>Watch a video about our store</p>
                        </div>
                    </div>
                    <div class="f-block-wrap">
                        <div class="f-block">
                            <a href="#" class="f-block-btn" data-id="#f-block-modal-4">
                                <div class="iframe-img">
                                    <img src="http://placehold.it/300x127" alt="Our address">
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                            </a>
                            <p class="f-info-ttl">Our address</p>
                            <p>Spain, Madrid, 45</p>
                        </div>
                    </div>
                </div>

                <div class="stylization f-block-modal f-block-modal-content" id="f-block-modal-1">
                    <img class="f-block-modal-img" src="http://placehold.it/500x334" alt="About us">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam natus iste ullam vero, tenetur ab ipsa consectetur deleniti officiis ex debitis incidunt alias voluptatum, maxime placeat dolores veniam sunt at atque velit, soluta. Neque ea alias quia provident molestias, ratione aut esse placeat beatae sequi sed laudantium. Unde animi nihil esse, repellendus exercitationem dicta harum ab labore, voluptates explicabo in, quidem dolorum voluptas!
                </div>
                <div class="stylization f-block-modal f-block-modal-callback" id="f-block-modal-2">
                    <div class="modalform">
                        <form action="#" method="POST" class="form-validate">
                            <p class="modalform-ttl">Callback</p>
                            <input type="text" placeholder="Your name" data-required="text" name="name">
                            <input type="text" placeholder="Your phone" data-required="text" name="phone">
                            <button type="submit"><i class="fa fa-paper-plane"></i> Send</button>
                        </form>
                    </div>
                </div>
                <div class="stylization f-block-modal f-block-modal-video" id="f-block-modal-3">

                </div>
                <div class="stylization f-block-modal f-block-modal-map" id="f-block-modal-4">
                    <div class="allstore-gmap">
                        <div class="marker" data-zoom="15" data-lat="-37.81485261872975" data-lng="144.95655298233032" data-marker="img/marker.png">534-540 Little Bourke St, Melbourne VIC 3000, Australia</div>
                    </div>
                </div>
                <div class="f-delivery">
                    <img src="img/map.png" alt="">
                    <h4>Free delivery in London</h4>
                    <p>We will deliver within 1 hour</p>
                </div>
            </div>
        </div>
    </div>

    <div class="container f-menu-list">
        <div class="row">
            <div class="f-menu">
                <h3>
                    About us
                </h3>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="catalog-list.html">Catalog</a></li>
                    <li><a href="elements.html">Elements</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="contacts.html">Contacts</a></li>
                </ul>
            </div>
            <div class="f-menu">
                <h3>
                    Shop
                </h3>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="catalog-list.html">Women</a></li>
                    <li><a href="catalog-list.html">Men</a></li>
                    <li><a href="catalog-list.html">Kids</a></li>
                    <li><a href="catalog-list.html">Shoes</a></li>
                    <li><a href="catalog-list.html">Accessories</a></li>
                </ul>
            </div>
            <div class="f-menu">
                <h3>
                    Information
                </h3>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="blog.html">News</a></li>
                    <li><a href="reviews.html">Reviews</a></li>
                    <li><a href="blog.html">Articles</a></li>
                    <li><a href="contacts.html">Contacts</a></li>
                </ul>
            </div>
            <div class="f-menu">
                <h3>
                    Pages
                </h3>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="contacts.html">About us</a></li>
                    <li><a href="contacts.html">Delivery</a></li>
                    <li><a href="contacts.html">Guarantees</a></li>
                    <li><a href="contacts.html">Contacts</a></li>
                    <li><a href="404.html">Page 404</a></li>
                </ul>
            </div>
            <div class="f-subscribe">
                <h3>Subscribe to news</h3>
                <form class="f-subscribe-form" action="#">
                    <input placeholder="Your e-mail" type="text">
                    <button type="submit"><i class="fa fa-paper-plane"></i></button>
                </form>
                <p>Enter your email address if you want to receive our newsletter. Subscribe now!</p>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <ul class="social-icons nav navbar-nav">
                    <li>
                        <a href="http://facebook.com/" rel="nofollow" target="_blank">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://google.com/" rel="nofollow" target="_blank">
                            <i class="fa fa-google-plus"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://twitter.com/" rel="nofollow" target="_blank">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://vk.com/" rel="nofollow" target="_blank">
                            <i class="fa fa-vk"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://instagram.com/" rel="nofollow" target="_blank">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </li>
                </ul>
                <div class="footer-copyright">
                    <i><a href="https://themeforest.net/user/real-web?ref=real-web">Real-Web</a></i> © Copyright 2017
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- Footer - end -->


<!-- jQuery plugins/scripts - start -->
<script src="${pageContext.request.contextPath}/resource/client/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/fancybox/fancybox.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/fancybox/helpers/jquery.fancybox-thumbs.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/jquery.flexslider-min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/swiper.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/progressbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/jQuery.Brazzers-Carousel.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/main.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhAYvx0GmLyN5hlf6Uv_e9pPvUT3YpozE"></script>
<script src="${pageContext.request.contextPath}/resource/client/js/gmap.js"></script>
<!-- jQuery plugins/scripts - end -->

</body>
</html>