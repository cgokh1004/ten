<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>With Share</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/css/agency.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: orange; text-decoration: none;}
</style>
</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">With Share</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#carpool">카풀</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#ktx">KTX</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#food">맛집</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#travel">여행 정보</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#center">고객 센터</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#research">설문조사</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">With Share에 오신걸 환영합니다.</div>
                <div class="intro-heading">반가워요</div>
                <a href="#carpool" class="page-scroll btn btn-xl">더 보기</a>
            </div>
        </div>
    </header>

    <!-- carpool Section -->
    <section id="carpool">
    <a href="carpool/list">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">카풀</h2>
                    <h3 class="section-subheading text-muted">어디가시나요? 같이 타고 가요!</h3>
                </div>
            </div>
            <div class="row text-center">
            <img alt="carpool" src="${pageContext.request.contextPath}/images/카풀.png" width="650px">
            </div>
        </div>
    </a>
    </section>
    <!-- ktx Section -->
    <section id="ktx" class="bg-light-gray">
     <a href="ktx/list">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">KTX</h2>
                    <h3 class="section-subheading text-muted">패키지 좌석을 같이 타면 저렴하게 탈수있어요!</h3>
                </div>
            </div>
            <div class="row text-center">
                <img alt="ktx" src="${pageContext.request.contextPath}/images/ktx.jpg" width="650px">
            </div>
        </div>
      </a>
    </section>

    <!-- food Section -->
    <section id="food">
    <a href="food/list">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">맛집</h2>
                    <h3 class="section-subheading text-muted">오늘은 뭐 먹지?</h3>
                </div>
            </div>
            <div class="row text-center">
                <img alt="food" src="${pageContext.request.contextPath}/images/food.jpg" width="650px">
            </div>
        </div>
     </a>
    </section>

<!-- travel Section -->
    <section id="travel" class="bg-light-gray">
    <a href="travel/list">
        <div class="container" >
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">여행 정보</h2>
                    <h3 class="section-subheading text-muted">어디로 갈까?</h3>
                </div>
            </div>
            <div class="row text-center">
                <img alt="travel" src="${pageContext.request.contextPath}/images/travel.jpg" width="650px">
            </div>
        </div>
     </a>
    </section>

    <!-- center Section -->
    <section id="center">
    <a href="center/list">
       <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">고객센터</h2>
                    <h3 class="section-subheading text-muted">무엇을 도와드릴까요?</h3>
                </div>
            </div>
            <div class="row text-center">
                <img alt="고객센터" src="${pageContext.request.contextPath}/images/고객센터.jpg" width="650px">
            </div>
        </div>
    </a>
    </section>
	<!-- research Section -->    
	<section id="research" class="bg-light-gray">
	    <a href="food/list">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12 text-center">
	                    <h2 class="section-heading">설문조사</h2>
	                    <h3 class="section-subheading text-muted">몇가지만 물어볼께요?</h3>
	                </div>
	            </div>
	            <div class="row text-center">
	                <img alt="research" src="${pageContext.request.contextPath}/images/설문조사.jpg" width="550px">
	            </div>
	        </div>
	     </a>
	 </section>
   
    <!-- Team Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">good job</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/김현.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">김 현</h4>
                        <p class="text-muted">팀장</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/이용조.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">이용조</h4>
                        <p class="text-muted">수석 프로그래머</p>
                    </div>
                </div>
            <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/진가슬.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">진가슬</h4>
                        <p class="text-muted">수석 프로그래머</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/김성빈.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">김성빈</h4>
                        <p class="text-muted">프로그래머</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/고솔아.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">고솔아</h4>
                        <p class="text-muted">프로그래머</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/신승형.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">신승형</h4>
                        <p class="text-muted">프로그래머</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/최민서.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">최민서</h4>
                        <p class="text-muted">프로그래머</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/류제만.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">류제만</h4>
                        <p class="text-muted">프로그래머</p>
                    </div>
                </div> 
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team/김병학.png" class="img-responsive img-circle" alt="">
                        <h4 style="color:white">김병학</h4>
                        <p class="text-muted">프로그래머</p>
                    </div>
                </div> 
        	</div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row text-center">
                    <span class="copyright">Copyright &copy; Ten 2016</span>
<!--                 <div class="col-md-4"> -->
<!--                     <ul class="list-inline social-buttons"> -->
<!--                         <li><a href="#"><i class="fa fa-twitter"></i></a> -->
<!--                         </li> -->
<!--                         <li><a href="#"><i class="fa fa-facebook"></i></a> -->
<!--                         </li> -->
<!--                         <li><a href="#"><i class="fa fa-linkedin"></i></a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 <div class="col-md-4"> -->
<!--                     <ul class="list-inline quicklinks"> -->
<!--                         <li><a href="#">Privacy Policy</a> -->
<!--                         </li> -->
<!--                         <li><a href="#">Terms of Use</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/js/agency.min.js"></script>

</body>

</html>