<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>profile with data and skills - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
    	body{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;    
}
.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}

    </style>
</head>
<body>
<div class="container">
<div class="main-body">

<nav aria-label="breadcrumb" class="main-breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="index">Home</a></li>
<li class="breadcrumb-item active" aria-current="page">User Profile</li>
</ol>
</nav>

<div class="row gutters-sm">
<div class="col-md-4 mb-3">
<div class="card">
<div class="card-body">
<div class="d-flex flex-column align-items-center text-center">
<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
<div class="mt-3">
<h4> ${sessionScope.acc.username}</h4>
<c:if test="${sessionScope.acc.role==1}">
<p class="text-secondary mb-1">Project Developer</p>
</c:if>
<p class="text-muted font-size-sm">${requestScope.det.address}</p>
<c:if test="${sessionScope.acc.role==1}"><a class="btn btn-primary" href="omanage?id=0">My Order</a></c:if>
<c:if test="${sessionScope.acc.role==2}"><a class="btn btn-primary" href="omanage?id=${sessionScope.acc.id}">My Order</a></c:if>
<c:if test="${sessionScope.acc.role==1}">
    <a class="btn btn-outline-primary" href="manager">Manage web users</a>
</c:if>
</div>
</div>
</div>
</div>
<div class="card mt-3">
<ul class="list-group list-group-flush">
    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap"><c:choose><c:when test="${sessionScope.acc.role==2}">
<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe mr-2 icon-inline"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Website</h6>
<span class="text-secondary">NMinh</span>
</li>
<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
<span class="text-secondary">NMinh</span>
</li>
        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter mr-2 icon-inline text-info"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
<span class="text-secondary">NMinh</span>
</li></c:when>
<c:when test="${sessionScope.acc.role==1}">
    <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe mr-2 icon-inline"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Month Income</h6>
    <span class="text-secondary">${requestScope.ic}MCs</span>
</li>
<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>CP LastMonth</h6>
<span class="text-secondary">${requestScope.grow}MCs</span>
</li>
    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Shop Growth</h6>
<span class="text-secondary"><c:if test="${requestScope.grow>0}"><p style="color: greenyellow">Positive</p></c:if><c:if test="${requestScope.grow<=0}"><p style="color: red">Negative</p></span></c:if>
</li></c:when>
</c:choose>
<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram mr-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
<span class="text-secondary">NMinh</span>
</li>
<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
<span class="text-secondary">NMinh</span>
</li>
</ul>
</div>
</div>
<div class="col-md-8">
<div class="card mb-3">
<div class="card-body">
<div class="row">
<div class="col-sm-3">
<h6 class="mb-0">Full Name</h6>
</div>
<div class="col-sm-9 text-secondary">
    ${sessionScope.acc.username}
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3">
<h6 class="mb-0">Email</h6>
</div>
<div class="col-sm-9 text-secondary">
    ${sessionScope.acc.mail}
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3">
<h6 class="mb-0">Phone</h6>
</div>
<div class="col-sm-9 text-secondary">
    ${requestScope.det.phone}
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3">
<h6 class="mb-0">Gender</h6>
</div>
<div class="col-sm-9 text-secondary">
    <c:choose><c:when test="${requestScope.det.gender==1}">Male</c:when><c:otherwise>Female</c:otherwise></c:choose>
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3">
<h6 class="mb-0">Address</h6>
</div>
<div class="col-sm-9 text-secondary">
        ${requestScope.det.address}
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-12">
    <a class="btn btn-info " target="__blank" href="update?id=${sessionScope.acc.id}">Edit</a>
</div>
</div>
</div>
</div><c:if test="${sessionScope.acc.role==1}">
<div class="row gutters-sm">
<div class="col-sm-6 mb-3">
<div class="card h-100">
<div class="card-body">
<h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Month's </i> Top Seller Games</h6>
<c:forEach items="${requestScope.ts}" var="t">
<small>${t.title}</small>
<div class="progress mb-3" style="height: 5px">
<div class="progress-bar bg-primary" role="progressbar" style="width: ${t.perc}%" aria-valuenow="${t.perc}" aria-valuemin="0" aria-valuemax="100"></div>
</div>
</c:forEach>
</div>
</div>
</div>
<div class="col-sm-6 mb-3">
<div class="card h-100">
<div class="card-body">
<h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Top</i>Paid Customer</h6>
<c:forEach items="${requestScope.tb}" var="tb">
<small>${tb.name}</small>
<div class="progress mb-3" style="height: 5px">
<div class="progress-bar bg-primary" role="progressbar" style="width: ${tb.perc}%" aria-valuenow="${tb.perc}" aria-valuemin="0" aria-valuemax="100"></div>
</div>
</c:forEach>
</div>
</div>
</div>
</div>
</c:if>
</div>
</div>
</div>
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>