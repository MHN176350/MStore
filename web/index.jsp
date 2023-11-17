<%-- 
    Document   : index
    Created on : 13-06-2023, 12:04:55
    Author     : Minh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ustora Demo</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">
                            <ul>
                                <c:if test="${sessionScope.acc!=null}"><li><a href="profile?id=${sessionScope.acc.id}"><i class="fa fa-user"></i> My Account</a></li></c:if>
                                <c:if test="${sessionScope.acc!=null}"> <li><a href="cart"><i class="fa fa-user"></i> My Cart</a></li></c:if>
                                <c:if test="${sessionScope.acc!=null}"><li><a href="checkout"><i class="fa fa-user"></i> Checkout</a></li></c:if>
                                <c:choose><c:when test="${sessionScope.acc==null}">  <li><a href="login"><i class="fa fa-user"></i> Login</a></li></c:when>
                                    <c:when test="${sessionScope.acc!=null}"><li><i class="fa fa-user"></i>Hello ${sessionScope.acc.username}! </li></c:when></c:choose>
                                    <c:if test="${sessionScope.acc!=null}"><li><a href="logout"><i class="fa fa-user"></i> Logout</a></li></c:if>
                                    <c:choose><c:when test="${sessionScope.acc!=null&&sessionScope.acc.role==1}">  <li><a href="add"><i class="fa fa-user"></i> Add a Product</a></li></c:when>
                                        <c:when test="${sessionScope.acc==null}"><li><a  href="signup"><i class="fa fa-user"></i> Register</a> </li></c:when></c:choose>
                                        
                                        
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                            <c:if test="${sessionScope.acc.role==1}">  <li><a href="addpub.jsp"><i class="fa fa-user"></i> Add a Publisher</a></li></c:if>
                             <c:if test="${sessionScope.acc.role==1}">  <li><a href="tmanage"><i class="fa fa-user"></i> T-UP MNG</a></li></c:if>
                        <c:if test="${sessionScope.acc!=null}"> <li><a href="topup"><i class="fa fa-user"></i> My Wallet: ${sessionScope.acc.balance} MCoins</a></li></c:if>
                        </ul>
                    </div>
                    </div>
                </div>
            </div>
        </div> <!-- End header area -->

        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="./"><img class=log src="img/logo.png"></a></h1>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="shopping-item">
                        <c:choose>
                            <c:when test="${sessionScope.acc==null}"><a href="login.jsp">Cart - <span class="cart-amunt">0</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">0</span></a></c:when>
                            <c:when test="${sessionScope.acc!=null}"><c:set value="${sessionScope.cart}" var="o"/>
                                <a href="cart">Cart - <span class="cart-amunt">${o.getTotalMoney()}MCs</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">${o.ItemCount()}</span></a></c:when> 
                        </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index">Home</a></li>
                            <li><a href="shop">Shop page</a></li>
                           
                           
                           
                        </ul>
                    </div>  
                </div>
            </div>
        </div> <!-- End mainmenu area -->

        <div class="slider-area">
            <!-- Slider -->
            <div class="block-slider block-slider4">
                <ul class="" id="bxslider-home4">
                    <li>
                        <img src="https://www.allkeyshop.com/blog/wp-content/uploads/Ubisoft-E3-2017_BANNER-1024x576.jpg" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                Ubisoft <span class="primary">In <strong>Action</strong></span>
                            </h2>
                            <h4 class="caption subtitle">With discounted price</h4>
                            <a class="caption button-radius" href="shop?pub=1"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                    <li><img src="https://media.contentapi.ea.com/content/dam/eacom/corporate/common/technology-update/technology-update-thumbnail.png.adapt.crop191x100.1200w.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                Arts <span class="primary">Of <strong>Electronic</strong></span>
                            </h2>
                            <h4 class="caption subtitle">Discounted Masterpiece</h4>
                            <a class="caption button-radius" href="shop?pub=6"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                    <li><img src="https://www.bleepstatic.com/content/hl-images/2022/07/13/BandaiNamco.jpg" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                Thrilling <span class="primary">Fantasy World <strong>Await</strong></span>
                            </h2>
                            <h4 class="caption subtitle">With resonable price</h4>
                            <a class="caption button-radius" href="shop?pub=3"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                    <li><img src="https://cdn11.bigcommerce.com/s-6kgfzq4siu/images/stencil/original/image-manager/faith-estorebanners-1600x900.jpg?t=1684323286" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                               Hand-on<span class="primary"> Digital's <strong>Masterpiece</strong></span>
                            </h2>
                            <h4 class="caption subtitle">With good price</h4>
                            <a class="caption button-radius" href="shop?pub=4"><span class="icon"></span>Shop now</a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- ./Slider -->
        </div> <!-- End slider area -->

        <div class="promo-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo1">
                            <i class="fa fa-refresh"></i>
                            <p>30 Days return</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo2">
                            <i class="fa fa-truck"></i>
                            <p>Free shipping</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo3">
                            <i class="fa fa-lock"></i>
                            <p>Secure payments</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo4">
                            <i class="fa fa-gift"></i>
                            <p>New products</p>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End promo area -->

        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <h2 class="section-title">Games</h2>
                            <div class="product-carousel">
                                <c:forEach items="${requestScope.pros}" var="p">
                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img src="${p.icon}"  alt="">
                                        <div class="product-hover">
                                            <c:if test="${sessionScope.acc!=null}"><a href="atc?id=${p.id}&num=1" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a></c:if>
                                             <c:if test="${sessionScope.acc==null}"><a href="login.jsp" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Login</a></c:if>
                                            <a href="single?id=${p.id}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                        </div>
                                    </div>
                                    <h2><a href="single?id=${p.id}">${p.title}</a></h2>
                                    <div class="product-carousel-price">
                                        <ins>${p.price}MCs</ins> <del>${p.price*2}MCs</del>
                                    </div> 
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->

        <div class="brands-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="brand-wrapper">
                            <div class="brand-list">
                                <img src="https://logos-world.net/wp-content/uploads/2023/02/Ubisoft-Logo.png" alt="">
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj3XpxiWrCAr3JgYpkC0Jq0dUdDuEahRd-uA&usqp=CAU" alt="">
                                <img src="https://cdn-icons-png.flaticon.com/512/871/871495.png" alt="">
                                <img src="https://yt3.googleusercontent.com/ytc/AOPolaSgAbHI7x4EjZ0MmB8G9BiRRYMJOLIjqNS4jq5pcA=s900-c-k-c0x00ffffff-no-rj" alt="">                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End brands area -->

        <div class="product-widget-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-product-widget">
                            <h2 class="product-wid-title">Top-Seller Games  </h2>
                            <a href="shop" class="wid-view-more">View All</a>
                        <c:forEach items="${requestScope.tops}" var="t">
                            <div class="single-wid-product">
                                <a href="single?id=${t.id}"><img src="${t.icon}" alt="" class="product-thumb"></a>
                                <h2><a href="single?id=${t.id}">${t.title}</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>${t.price}MCs</ins> <del>${t.price*2}MCs</del>
                                </div>                            
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-4">
                        
                    </div>
                    <div class="col-md-4">
                        <div class="single-product-widget">
                            <h2 class="product-wid-title">Top New</h2>
                        <c:forEach  items="${requestScope.late}" var="l">
                            <div class="single-wid-product">
                                <a href="single-product.html"><img src="${l.icon}" alt="" class="product-thumb"></a>
                                <h2><a href="single?id=${l.id}">${l.title}</a></h2>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-wid-price">
                                    <ins>${l.price}MCs</ins> <del>${l.price*2} MCs</del>
                                </div>                            
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End product widget area -->

        <div class="footer-top-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer-about-us">
                            <h2>M<span>Store</span></h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                            <div class="footer-social">
                                <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">User Navigation </h2>
                            <ul>
                                <li><a href="#">My account</a></li>
                                <li><a href="#">Order history</a></li>
                                <li><a href="#">Wishlist</a></li>
                                <li><a href="#">Vendor contact</a></li>
                                <li><a href="#">Front page</a></li>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">Categories</h2>
                            <ul>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-newsletter">
                            <h2 class="footer-wid-title">Newsletter</h2>
                            <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                            <div class="newsletter-form">
                                <form action="#">
                                    <input type="email" placeholder="Type your email">
                                    <input type="submit" onclick="sub()" value="SUBMIT">
                                </form>
                                <script>
                                    function sub(){
                                        window.alert("Thanks for subcribe!")
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End footer top area -->

        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                            <p>&copy; 2023 MStore. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="footer-card-icon">
                            <i class="fa fa-cc-discover"></i>
                            <i class="fa fa-cc-mastercard"></i>
                            <i class="fa fa-cc-paypal"></i>
                            <i class="fa fa-cc-visa"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End footer bottom area -->

        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>

        <!-- Slider -->
        <script type="text/javascript" src="js/bxslider.min.js"></script>
        <script type="text/javascript" src="js/script.slider.js"></script>
    </body>
</html>