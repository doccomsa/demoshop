<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>

    $(document).ready(function() {
        
        let operForm = $("#operForm");
      
        $("#btnModify").click(function() {
            /*
            let bno = $(this).data("bno");
            location.href = "/board/modify?bno=" + bno;
            */
            operForm.submit(); //수정폼.
        });

        $("#btnRemove").click(function() {
            
            if(!confirm("삭제 하시겠습니까?")) return;
          
            /*
            let bno = $(this).data("bno");
            location.href = "/board/remove?bno=" + bno;
            */

            operForm.attr("action", "/board/remove");
            operForm.submit();
        });
    });

  </script>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the messages -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <!-- User Image -->
                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <!-- Message title and timestamp -->
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <!-- The message -->
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                </ul>
                <!-- /.menu -->
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- /.messages-menu -->

          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- Inner menu: contains the tasks -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <!-- Task title and progress text -->
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <!-- The progress bar -->
                      <div class="progress xs">
                        <!-- Change the css width attribute to simulate progress -->
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">Link in level 2</a></li>
            <li><a href="#">Link in level 2</a></li>
          </ul>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        
        <div class="row">
        	<div class="col-md-12">
        		<div class="box box-primary">
					<div class="box-header with-border">
					<h3 class="box-title">게시판 조회</h3>
					</div>

				
						<div class="box-body">
							<div class="form-group">
							<label for="title">Bno</label>
							<input type="text" class="form-control" value="${board.bno }" readonly>
							</div>
							<div class="form-group">
							<label for="title">Title</label>
							<input type="text" class="form-control" value="${board.title }" readonly>
							</div>
							<div class="form-group">
							<label for="content">Content</label>
							<%-- <input type="text" class="form-control" value="${board.content }" readonly>--%>
							
							<c:out value="${board.content }" />
							</div>
							
							<div class="form-group">
							<label for="writer">Writer</label>
							<input type="text" class="form-control" value="${board.writer }" readonly>
							</div>
							
							<div class="form-group">
							<label for="writer">Regdate</label>
							<input type="text" class="form-control" value="<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd hh:mm"/>" readonly>
							</div>
							
							<div class="form-group">
							<label for="writer">Updatedate</label>
							<input type="text" class="form-control" value="<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd hh:mm"/>" readonly>
							
							</div>
							
							<button type="button" class="btn btn-primary" id="btnModify" data-bno="${board.bno }">Modify</button>
							<button type="button" class="btn btn-primary" id="btnRemove" data-bno="${board.bno }">Remove</button>
							<button type="button" class="btn btn-primary" id="btnList">List</button>
						</div>
						
						<form id="operForm" action="/board/modify" method="get">
              <input type="hidden" name="bno" value="${board.bno }">
              <input type="hidden" name="pageNum" value="${cri.pageNum}">
              <input type="hidden" name="amount" value="${cri.amount}">
              <input type="hidden" name="type" value="${cri.type}">
              <input type="hidden" name="keyword" value="${cri.keyword}">
            </form>

				</div>
        	</div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <button type="button" class="btn btn-primary" id="btnReplyWriteModal">댓글쓰기</button>
          </div>
        </div>
        <!-- 댓글목록과 페이징출력 -->
        <div class="row">
          <div class="col-md-12">

            <div id="replyListStr"></div>
            <div id="replyPageStr"></div>

          </div>
        </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- 핸들바 작업1 -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- 핸들바 템플릿 작업2-->
