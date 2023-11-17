<%-- 
    Document   : addprofile
    Created on : 01-07-2023, 19:25:49
    Author     : Minh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Bingo One page parallax responsive HTML Template ">
  
  <meta name="author" content="Furioustheme">

  <title>Swift | Marketplace Theme</title>

  <!-- <link href="https://fonts.googleapis.com/css?family=Lora:400i|Raleway:300,400,500,600,700,800,900" rel="stylesheet"> -->

  <!-- Mobile Specific Meta
  ================================================== -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="img/x-icon" href="img/favicon.png" />
  
  <!-- CSS
  ================================================== -->
  <!-- RS5.0 Main Stylesheet -->
  <!-- <link rel="stylesheet" type="text/css" href="revolution/css/settings.css"> -->
  <!-- RS5.0 Layers and Navigation Styles -->
  <!-- <link rel="stylesheet" type="text/css" href="revolution/css/layers.css">
  <link rel="stylesheet" type="text/css" href="revolution/css/navigation.css"> -->
  <!-- REVOLUTION STYLE SHEETS -->
  <!-- <link rel="stylesheet" type="text/css" href="revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
  <link rel="stylesheet" type="text/css" href="revolution/fonts/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="revolution/css/settings.css">
  <link rel="stylesheet" type="text/css" href="revolution/css/layers.css">
  <link rel="stylesheet" type="text/css" href="revolution/css/navigation.css">  -->
  <link rel="stylesheet" href="plugins/tf-fonts.min.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap.min.css">
  <!-- Lightbox.min css -->
  <link rel="stylesheet" href="plugins/lightbox.min.css">
  <!-- Animate.css -->
  <link rel="stylesheet" href="plugins/animate.min.css">
  <!-- Owl Carousel -->
  <link rel="stylesheet" href="plugins/owl.carousel.css">
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
  <!-- Media Queries -->
  <link rel="stylesheet" href="plugins/media-queries.css">



  <!-- Colors -->
  <!-- <link rel="stylesheet" type="text/css" href="css/colors/green.css" title="green">
  <link rel="stylesheet" type="text/css" href="css/colors/red.css" title="light-red">
  <link rel="stylesheet" type="text/css" href="css/colors/blue.css" title="blue">
  <link rel="stylesheet" type="text/css" href="css/colors/light-blue.css" title="light-blue">
  <link rel="stylesheet" type="text/css" href="css/colors/yellow.css" title="yellow">
  <link rel="stylesheet" type="text/css" href="css/colors/light-green.css" title="light-green"> -->
  
  <script src="plugins/modernizr.js"></script>

</head>

<body id="body">

 <!--
  Start Preloader
  ==================================== -->
  <div id="preloader">
    <div class='preloader'>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div> 
  <!--
  End Preloader
  ==================================== -->

 <!--  <div class="colors-switcher">
    <a id="show-panel" class="hide-panel"><i class="fa fa-tint"></i></a>        
    <ul class="colors-list">
        <li><a title="Light Red" onClick="setActiveStyleSheet('light-red'); return false;" class="light-red"></a></li>
        <li><a title="Blue" class="blue" onClick="setActiveStyleSheet('blue'); return false;"></a></li>
        <li class="no-margin"><a title="Light Blue" onClick="setActiveStyleSheet('light-blue'); return false;" class="light-blue"></a></li>
        <li><a title="Green" class="green" onClick="setActiveStyleSheet('green'); return false;"></a></li>
        
        <li class="no-margin"><a title="light-green" class="light-green" onClick="setActiveStyleSheet('light-green'); return false;"></a></li>
        <li><a title="Yellow" class="yellow" onClick="setActiveStyleSheet('yellow'); return false;"></a></li>
        
    </ul>

</div>  -->

  

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.jsp">
            <img src="img/logo.png" alt="">
          </a>
          <h2 class="text-center">Show us more about you</h2>
            <div class="text-center">
              ${requestScope.error}
          </div>
          <form class="text-left clearfix" action="addprofile" method="post">
              <input type="hidden" value="${sessionScope.acc.id}" name="id">
              <div class="form-group">
                  <input type="number" class="form-control" id="exampleInputEmail1" placeholder="Phone number.." name="phone">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Your address" name="addr">
            </div>
            <div class="form-group">
               <select name ="gender" class="form-control">
                   <option value="0">Female</option>
                <option value="1">Male</option>
               </select>
            </div>
            
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center">Save</button>
            </div>
              <div>${requestScope.err}</div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery-3.1.1.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap.min.js"></script>
    <!-- Parallax -->
    <script src="plugins/jquery.parallax-1.1.3.js"></script>
    <!-- lightbox -->
    <script src="plugins/lightbox.min.js"></script>
    <!-- Owl Carousel -->
    <script src="plugins/owl.carousel.min.js"></script>
    <!-- Portfolio Filtering -->
    <script src="plugins/jquery.mixitup.js"></script>
    <!-- Smooth Scroll js -->
    <script src="plugins/smooth-scroll.min.js"></script>
    
    <script src="plugins/jquery.vide.min.js"></script>
    <!-- Custom js -->
    <script src="js/script.js"></script>

  </body>
  </html>