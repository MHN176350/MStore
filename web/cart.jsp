<%-- 
    Document   : cart
    Created on : 17-06-2023, 19:00:31
    Author     : Minh
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart Page - Ustora Demo</title>

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
                              <c:set value="${requestScope.cart}"  var="o"/>
                            <a href="cart">Cart - <span class="cart-amunt">$${o.getTotalMoney()}</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">${o.ItemCount()}</span></a>
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
                            <li class="active"><a href="cart">Cart</a></li>
                           
                         
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
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End Page title area -->


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Search Games</h2>
                            <form action="#">
                                <input type="text" placeholder="Search products...">
                                <input type="submit" value="Search">
                            </form>
                        </div>

                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Products</h2>
                             <c:forEach items="${requestScope.tops}" var="m">
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

                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="woocommerce">
                                <form method="post" action="checkout">
                                    <input type="hidden" value="${sessionScope.acc.balance-o.getTotalMoney()}" name="ckout">
                                    <table cellspacing="0" class="shop_table cart">
                                        <thead>
                                            <tr>
                                                <th class="product-remove">&nbsp;</th>
                                                <th class="product-thumbnail">&nbsp;</th>
                                                <th class="product-name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-subtotal">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="cart_item">
                                                <c:forEach items="${o.items}" var="i">
                                                    <td class="product-remove">
                                                        <a title="Remove this item" class="remove" href="cart?rmv=1&id=${i.product.id}&num=0">×</a> 
                                                    </td>

                                                    <td class="product-thumbnail">
                                                        <a href="single?id=${i.product.id}"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${i.product.icon}"></a>
                                                    </td>

                                                    <td class="product-name">
                                                        <a href="single?id=${i.product.id}">${i.product.title}</a> 
                                                    </td>

                                                    <td class="product-price">
                                                        <span class="amount">${i.product.price}MCs</span> 
                                                    </td>

                                                    <td class="product-quantity">
                                                        <div class="quantity buttons_added">
                                                            <a class="minus" href="cart?num=-1&id=${i.product.id}">-</a>
                                                            ${i.quantity}
                                                            <a class="plus" href="cart?num=1&id=${i.product.id}">+</a>
                                                        </div>

                                                    </td>

                                                    <td class="product-subtotal">
                                                        <span class="amount">${i.quantity*i.price}MCs</span> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        
                                            <tr>
                                                <td class="actions" colspan="6">
                                                    <span>${requestScope.er}</span>
                                                    <c:if test="${o.items!=null}">
                                                    <input type="submit" value="Checkout"  class="checkout-button button alt wc-forward">
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <div class="cart-collaterals">


                                    <div class="cross-sells">
                                       
                                    </div>


                                    <div class="cart_totals ">
                                        <h2>Cart Totals</h2>

                                        <table cellspacing="0">
                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>Cart Subtotal</th>
                                                    <td><span class="amount">${o.getTotalMoney()}MCs</span></td>
                                                </tr>

                                                <tr class="shipping">
                                                    <th>Refund and Warranty</th>
                                                    <td>No Refund...</td>
                                                </tr>

                                                <tr class="order-total">
                                                    <th>Order Total</th>
                                                    <td><strong><span class="amount">${o.getTotalMoney()}MCs</span></strong> </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>


                                    

                                </div>
                            </div>                        
                        </div>                    
                    </div>
                </div>
            </div>
        </div>


        <div class="footer-top-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer-about-us">
                            <h2>u<span>Stora</span></h2>
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
                                <li><a href="#">Mobile Phone</a></li>
                                <li><a href="#">Home accesseries</a></li>
                                <li><a href="#">LED TV</a></li>
                                <li><a href="#">Computer</a></li>
                                <li><a href="#">Gadets</a></li>
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
                                    <input type="submit" value="Subscribe">
                                </form>
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
                            <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
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