<script id="replyTemplate" type="text/x-handlebars-template">
  {{#each .}}
  <div class="box-body">
    <div class="form-group row">
      <label for="replyer" class="col-3 col-form-label">작성자</label>
      <div class="col-5">
        <input type="text" name="rno" value="{{rno}}" readonly>
        <input type="text" class="form-control" name="replyer" value="{{replyer}}" readonly>
      </div>
      <label for="reply" class="col-4 col-form-label">등록일: <span class="replydate">{{prettifyDate replydate}}</span> </label>
    </div>
    <div class="form-group row">
      <div class="col-8">
        <textarea class="form-control" name="reply" rows="3" readonly>{{reply}}</textarea>
      </div>
      <div class="col-4">
        <input type="button" name="btnModalModify" value="수정"><br>
        <input type="button" name="btnModalDelete" value="삭제">
      </div>
    </div>
  </div>
  <hr>
  {{/each}}
</script>
<script>

  //사용자정의 Helper : 핸들바수준의 사용자정의 함수.
  Handlebars.registerHelper("prettifyDate", function(timeValue) {
    const date = new Date(timeValue);

    return date.getFullYear() + "/" + (date.getMonth()+1) + "/" + date.getDate();
  });
</script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
  <script>

    let bno = ${board.bno };  // 게시물번호
    let replyPage = 1;   // 댓글목록의 첫번째 페이지값.

    let url = "/replies/pages/" + bno + "/" + replyPage + ".json";

    // 목록에서 글번호 클릭후, 게시물조회내용과 댓글목록을 호출하기위한 소스를 받아오고, 
    // 게시물조회내용은 브라우저가 해석하여, 출력하고, 댓글목록 호출소스는 해석하여, 서버에 ajax요청에 의하여
    // 댓글 목록데이타와 페이징정보를 다시 백그라운에서 받아온다.
    getPage(url);  

    // 사용자정의 함수. 댓글 쓰기,수정,삭제 후에는 이 함수를 다시 호출하여, 페이지의 댓글정보를 갱신해야 한다.
    function getPage(url) {
      console.log("댓글목록 주소: " + url);
      // 1) 댓글목록 :replyData.replyList  2) 페이징정보: replyData.pageMaker
      $.getJSON(url, function(replyData) {
        // let printReplyData = function(replyList, target, templateObject)
        //댓글목록 출력
        printReplyData(replyData.replyList, $("div#replyListStr"), $("#replyTemplate"));
        //페이징 출력
        printPaging(replyData.pageMaker,  $("div#replyPageStr"));


        /*
        let str = "";

        for(let i=0; i<replyData.replyList.length; i++) {
          str += replyData.replyList[i].rno;
          str += replyData.replyList[i].reply;
          str += replyData.replyList[i].replyer;
          str += "<button type='button'>delete</button>";
          str += "<hr>";
        }
        
        $("div#replyListStr").append(str);
        */

        /* json데이타 접근
        console.log(replyData.replyList.length);
        console.log("댓글일련번호: " + rereplyData.replyList[0].rno);
        console.log("댓글페이지정보: " + replyData.pageMaker.startPage);
        console.log("댓글페이지정보: " + replyData.pageMaker.endPage);
        */


      });
    }
    // 익명함수를 변수로 선언
    // replyList : json로 반환된 댓글데이타
    // target : 댓글목록이 출력될 위치.
    // templateObject : 핸들바 템플릿 참조변수.
    let printReplyData = function(replyList, target, templateObject) {
      //
      let template = Handlebars.compile(templateObject.html());
      let replyListHtml = template(replyList); // json데이터와 템플릿이 데이터바인딩식에 의하여 결합된 결과
      target.empty();
      target.append(replyListHtml);
    }

    /*
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
      </ul>
    </nav>
  */
    let printPaging = function(pageMaker, target) {

      let pagingStr = '<nav aria-label="Page navigation example">';
          pagingStr += '<ul class="pagination">';

          // 이전 1 2 3 4 5 다음  /   이전 6  7 8 9 10 다음
          // 이전표시작업
          if(pageMaker.prev) {
            pagingStr += '<li class="page-item"><a class="page-link" href="' + (pageMaker.startPage-1);
            pagingStr += '">Previous</a></li>';
          }

          // 페이지번호 표시작업
          for(let i=pageMaker.startPage; i<=pageMaker.endPage; i++) {
            let strClass = (pageMaker.cri.pageNum == i) ? 'active': '';
            pagingStr += '<li class="page-item ' + strClass + '"><a class="page-link" href="' + i + '">' + i + '</a></li>';
          }


          // 다음표시작업
          if(pageMaker.next) {
            pagingStr += '<li class="page-item"><a class="page-link" href="' + (pageMaker.endPage+1);
            pagingStr += '">Next</a></li>';
          }

          pagingStr += '</ul>';
          pagingStr += '</nav>';

          target.html(pagingStr);


    }



  </script>

  <script>

    $(document).ready(function(){
      //댓글 모달대화상자 띄우기
      $("#btnReplyWriteModal").on("click", function(){
        
        $("button[name='btnModal']").hide(); // Save, Modify, Delete 버튼 3개 숨김.
        $("#btnReplyWrite").show(); // Save 버튼 보이기.
        
        $("#replyModal").modal('show'); // 부트스트랩4의 메서드
      });

      //댓글 저장하기
      $("#btnReplyWrite").on("click", function(){
        let bno = $("#bno").val();  //게시물번호
        let replyer = $("#replyer").val();  // 작성자
        let reply = $("#reply").val();  // 댓글내용

        //JavaScript Object문법.  let 객체명 = {이름1:값, 이름2:값, 이름3:값}
        let replyObj = {bno:bno, replyer:replyer, reply:reply};
        //서버의 스프링의 메서드에 json문자열로 변환하여, 정보를 전송하는 작업.
        let replyStr = JSON.stringify(replyObj); // {"bno": 1500, "replyer":"user01", "reply":"댓글내용"}
        console.log(replyStr);

        $.ajax({
          type: 'post',
          url: '/replies/new',
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
          },
          dataType: 'text',  // 스프링에서 넘어오는 데이타타입 명시.
          data: replyStr, // 서버(스프링)으로 보내는 댓글 데이타
          success: function(data) {
            if(data == "success") {
              alert("댓글 데이타 삽입성공");
              getPage(url); // 댓글목록과 페이징정보를 갱신.
            }
          },
          error : function(xhr, status, error) {
            alert("댓글 데이타 삽입실패");
          }

        });
      });

      //댓글 페이지번호 클릭.
      // 동적으로 추가된 태그를 이벤트 설정을 할려면, 아래와 같이 해야 한다.
     
      $("#replyPageStr").on("click", "ul.pagination li.page-item a", function(e) {
          e.preventDefault();

          replyPage = $(this).attr("href");
          url = "/replies/pages/" + bno + "/" + replyPage + ".json";

          getPage(url);
      });

      //댓글수정 클릭.  댓글목록에서 수정버튼이 5개존재하는 데 선택한 수정버튼을 가리키는 문법.  $(this)
      $("#replyListStr").on("click", "input[name='btnModalModify']", function(){
          
          let rno = $(this).parents("div.box-body").find("input[name='rno']").val();
          let replyer = $(this).parents("div.box-body").find("input[name='replyer']").val();
          let reply = $(this).parents("div.box-body").find("textarea[name='reply']").val();
          let replydate = $(this).parents("div.box-body").find("span.replydate").text();
          
          console.log("댓글번호: " + rno); 
          console.log("댓글작성자: " + replyer);
          console.log("댓글내용: " + reply);
          console.log("댓글작성일: " + replydate);

          // 모달대화상자에 수정내용
          $("#exampleModalLabel").html("Modify Reply");
          $("#replyer").val(replyer);
          $("#reply").val(reply);
          $("#rno").val(rno);
          $("#replydate").html("등록일 :" + replydate);

          //모달대화상자 보이기
          $("button[name='btnModal']").hide(); // Save, Modify, Delete 버튼 3개 숨김.
          $("#btnReplyModify").show(); // Modify 버튼 보이기.
        
          $("#replyModal").modal('show'); // 부트스트랩4의 메서드
      });


      //댓글수정하기. 동적으로 추가된 요소는 이벤트 설정을 아래와 같이 해야한다.
      $("#btnReplyModify").on("click", function(){
        let rno = $("#rno").val();
        let reply = $("#reply").val();

        //JavaScript Object구문
        let replyObj = {rno: rno, reply: reply};
        //서버측에 보낼 JSON데이타 포맷을 변환.   1)stringify() : JS Object -> JSON문자열, 2)parse() : JSON문자열 -> JS Object
        let replyStr = JSON.stringify(replyObj);

        console.log("수정내용: " + replyStr);

        //return;

        //웹브라우저는 get, post 요청방식만 지원된다. 다른 요청방식을 사용할려면, 코드작업을 별도로 해야한다.
        $.ajax({
          type: 'put',
          url: '/replies/modify/' + rno,
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PUT" // 415 – 지원되지 않는 media type
          }, 
          dataType: 'text',
          data: replyStr,
          success: function(result) {
            if(result == "success") {
              alert("댓글 데이타 수정성공");

              //모달대화상자의 내용을 초기화.
              $("#exampleModalLabel").html("New Reply");
              $("#replyer").val("");
              $("#reply").val("");
              $("#rno").val("");
              $("#replydate").html("");


              $("button[name='btnModal']").hide(); // Save, Modify, Delete 버튼 3개 숨김.
              $("#btnReplyWrite").show(); // Modify 버튼 보이기.
        
              $("#replyModal").modal('hide'); // 부트스트랩4의 메서드

              url = "/replies/pages/" + bno + "/" + replyPage + ".json";

              getPage(url);
            }
          }
        });
      });

      //댓글삭제하기. 동적으로 추가된 요소는 이벤트 설정을 아래와 같이 해야한다.
      $("#replyListStr").on("click", "input[name='btnModalDelete']", function(){
        
        let rno = $(this).parents("div.box-body").find("input[name='rno']").val();

        if(!confirm(rno + "번 댓글을 삭제하시겠습니까?")) return; 
        
        $.ajax({
          type: 'delete',
          url: '/replies/delete/' + rno,
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE" // 415 – 지원되지 않는 media type
          }, 
          dataType: 'text',
          //data: replyStr,
          success: function(result) {
            if(result == "success") {
              alert("댓글 데이타 삭제성공");

              url = "/replies/pages/" + bno + "/" + replyPage + ".json";

              getPage(url);
            }
          }
        });
      });

    });


  </script>

  <!-- 댓글 모달대화상자-->
<div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Reply</h5>
        <h5 id="replydate"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="replyer" class="col-form-label">Replyer:</label>
            <input type="hidden" class="form-control" id="bno" value="${board.bno }">
            <input type="hidden" class="form-control" id="rno">
            <input type="text" class="form-control" id="replyer">
          </div>
          <div class="form-group">
            <label for="reply" class="col-form-label">Reply:</label>
            <textarea class="form-control" id="reply"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" name="btnModal" class="btn btn-primary" id="btnReplyWrite">Save</button>
        <button type="button" name="btnModal" class="btn btn-primary" id="btnReplyModify">Modify</button>
        <button type="button" name="btnModal" class="btn btn-primary" id="btnReplyDelete">Delete</button>
      </div>
    </div>
  </div>
</div>
  </body>
</html>