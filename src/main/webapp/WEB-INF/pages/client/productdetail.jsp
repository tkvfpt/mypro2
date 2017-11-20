<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <title>${p.name }</title>

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
                            <a href="cart.html">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="shop-menu-ttl">Cart</span>
                                (<b>0</b>)
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
		<h1 class="main-ttl"><span>${p.name }</span></h1>
		<!-- Single Product - start -->
		<div class="prod-wrap">

			<!-- Product Images -->
			<div class="prod-slider-wrap">
				<div class="prod-slider">
					<ul class="prod-slider-car">
						<li>
							<a data-fancybox-group="product" class="fancy-img" href="http://placehold.it/500x642">
								<img src="${p.imagePath }" alt="">
							</a>
						</li>
					</ul>
				</div>
			</div>

			<!-- Product Description/Info -->
			<div class="prod-cont">
				<div class="prod-cont-txt">
					${p.description }
				</div>
				<div class="prod-skuwrap">
					<p class="prod-skuttl">CLOTHING SIZES</p>
				</div>
				<div class="prod-info">
					<p class="prod-price">
						<b class="item_current_price">$ ${p.price }</b>
					</p>
					<form action="${pageContext.request.contextPath }/product/addcart">
					<p class="prod-qnt">
						<input value="1" type="text">
						<a href="#" class="prod-plus"><i class="fa fa-angle-up"></i></a>
						<a href="#" class="prod-minus"><i class="fa fa-angle-down"></i></a>
					</p>
					<p class="prod-addwrap">
						<input type="submit" class="prod-add" rel="nofollow" value="Add to cart"/>
					</p>
					</form>
				</div>
				<ul class="prod-i-props">
					<li>
						<b>Name</b> ${p.name }
					</li>
					<li>
						<b>Price</b> ${p.price }
					</li>
					<li>
						<b>Category</b> ${p.category.name } 
					</li>
					
				</ul>
			</div>

			<!-- Product Tabs -->
			<div class="prod-tabs-wrap">
				<ul class="prod-tabs">
					<li><a data-prodtab-num="1" class="active" href="#" data-prodtab="#prod-tab-1">Description</a></li>
					<li><a data-prodtab-num="2" id="prod-props" href="#" data-prodtab="#prod-tab-2">Features</a></li>
					<li><a data-prodtab-num="3" href="#" data-prodtab="#prod-tab-3">Video</a></li>
					<li><a data-prodtab-num="4" href="#" data-prodtab="#prod-tab-4">Articles (6)</a></li>
					<li><a data-prodtab-num="5" href="#" data-prodtab="#prod-tab-5">Reviews (3)</a></li>
				</ul>
				<div class="prod-tab-cont">

					<p data-prodtab-num="1" class="prod-tab-mob active" data-prodtab="#prod-tab-1">Description</p>
					<div class="prod-tab stylization" id="prod-tab-1">
						<p>Quis temporibus hic reprehenderit explicabo odio earum maxime cupiditate mollitia magni laboriosam illum adipisci, ipsam, repellendus optio esse dolorem incidunt debitis eius voluptate expedita assumenda. Praesentium iure inventore nostrum corporis illum, est asperiores accusamus, ducimus, accusantium natus illo</p>
						<p>Ad officiis omnis eaque, tempora quidem, vel, esse quasi qui sed rem provident ea autem accusamus? Aspernatur excepturi rem illo amet sapiente non repellat debitis dignissimos quod, accusamus corrupti consectetur optio maiores, sint aliquam. Veniam, non harum voluptate dicta sit porro iste cumque eligendi placeat ea voluptatem deserunt quam quo facere! Libero vitae rem dolore placeat quae, magni voluptate maiores nemo ullam temporibus adipisci perferendis laboriosam illo ipsam quia numquam, ipsum delectus at vel error iure aspernatur</p>
					</div>
					<p data-prodtab-num="2" class="prod-tab-mob" data-prodtab="#prod-tab-2">Features</p>
					<div class="prod-tab prod-props" id="prod-tab-2">
						<table>
							<tbody>
							<tr>
								<td>SKU</td>
								<td>05464207</td>
							</tr>
							<tr>
								<td>Material</td>
								<td>Nylon</td>
							</tr>
							<tr>
								<td>Pattern Type</td>
								<td>Solid</td>
							</tr>
							<tr>
								<td>Wash</td>
								<td>Colored</td>
							</tr>
							<tr>
								<td>Style</td>
								<td>Sport</td>
							</tr>
							<tr>
								<td>Color</td>
								<td>Blue</td>
							</tr>
							<tr>
								<td>Gender</td>
								<td>Unisex</td>
							</tr>
							<tr>
								<td>Rain Cover</td>
								<td>No</td>
							</tr>
							<tr>
								<td>Exterior</td>
								<td>Solid Bag</td>
							</tr>
							<tr>
								<td>Closure Type</td>
								<td>Zipper</td>
							</tr>
							<tr>
								<td>Handle/Strap Type</td>
								<td>Soft Handle</td>
							</tr>
							<tr>
								<td>Size</td>
								<td>33cm x 18cm x 48cm</td>
							</tr>
							</tbody>
						</table>
					</div>
					<p data-prodtab-num="3" class="prod-tab-mob" data-prodtab="#prod-tab-3">Video</p>
					<div class="prod-tab prod-tab-video" id="prod-tab-3">
						<iframe width="853" height="480" src="https://www.youtube.com/embed/kaOVHSkDoPY?rel=0&amp;showinfo=0" allowfullscreen></iframe>
					</div>
					<p data-prodtab-num="4" class="prod-tab-mob" data-prodtab="#prod-tab-4">Articles (6)</p>
					<div class="prod-tab prod-tab-articles" id="prod-tab-4">
						<div class="flexslider post-rel-wrap" id="post-rel-car">
							<ul class="slides">
								<li class="posts-i">
									<a class="posts-i-img" href="post.html"><span style="background: url(http://placehold.it/354x236)"></span></a>
									<time class="posts-i-date" datetime="2017-01-01 08:18"><span>09</span> Feb</time>
									<div class="posts-i-info">
										<a class="posts-i-ctg" href="blog.html">Articles</a>
										<h3 class="posts-i-ttl"><a href="post.html">Adipisci corporis velit</a></h3>
									</div>
								</li>
								<li class="posts-i">
									<a class="posts-i-img" href="post.html"><span style="background: url(http://placehold.it/360x203)"></span></a>
									<time class="posts-i-date" datetime="2017-01-01 08:18"><span>05</span> Jan</time>
									<div class="posts-i-info">
										<a class="posts-i-ctg" href="blog.html">Reviews</a>
										<h3 class="posts-i-ttl"><a href="post.html">Excepturi ducimus recusandae</a></h3>
									</div>
								</li>
								<li class="posts-i">
									<a class="posts-i-img" href="post.html"><span style="background: url(http://placehold.it/360x224)"></span></a>
									<time class="posts-i-date" datetime="2017-01-01 08:18"><span>17</span> Apr</time>
									<div class="posts-i-info">
										<a class="posts-i-ctg" href="blog.html">Reviews</a>
										<h3 class="posts-i-ttl"><a href="post.html">Consequuntur minus numquam</a></h3>
									</div>
								</li>
								<li class="posts-i">
									<a class="posts-i-img" href="post.html"><span style="background: url(http://placehold.it/314x236)"></span></a>
									<time class="posts-i-date" datetime="2017-01-01 08:18"><span>21</span> May</time>
									<div class="posts-i-info">
										<a class="posts-i-ctg" href="blog.html">Articles</a>
										<h3 class="posts-i-ttl"><a href="post.html">Non ex sapiente excepturi</a></h3>
									</div>
								</li>
								<li class="posts-i">
									<a class="posts-i-img" href="post.html"><span style="background: url(http://placehold.it/318x236)"></span></a>
									<time class="posts-i-date" datetime="2017-01-01 08:18"><span>24</span> Jan</time>
									<div class="posts-i-info">
										<a class="posts-i-ctg" href="blog.html">Articles</a>
										<h3 class="posts-i-ttl"><a href="post.html">Veritatis officiis</a></h3>
									</div>
								</li>
								<li class="posts-i">
									<a class="posts-i-img" href="post.html"><span style="background: url(http://placehold.it/354x236)"></span></a>
									<time class="posts-i-date" datetime="2017-01-01 08:18"><span>08</span> Sep</time>
									<div class="posts-i-info">
										<a class="posts-i-ctg" href="blog.html">Reviews</a>
										<h3 class="posts-i-ttl"><a href="post.html">Ratione magni laudantium</a></h3>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<p data-prodtab-num="5" class="prod-tab-mob" data-prodtab="#prod-tab-5">Reviews (3)</p>
					<div class="prod-tab" id="prod-tab-5">
						<ul class="reviews-list">
							<li class="reviews-i existimg">
								<div class="reviews-i-img">
									<img src="http://placehold.it/120x120" alt="Averill Sidony">
									<div class="reviews-i-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</div>
									<time datetime="2017-12-21 12:19:46" class="reviews-i-date">21 May 2017</time>
								</div>
								<div class="reviews-i-cont">
									<p>Numquam aliquam maiores ratione dolores ducimus, laborum hic similique delectus. Neque saepe nobis omnis laudantium itaque tempore voluptate harum error, illum nemo, reiciendis architecto, quam tenetur amet sit quisquam cum.<br>Pariatur cum tempore eius nulla impedit cumque odit quos porro iste a voluptas, optio alias voluptate minima distinctio facere aliquid quasi, vero illum tenetur sed temporibus eveniet obcaecati.</p>
									<span class="reviews-i-margin"></span>
									<h3 class="reviews-i-ttl">Averill Sidony</h3>
									<p class="reviews-i-showanswer"><span data-open="Show answer" data-close="Hide answer">Show answer</span> <i class="fa fa-angle-down"></i></p>
								</div>
								<div class="reviews-i-answer">
									<p>Thanks for your feedback!<br>
										Nostrum voluptate autem, eaque mollitia sed rem cum amet qui repudiandae libero quaerat veniam accusantium architecto minima impedit. Magni illo illum iure tempora vero explicabo, esse dolores rem at dolorum doloremque iusto laboriosam repellendus. <br>Numquam eius voluptatum sint modi nihil exercitationem dolorum asperiores maiores provident repellat magnam vitae, consequatur omnis expedita, accusantium voluptas odit id.</p>
									<span class="reviews-i-margin"></span>
								</div>
							</li>
							<li class="reviews-i existimg">
								<div class="reviews-i-img">
									<img src="http://placehold.it/120x120" alt="Araminta Kristeen">
									<div class="reviews-i-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</div>
									<time datetime="2017-12-21 12:19:46" class="reviews-i-date">14 February 2017</time>
								</div>
								<div class="reviews-i-cont">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
									<span class="reviews-i-margin"></span>
									<h3 class="reviews-i-ttl">Araminta Kristeen</h3>
									<p class="reviews-i-showanswer"><span data-open="Show answer" data-close="Hide answer">Show answer</span> <i class="fa fa-angle-down"></i></p>
								</div>
								<div class="reviews-i-answer">
									Benjy, hi!<br>
									Officiis culpa quos, quae optio quia.<br>
									Amet sunt dolorem tempora, pariatur earum quidem adipisci error voluptates tempore iure, nobis optio temporibus voluptatum delectus natus accusamus incidunt provident sapiente explicabo vero labore hic quo?
									<span class="reviews-i-margin"></span>
								</div>
							</li>
							<li class="reviews-i">
								<div class="reviews-i-cont">
									<time datetime="2017-12-21 12:19:46" class="reviews-i-date">21 May 2017</time>
									<div class="reviews-i-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</div>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
									<span class="reviews-i-margin"></span>
									<h3 class="reviews-i-ttl">Jeni Margie</h3>
									<p class="reviews-i-showanswer"><span data-open="Show answer" data-close="Hide answer">Show answer</span> <i class="fa fa-angle-down"></i></p>
								</div>
								<div class="reviews-i-answer">
									Hello, Jeni Margie!<br>
									Nostrum voluptate autem, eaque mollitia sed rem cum amet qui repudiandae libero quaerat veniam accusantium architecto minima impedit. Magni illo illum iure tempora vero explicabo, esse dolores rem at dolorum doloremque iusto laboriosam repellendus. <br>Numquam eius voluptatum sint modi nihil exercitationem dolorum asperiores maiores provident repellat magnam vitae, consequatur omnis expedita, accusantium voluptas odit id.
									<span class="reviews-i-margin"></span>
								</div>
							</li>
						</ul>
						<div class="prod-comment-form">
							<h3>Add your review</h3>
							<form method="POST" action="#">
								<input type="text" placeholder="Name">
								<input type="text" placeholder="E-mail">
								<textarea placeholder="Your review"></textarea>
								<div class="prod-comment-submit">
									<input type="submit" value="Submit">
									<div class="prod-rating">
										<i class="fa fa-star-o" title="5"></i><i class="fa fa-star-o" title="4"></i><i class="fa fa-star-o" title="3"></i><i class="fa fa-star-o" title="2"></i><i class="fa fa-star-o" title="1"></i>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- Single Product - end -->

		<!-- Related Products - start -->
		<div class="prod-related">
			<h2><span>Related products</span></h2>
			<div class="prod-related-car" id="prod-related-car">
				<ul class="slides">
					<li class="prod-rel-wrap">
						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x311" alt="Adipisci aperiam commodi">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Adipisci aperiam commodi</a></h3>
								<p class="prod-rel-price">
									<b>$59</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>



						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x366" alt="Nulla numquam obcaecati">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Nulla numquam obcaecati</a></h3>
								<p class="prod-rel-price">
									<b>$48</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>



						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/370x300" alt="Dignissimos eaque earum">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Dignissimos eaque earum</a></h3>
								<p class="prod-rel-price">
									<b>$37</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>



						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x345" alt="Porro quae quasi">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Porro quae quasi</a></h3>
								<p class="prod-rel-price">
									<b>$85</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>

					</li>
					<li class="prod-rel-wrap">
						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/378x300" alt="Sunt temporibus velit">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Sunt temporibus velit</a></h3>
								<p class="prod-rel-price">
									<b>$115</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>



						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x394" alt="Harum illum incidunt">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Harum illum incidunt</a></h3>
								<p class="prod-rel-price">
									<b>$130</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>



						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x303" alt="Reprehenderit rerum">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Reprehenderit rerum</a></h3>
								<p class="prod-rel-price">
									<b>$210</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>



						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x588" alt="Quae quasi adipisci alias">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Quae quasi adipisci alias</a></h3>
								<p class="prod-rel-price">
									<b>$85</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>

					</li>
					<li class="prod-rel-wrap">
						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x416" alt="Maxime molestias necessitatibus nobis">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Maxime molestias necessitatibus nobis</a></h3>
								<p class="prod-rel-price">
									<b>$95</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>



						<div class="prod-rel">
							<a href="product.html" class="prod-rel-img">
								<img src="http://placehold.it/300x480" alt="Facilis illum">
							</a>
							<div class="prod-rel-cont">
								<h3><a href="product.html">Facilis illum</a></h3>
								<p class="prod-rel-price">
									<b>$150</b>
								</p>
								<div class="prod-rel-actions">
									<a title="Wishlist" href="#" class="prod-rel-favorites"><i class="fa fa-heart"></i></a>
									<a title="Compare" href="#" class="prod-rel-compare"><i class="fa fa-bar-chart"></i></a>
									<p class="prod-i-addwrap">
										<a title="Add to cart" href="#" class="prod-i-add"><i class="fa fa-shopping-cart"></i></a>
									</p>
								</div>
							</div>
						</div>

					</li>
				</ul>
			</div>
		</div>
		<!-- Related Products - end -->

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
						<a href="${shop.fanpageUrl }" rel="nofollow" target="_blank">
							<i class="fa fa-facebook"></i>
						</a>
					</li>
					<li>
						<a href="http://google.com/" rel="nofollow" target="_blank">
							<i class="fa fa-google-plus"></i>
						</a>
					</li>
					<li>
						<a href="${shop.twitter }" rel="nofollow" target="_blank">
							<i class="fa fa-twitter"></i>
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