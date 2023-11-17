<%-- 
    Document   : single
    Created on : 16-06-2023, 08:33:04
    Author     : Minh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product Page - Ustora Demo</title>

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
                </div>  <!-- End header area -->
                <div class="site-branding-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="logo">
                                    <h1><a href="./"><img src="img/logo.png"></a></h1>
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
                            <li><a href="index">Home</a></li>
                            <li><a href="shop">Shop page</a></li>
                          
                           
                           
                        </ul>
                    </div>  
                </div>
            </div>
        </div> <!-- End mainmenu area -->

        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Shop</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Search Games</h2>
                            <form action="shop" method="post">
                                <input type="text" placeholder="Search products..."   name="s">
                                <input type="submit" value="Search">
                            </form>
                        </div>

                        <div class="single-sidebar">
                              <div class="single-sidebar">
                            <h2 class="sidebar-title">Products</h2>
                        <c:forEach items="${requestScope.oth}" var="m">
                            <div class="thubmnail-recent">
                                <img src="${m.icon}" class="recent-thumb" alt="">
                                <h2><a href="single?id=${m.id}">${m.title}</a></h2>
                                <div class="product-sidebar-price">
                                    <ins>${m.price}MCs</ins> <del>${m.price*2}MCs</del>
                                </div>                             
                            </div>
                        </c:forEach>
                        </div>
                        </div>

                        <div class="single-sidebar">
                           
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="product-breadcroumb">
                                <a href="shop">Home</a>
                                <a href="shop?gen=${requestScope.p.genre}">${requestScope.p.genre}</a>
                                <a>${requestScope.p.title}</a>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="product-images">
                                        <div class="product-main-img">
                                            <img src="${requestScope.p.icon}" alt="">
                                        </div>


                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="product-inner">
                                        <h2 class="product-name">${requestScope.p.title}</h2>
                                        <div class="product-inner-price">
                                            <ins>${requestScope.p.price}MCs</ins> <del>${requestScope.p.price*2}MCs</del>
                                        </div>    
                                            <c:if test="${sessionScope.acc==null}"><button href="login.jsp" class="add_to_cart_button" style="margin-bottom: 20px">Login to start shopping</button></c:if>
                                            <c:if test="${sessionScope.acc!=null}">
                                        <form action="atc" class="cart" id="atc">
                                            <div class="quantity">
                                                <input type="hidden" name="id"  value="${requestScope.p.id}" readonly name="id">
                                                <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="num" min="1" step="1"  name="qtt">
                                            </div>
                                            <button class="add_to_cart_button" type="submit">Add to cart</button>
                                        </form>   
                                            </c:if>
                                        <div class="product-inner-category">
                                            <p>Category: <a href="shop?gen=${requestScope.p.genre}">${requestScope.p.genre}</a>&nbsp;&nbsp;Published by:<a href="shop?pub=${requestScope.pub.id}">${requestScope.pub.name}</a></p>
                                        </div> 

                                        <div role="tabpanel">
                                            <ul class="product-tab" role="tablist">
                                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
                                                <c:if test="${sessionScope.acc!=null}">   <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Reviews</a></li></c:if>
                                                <c:if test="${sessionScope.acc.role==1}">   <li role="presentation"><a href="#manage" aria-controls="manage" role="tab" data-toggle="tab">Manage</a></li></c:if>
                                            </ul>
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                    <h2>Product Description</h2>  
                                                    <p>${requestScope.p.describe}</p>
                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="profile">
                                                    <h2>Reviews</h2>
                                                    <div class="submit-review">
                                                       <c:if test="${requestScope.cmt!=null}">
                                                                <c:forEach items="${requestScope.cmt}" var="r">
                                                                    <c:if test="${r.uid==sessionScope.acc.id}"><p  style="border:  1px dashed #0397d6"><label for="name">Me</c:if><c:if test="${r.uid!=sessionScope.acc.id}"><p><label for="name">${r.uname}</c:if></label>&nbsp; &nbsp; ${r.content}</p></c:forEach></c:if>
                                                                            <c:if test="${requestScope.cmt==null}"><p><label for="name">Not a single review yet:<</p></c:if>
                                                      
                                                        <div class="rating-chooser">
                                                            <p></p>

                                                            <div class="rating-wrap-post">
                                                              
                                                            </div>
                                                        </div>
                                                                    <form method="post" action="single">
                                                                        <input type="hidden" value="${requestScope.p.id}" name="id"><!-- comment -->
                                                                         <input type="hidden" value="${sessionScope.acc.id}" name="uid">
                                                                        <input type="hidden" value="${sessionScope.acc.username}" name="uname">
                                                        <p><label for="review">Your review</label> <textarea name="review" id="" cols="30" rows="10"></textarea></p>
                                                        <p><input type="submit" value="Submit"></p>
                                                                    </form>
                                                    </div>
                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="manage">
                                                    <h2>Admin Only</h2>
                                                    <form action="edit">
                                                        <input type="hidden" value="${requestScope.p.id}" name="id">
                                                        <input type="submit" value="Edit" style="margin-bottom: 10px; width: 100px"/>
                                                    </form>
                                                        <form action="del" onsubmit="return confirm('Do you really want delete this product ?');">
                                                        <input type="hidden" value="${requestScope.p.id}" name="id">
                                                        <input type="submit" value="Remove">
                                                    </form>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                                <div class="related-products-wrapper">
                                    <h2 class="related-products-title">Related Games</h2>
                                    <div class="related-products-carousel">
                                        <c:forEach items="${requestScope.gen}" var="g">
                                            <div class="single-product">
                                                <div class="product-f-image">
                                                    <img src="${g.icon}" alt="">
                                                    <div class="product-hover">
                                                        <a href="atc?id=${g.id}&num=1" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                        <a href="single?id=${g.id}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                    </div>
                                                </div>

                                                <h2><a href="single?id=${g.id}">${g.title}</a></h2>

                                                <div class="product-carousel-price">
                                                    <ins>${g.price}MCs</ins> <del>${g.price*2}MCs</del>
                                                </div> 
                                            </div>  
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>                    
                        </div>
                    </div>
                </div>
            </div>


        <div class="footer-top-area" style="margin-top: 30px">
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
    </body>
</html>