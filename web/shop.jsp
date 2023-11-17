<%-- 
    Document   : shop
    Created on : 16-06-2023, 08:15:27
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
        <title>Shop Page- Ustora Demo</title>

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
                            <li class="active"><a href="shop">All games</a></li>
                               <c:forEach items="${requestScope.pubs}" var="d">
                                <li><a href="shop?pub=${d.id}">${d.name}</a></li>
                                </c:forEach>
                            
                           
                    
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
                        <c:choose>
                            <c:when test="${requestScope.publish==null}">
                            <h2>Shop</h2>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${sessionScope.acc.role==1}">  <form action="del" method="post" onsubmit="return confirm('Do you really want delete this publisher?');">
                                                        <input type="hidden" value="${requestScope.publish.id}" name="id">
                                                        <input style="margin-left: 0px; margin-top: 0px; border-radius: 25px" type="submit" value="X">
                                                    </form></c:if>
                                <h2> ${requestScope.publish.name}</h2>
                                <h3>${requestScope.publish.describe}</h3>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <center>
                <div class="container">
                    <form action="shop" method="post" style="margin-bottom: 30px;  margin-top: 0px">
                        <input type="text"  name="s" placeholder="Find your game..." style=" border:1px #428bca ;height: 30px; width: 400px"><input type="Submit" value="Search" style="border: 1px solid; background-color: #428bca;border-radius: 25px ">
                    </form>
                    <div>
                <p  onclick="func()" style="cursor: pointer;">V</p>
                <form action="shop" method="get" id="myform" style="display: none">
                    <div><select style="color: #428bca;margin-bottom: 30px" name="gen">
                        <option value="">Genre</option>
                    <c:forEach items="${requestScope.genre}" var="g">
                        <option value="${g}">${g}</option>
                    </c:forEach>
                    </select>   
                        <select style="color: #428bca;margin-bottom: 5px" name="pub">
                            <option value="">Publisher</option>
                    <c:forEach items="${requestScope.pubs}" var="s">
                        <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                        </select>
                        <input style="border-radius: 25px; height: 30px" type="submit" value="O" >
                    </div>
                </form>
                  <div>
                <form action="shop" method="post" >
                  
                        <select style="color: #428bca;margin-bottom: 10px" name="sort" onchange="return this.form.submit();" >
                            <option>Order by</option>
                            <option value="o" >Oldest</option>
                             <option value="n" >Recent</option>
                              <option value="up" >Increasing price</option>
                               <option value="dp" >Decreasing price</option>
                               <option value="un" >Name</option>
                        </select></form>
                      <form action="shop" method="post" >
                          <input  type="number" name="pri" placeholder="Price Under..." style="color: #428bca; width: 110px;height: 20px; margin-bottom: 20px;margin-top: 0px" />
                          <input type="submit" style="display: none"/>
                      </form>
                  </div>
                    
                    
                
            </div>
          
           
            <script>
             function func(){
            var x = document.getElementById("myform");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
        }
            </script>
                </div>
                 </center>
            
           
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                
                                               <c:forEach items="${requestScope.pros}" var="p">
                                <div class="col-md-3 col-sm-6">
                                    <div class="single-shop-product">
                                        <div class="product-upper"> 
                                            <img src="${p.icon}" alt="">
                                        </div>
                                        <h2><a href="single?id=${p.id}">${p.title}</a></h2>
                                        <div class="product-carousel-price">
                                            <ins>${p.price}MCs</ins> <del>${p.price*2}MCs</del>
                                        </div>  
                                        <div class="product-option-shop">
                                            <c:if test="${sessionScope.acc!=null}"> <a  class="add_to_cart_button" href="atc?id=${p.id}&num=1">Add to cart</a></c:if>
                                            <c:if test="${sessionScope.acc==null}"> <a  class="add_to_cart_button" href="login.jsp">Must Login First</a></c:if>
                                        </div>                       
                                    </div>
                                </div>
                            </c:forEach>  
                    <center>
                    <c:if test="${requestScope.er!=null}">
                    <div><h1 style="color: #428bca; margin-top: 100px" >${requestScope.er}.</h1></div>
                                        <div> <h2>${requestScope.mes}.</h2></div>        
                            </center>
                                </c:if>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                        <c:if test="${requestScope.page!=null}">
                            <li>
                                <a href="" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        <c:forEach begin="1" end="${requestScope.page}"  var="i">
                            <li><a href="shop?in=${i}">${i}</a></li>
                        </c:forEach>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                             </c:if>
                        <c:if test="${requestScope.page==null}">
                                <li>Found ${requestScope.re} results</li>
                            </c:if>

                            
                        </ul>
                    </nav>                        
                </div>
            </div>
        </div>


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
    </body>
</html>