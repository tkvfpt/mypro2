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
    <section class="container">


        <!-- Slider -->
        <div class="fr-slider-wrap">
            <div class="fr-slider">
                <ul class="slides">
                <c:forEach var="obj" items="${requestScope.list}">
                    <li>
                        <img src="${obj.imagePath }" alt="">
                        <div class="fr-slider-cont">
                            <h3>${obj.name }</h3>
                            <p>${obj.description }</p>
                            <p class="fr-slider-more-wrap">
                                <a class="fr-slider-more" href="${pageContext.request.contextPath}/product/list">View collection</a>
                            </p>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>


        <!-- Popular Products -->
        <div class="fr-pop-wrap">

            <h3 class="component-ttl"><span>Popular products</span></h3>

            <div class="fr-pop-tab-cont">

                <p data-frpoptab-num="1" class="fr-pop-tab-mob active" data-frpoptab="#frpoptab-tab-1">All Categories</p>
				<div class="flexslider prod-items fr-pop-tab" id="frpoptab-tab-1">
                <div class="flex-viewport" style="overflow: hidden; position: relative;"><ul class="slides" style="width: 7200%; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
				<c:forEach var="obj" items="${requestScope.list}">
                        <li class="prod-i" style="width: 276px; margin-right: 12px; float: left; display: block;">
                            <div class="prod-i-top">
                                <a href="${pageContext.request.contextPath }/product/detail?id=${obj.id}" class="prod-i-img"><!-- NO SPACE --><img src="${obj.imagePath }" alt="${obj.name }" draggable="false"><!-- NO SPACE --></a>
                                <p class="prod-i-info">
                                    <a href="${pageContext.request.contextPath }/product/detail?id=${obj.id}" class="qview-btn prod-i-qview"><span>Quick View</span><i class="fa fa-search"></i></a>
                                </p>
                                <p class="prod-i-addwrap">
                                    <a href="${pageContext.request.contextPath }/product/addcart?id=${obj.id}" class="prod-i-add">Add to cart</a>
                                </p>
                            </div>
                            <h3>
                                <a href="${pageContext.request.contextPath }/product/detail?id=${obj.id}">${obj.name }</a>
                            </h3>
                            <p class="prod-i-price">
                                <b>$${obj.price }</b>
                            </p>
                        </li>
				</c:forEach>
                    </ul></div>
                    <ol class="flex-control-nav flex-control-paging">
                    <li>
                    <a href="#" class="flex-active">1</a>
                    </li>
                    <li>
                    <a href="#">2</a>
                    </li>
                    <li>
                    <a href="#">3</a>
                    </li><li><a href="#">4</a></li><li><a href="#">5</a></li><li><a href="#">6</a>

            </div><!-- .fr-pop-tab-cont -->


        </div><!-- .fr-pop-wrap -->


        


        <!-- Special offer -->
        <div class="discounts-wrap">
            <h3 class="component-ttl"><span>Special Product</span></h3>
            <div class="flexslider discounts-list">
                <ul class="slides">
                	<c:forEach var="obj" items="${requestScope.list }">
                    <li class="discounts-i">
                        <a href="product.html" class="discounts-i-img">
                            <img src="${obj.imagePath }" alt="${obj.name }">
                        </a>
                        <h3 class="discounts-i-ttl">
                            <a href="${pageContext.request.contextPath }/product/detail?id=${obj.id}">${obj.name }</a>
                        </h3>
                        <p>
                           ${obj.price }
                        </p>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="discounts-info">
                <p>Special offer!<br>Limited time only</p>
                <a href="catalog-list.html">Shop now</a>
            </div>
        </div>


        <!-- Latest news -->
        <div class="posts-wrap">
            <div class="posts-list">
                <div class="posts-i">
                    <a class="posts-i-img" href="post.html">
                        <span style="background: url(http://placehold.it/354x236)"></span>
                    </a>
                    <time class="posts-i-date" datetime="2016-11-09 00:00:00"><span>30</span> Jan</time>
                    <div class="posts-i-info">
                        <a href="blog.html" class="posts-i-ctg">Reviews</a>
                        <h3 class="posts-i-ttl">
                            <a href="post.html">Animi quaerat at</a>
                        </h3>
                    </div>
                </div>
                <div class="posts-i">
                    <a class="posts-i-img" href="post.html">
                        <span style="background: url(http://placehold.it/354x236)"></span>
                    </a>
                    <time class="posts-i-date" datetime="2016-11-09 00:00:00"><span>29</span> Jan</time>
                    <div class="posts-i-info">
                        <a href="blog.html" class="posts-i-ctg">Articles</a>
                        <h3 class="posts-i-ttl">
                            <a href="post.html">Ex atque commodi</a>
                        </h3>
                    </div>
                </div>
                <div class="posts-i">
                    <a class="posts-i-img" href="post.html">
                        <span style="background: url(http://placehold.it/354x236)"></span>
                    </a>
                    <time class="posts-i-date" datetime="2016-11-09 00:00:00"><span>25</span> Jan</time>
                    <div class="posts-i-info">
                        <a href="blog.html" class="posts-i-ctg">News</a>
                        <h3 class="posts-i-ttl">
                            <a href="post.html">Hic quod maxime deserunt</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>


        <!-- Testimonials -->
        <div class="reviews-wrap">
            <div class="reviewscar-wrap">
                <div class="swiper-container reviewscar">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Corrupti velit, vero esse, aperiam error magni illum quos, accusantium debitis et possimus recusandae tempora ad itaque dolorem veniam non voluptatem impedit iste? Dicta doloremque hic porro aspernatur. Dolores eligendi similique, cumque, eius veritatis</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Distinctio modi, quos, vero quibusdam ab deserunt doloribus eligendi velit temporibus ratione at est officia repellat? Adipisci nemo expedita rerum distinctio laudantium nihil voluptatem ullam vel ex magnam velit aliquid voluptate voluptatum excepturi</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Similique delectus totam ex cum magnam quasi, ipsam officiis amet temporibus enim modi rerum quo maxime reprehenderit, deserunt, libero quas distinctio quos! Ullam harum nesciunt omnis consectetur distinctio? Iste sunt, dolorem deserunt quibusdam</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Tempora ea ratione vel nisi, qui perferendis nulla, fugit aut, beatae, tempore modi. Minus sequi iste, nam nobis, excepturi nihil consequuntur reprehenderit ipsam, quam consequatur in. Esse, doloremque consectetur veniam quo ut voluptas necessitatibus</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Perferendis recusandae consequuntur quasi, non culpa. Minus porro officiis veniam facilis praesentium expedita doloribus, recusandae aut dolore autem, modi consequuntur rem perferendis dolores quisquam, sequi quas. Iusto et, eius laboriosam beatae</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Aliquid soluta nisi incidunt, dolores sequi itaque sunt et nesciunt delectus ipsam est molestias illo obcaecati, totam ducimus cumque consequuntur modi, laudantium! Temporibus vero odit quis, quibusdam maiores voluptatum sunt dolor tempora architecto fugiat quam.</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Ea reiciendis modi, molestiae dolores beatae facere quas	consequatur delectus ducimus, magni voluptates, eius, quia unde ut vitae doloribus illum! Optio saepe, modi aliquid perferendis veniam</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Ea reiciendis modi, molestiae dolores beatae facere quas	consequatur delectus ducimus, magni voluptates, eius, quia unde ut vitae doloribus illum! Optio saepe, modi aliquid perferendis veniam</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Quod soluta corrupti earum officia vel inventore vitae quidem, consequuntur odit impedit, eaque dolorem odio praesentium iusto amet voluptatum distinctio iste dicta maiores doloremque porro. Ipsa doloremque illum animi laborum quo in nemo delectus</p>
                        </div>
                        <div class="swiper-slide">
                            <p>Eveniet nobis minus possimus eius, doloribus ex similique debitis nihil at facere delectus unde, commodi, alias. Eius facilis, dolore officia veritatis, doloribus voluptatem aliquid rem corporis quam officiis at dignissimos dolorum, velit assumenda</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Subscribe Form -->
        <div class="newsletter">
            <h3>Subscribe to us</h3>
            <p>Enter your email if you want to receive our news</p>
            <form action="#">
                <input placeholder="Your e-mail" type="text">
                <input name="OK" value="Subscribe" type="submit">
            </form>
        </div>

        <!-- Quick View Product - start -->
        <div class="qview-modal">
            <div class="prod-wrap">
                <a href="product.html">
                    <h1 class="main-ttl">
                        <span>Reprehenderit adipisci</span>
                    </h1>
                </a>
                <div class="prod-slider-wrap">
                    <div class="prod-slider">
                        <ul class="prod-slider-car">
                            <li>
                                <a data-fancybox-group="popup-product" class="fancy-img" href="http://placehold.it/500x525">
                                    <img src="http://placehold.it/500x525" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="popup-product" class="fancy-img" href="http://placehold.it/500x591">
                                    <img src="http://placehold.it/500x591" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="popup-product" class="fancy-img" href="http://placehold.it/500x525">
                                    <img src="http://placehold.it/500x525" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="popup-product" class="fancy-img" href="http://placehold.it/500x722">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="popup-product" class="fancy-img" href="http://placehold.it/500x722">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="popup-product" class="fancy-img" href="http://placehold.it/500x722">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="popup-product" class="fancy-img" href="http://placehold.it/500x722">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="prod-thumbs">
                        <ul class="prod-thumbs-car">
                            <li>
                                <a data-slide-index="0" href="#">
                                    <img src="http://placehold.it/500x525" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-slide-index="1" href="#">
                                    <img src="http://placehold.it/500x591" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-slide-index="2" href="#">
                                    <img src="http://placehold.it/500x525" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-slide-index="3" href="#">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-slide-index="4" href="#">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-slide-index="5" href="#">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-slide-index="6" href="#">
                                    <img src="http://placehold.it/500x722" alt="">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="prod-cont">
                    <p class="prod-actions">
                        <a href="#" class="prod-favorites"><i class="fa fa-heart"></i> Add to Wishlist</a>
                        <a href="#" class="prod-compare"><i class="fa fa-bar-chart"></i> Compare</a>
                    </p>
                    <div class="prod-skuwrap">
                        <p class="prod-skuttl">Color</p>
                        <ul class="prod-skucolor">
                            <li class="active">
                                <img src="img/color/blue.jpg" alt="">
                            </li>
                            <li>
                                <img src="img/color/red.jpg" alt="">
                            </li>
                            <li>
                                <img src="img/color/green.jpg" alt="">
                            </li>
                            <li>
                                <img src="img/color/yellow.jpg" alt="">
                            </li>
                            <li>
                                <img src="img/color/purple.jpg" alt="">
                            </li>
                        </ul>
                        <p class="prod-skuttl">Sizes</p>
                        <div class="offer-props-select">
                            <p>XL</p>
                            <ul>
                                <li><a href="#">XS</a></li>
                                <li><a href="#">S</a></li>
                                <li><a href="#">M</a></li>
                                <li class="active"><a href="#">XL</a></li>
                                <li><a href="#">L</a></li>
                                <li><a href="#">4XL</a></li>
                                <li><a href="#">XXL</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="prod-info">
                        <p class="prod-price">
                            <b class="item_current_price">$238</b>
                        </p>
                        <p class="prod-qnt">
                            <input type="text" value="1">
                            <a href="#" class="prod-plus"><i class="fa fa-angle-up"></i></a>
                            <a href="#" class="prod-minus"><i class="fa fa-angle-down"></i></a>
                        </p>
                        <p class="prod-addwrap">
                            <a href="#" class="prod-add">Add to cart</a>
                        </p>
                    </div>
                    <ul class="prod-i-props">
                        <li>
                            <b>SKU</b> 05464207
                        </li>
                        <li>
                            <b>Manufacturer</b> Mayoral
                        </li>
                        <li>
                            <b>Material</b> Cotton
                        </li>
                        <li>
                            <b>Pattern Type</b> Print
                        </li>
                        <li>
                            <b>Wash</b> Colored
                        </li>
                        <li>
                            <b>Style</b> Cute
                        </li>
                        <li>
                            <b>Color</b> Blue, Red
                        </li>
                        <li><a href="#" class="prod-showprops">All Features</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Quick View Product - end -->
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