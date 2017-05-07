<%@ include file="../common/tablib.jsp" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>公益账房</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
<div class="main_container">
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="/user/main.htmls" class="site_title"><i class="fa fa-paw"></i> <span>公益账房</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="../images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>

                <h2>${username}</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br/>

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <security:authorize ifAnyGranted="ROLE_USER">
                        <li><a><i class="fa fa-flag"></i> 新建 <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="javascript:doPage('/contact/addContact.htmls');"> 新建联系人 </a></li>
                                <li><a href="template/index2.html"> 新建项目 </a></li>
                                <li><a href="template/index3.html"> 新建收入 </a></li>
                                <li><a href="index.html"> 新建支出 </a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:doPage('/contact/listContact.htmls');"><i class="fa fa-volume-off"></i> 联系人 <span class=""></span></a></li>
                        <li><a href="index.html"><i class="fa fa-tag"></i> 项目 <span class=""></span></a></li>
                        <li><a href="index.html"><i class="fa fa-list"></i> 收入 <span class=""></span></a></li>
                        <li><a href="index.html"><i class="fa fa-wrench"></i> 支出 <span class=""></span></a></li>
                        <li><a href="index.html"><i class="fa fa-group"></i> 统计中心 <span class=""></span></a></li>
                        <li><a><i class="fa fa-cloud"></i> 财务 <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="index.html"> 日支出 </a></li>
                                <li><a href="template/index2.html"> 项目支出汇总 </a></li>
                            </ul>
                        </li>
                    </security:authorize>
                    <security:authorize ifAnyGranted="ROLE_ADMIN">
                        <li><a><i class="fa fa-bell"></i> 管理员 <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="index.html"> 组织 </a></li>
                                <li><a href="template/index2.html"> 用户 </a></li>
                                <li><a href="template/index3.html"> 角色 </a></li>
                                <li><a href="index.html"> 权限 </a></li>
                            </ul>
                        </li>
                    </security:authorize>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        <img src="../images/img.jpg" alt="">welcome! <security:authentication property="name"/>
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="javascript:;"> Profile</a></li>
                        <li>
                            <a href="javascript:;">
                                <span class="badge bg-red pull-right">50%</span>
                                <span>Settings</span>
                            </a>
                        </li>
                        <li><a href="javascript:;">Help</a></li>
                        <li><a target="_blank" href="j_spring_security_logout"><i class="fa fa-sign-out pull-right"></i>退 出</a></li>
                    </ul>
                </li>

                <li role="presentation" class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown"
                       aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-green">6</span>
                    </a>
                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                        <li>
                            <a>
                                <span class="image"><img src="../images/img.jpg" alt="Profile Image"/></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="image"><img src="../images/img.jpg" alt="Profile Image"/></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="image"><img src="../images/img.jpg" alt="Profile Image"/></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="image"><img src="../images/img.jpg" alt="Profile Image"/></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                            </a>
                        </li>
                        <li>
                            <div class="text-center">
                                <a>
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main" id="page_content">

    <!-- top tiles -->
    <div class="row tile_count">
        <div class="col-md-3 col-sm-5 col-xs-7 tile_stats_count">
            <span class="count_top"><i class="fa fa-user"></i> 总联系人 </span>
            <div class="count">2500</div>
            <span class="count_bottom">最近一星期 <i class="fa fa-sort-asc"></i><i class="red">50</i>人</span>
        </div>
        <div class="col-md-3 col-sm-5 col-xs-7 tile_stats_count">
            <span class="count_top"><i class="fa fa-clock-o"></i> 总项目 </span>
            <div class="count">20</div>
            <span class="count_bottom">最近一个月 <i class="fa fa-sort-asc"></i><i class="red">5</i>个</span>
        </div>
        <div class="col-md-3 col-sm-5 col-xs-7 tile_stats_count">
            <span class="count_top"><i class="fa fa-clock-o"></i> 总收入 </span>
            <div class="count">200</div>
            <span class="count_bottom">最近一个月 <i class="fa fa-sort-desc"></i><i class="green">5</i>笔</span>
        </div>
        <div class="col-md-3 col-sm-5 col-xs-7 tile_stats_count">
            <span class="count_top"><i class="fa fa-clock-o"></i> 总支出 </span>
            <div class="count">30</div>
            <span class="count_bottom">最近一个月 <i class="fa fa-sort-asc"></i><i class="red">5</i>笔</span>
        </div>
    </div>
    <!-- /top tiles -->

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="dashboard_graph">

                <div class="row x_title">
                    <div class="col-md-6">
                        <h3>联系人
                            <small>增量趋势统计</small>
                        </h3>
                    </div>
                    <div class="col-md-6">
                        <div id="reportrange2" class="pull-right"
                             style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                            <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                        </div>
                    </div>
                </div>

                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div id="chart_plot_01" class="demo-placeholder"></div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                    <div class="x_title">
                        <h2>关键指标</h2>

                        <div class="clearfix"></div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-6">
                        <div>
                            <p>最大增幅</p>

                            <div class="">
                                <div class="progress progress_sm" style="width: 76%;">
                                    <div class="progress-bar bg-green" role="progressbar"
                                         data-transitiongoal="80"></div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <p>最小增幅</p>

                            <div class="">
                                <div class="progress progress_sm" style="width: 76%;">
                                    <div class="progress-bar bg-green" role="progressbar"
                                         data-transitiongoal="40"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-6">
                        <div>
                            <p>平均增幅</p>

                            <div class="">
                                <div class="progress progress_sm" style="width: 76%;">
                                    <div class="progress-bar bg-green" role="progressbar"
                                         data-transitiongoal="60"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="clearfix"></div>
            </div>
        </div>

    </div>
    <br/>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="dashboard_graph">

                <div class="row x_title">
                    <div class="col-md-6">
                        <h3>收入
                            <small>增量趋势统计</small>
                        </h3>
                    </div>
                    <div class="col-md-6">
                        <div id="reportrange1" class="pull-right"
                             style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                            <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                        </div>
                    </div>
                </div>

                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div id="chart_plot_03" class="demo-placeholder"></div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                    <div class="x_title">
                        <h2>关键指标</h2>

                        <div class="clearfix"></div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-6">
                        <div>
                            <p>最大增幅</p>

                            <div class="">
                                <div class="progress progress_sm" style="width: 76%;">
                                    <div class="progress-bar bg-green" role="progressbar"
                                         data-transitiongoal="80"></div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <p>最小增幅</p>

                            <div class="">
                                <div class="progress progress_sm" style="width: 76%;">
                                    <div class="progress-bar bg-green" role="progressbar"
                                         data-transitiongoal="40"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-6">
                        <div>
                            <p>平均增幅</p>

                            <div class="">
                                <div class="progress progress_sm" style="width: 76%;">
                                    <div class="progress-bar bg-green" role="progressbar"
                                         data-transitiongoal="60"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="clearfix"></div>
            </div>
        </div>

    </div>
    <br/>
    <div class="row">
    <div class="col-md-4 col-sm-4 col-xs-12">
        <div class="x_panel tile fixed_height_320">
            <div class="x_title">
                <h2>活跃联系人Top5 </h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="widget_summary">
                    <div class="w_left w_55">
                        <span>张三</span>
                    </div>
                    <div class="w_center w_55">
                        <div class="progress">
                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 66%;">
                                <span class="sr-only">60% Complete</span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="widget_summary">
                    <div class="w_left w_55">
                        <span>李四</span>
                    </div>
                    <div class="w_center w_55">
                        <div class="progress">
                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                                <span class="sr-only">60% Complete</span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="widget_summary">
                    <div class="w_left w_55">
                        <span>王五</span>
                    </div>
                    <div class="w_center w_55">
                        <div class="progress">
                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
                                <span class="sr-only">60% Complete</span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="widget_summary">
                    <div class="w_left w_55">
                        <span>赵六</span>
                    </div>
                    <div class="w_center w_55">
                        <div class="progress">
                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">
                                <span class="sr-only">60% Complete</span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="widget_summary">
                    <div class="w_left w_55">
                        <span>郭七</span>
                    </div>
                    <div class="w_center w_55">
                        <div class="progress">
                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                                <span class="sr-only">60% Complete</span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
        </div>
    </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="x_panel tile fixed_height_320">
                <div class="x_title">
                    <h2>项目活跃度Top3</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="widget_summary">
                        <div class="w_left w_55">
                            <span>公益助学项目</span>
                        </div>
                        <div class="w_center w_55">
                            <div class="progress">
                                <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
                                    <span class="sr-only">60% Complete</span>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="widget_summary">
                        <div class="w_left w_55">
                            <span>公益助教项目</span>
                        </div>
                        <div class="w_center w_55">
                            <div class="progress">
                                <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">
                                    <span class="sr-only">60% Complete</span>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="widget_summary">
                        <div class="w_left w_55">
                            <span>公益助残项目</span>
                        </div>
                        <div class="w_center w_55">
                            <div class="progress">
                                <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                                    <span class="sr-only">60% Complete</span>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>最新操作记录<small>${username}</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="dashboard-widget-content">

                        <ul class="list-unstyled timeline widget">
                            <li>
                                <div class="block">
                                    <div class="block_content">
                                        <h2 class="title">
                                            登录系统
                                        </h2>
                                        <div class="byline">
                                            <span>13 hours ago</span>
                                        </div>
                                        <p class="excerpt">登录ip来自xxx.xxx.xxx.xxx...
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="block">
                                    <div class="block_content">
                                        <h2 class="title">
                                            <a>新增联系人</a>
                                        </h2>
                                        <div class="byline">
                                            <span>13 hours ago</span> by
                                        </div>
                                        <p class="excerpt">
                                            新增联系人张大大....
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="block">
                                    <div class="block_content">
                                        <h2 class="title">
                                            查询项目收支
                                        </h2>
                                        <div class="byline">
                                            <span>13 hours ago</span>
                                        </div>
                                        <p class="excerpt">
                                            查询项目(项目：公益助学项目)收支详情...
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /page content -->

<!-- footer content -->
<%@include file="../common/footer.jsp"%>
<!-- /footer content -->
</div>
</div>

<%--左目录点击切换右边正文内容--%>
<script type="text/javascript">
    function doPage(targetUrl){
        $('#page_content').html("");
        $.ajax({
            type:"GET",
            url:targetUrl,
//                data:{pageNo:n},
            dataType: "html",   //返回值类型  使用json的话也可以，但是需要在JS中编写迭代的html代码，如果格式样式
            cache:false,
            success:function(data){
                //var json = eval('('+msg+')');//拼接的json串
                $('#page_content').html(data);
            },
            error:function(error){alert(error);}
        });
    }
</script>

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="../vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="../vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="../vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="../vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="../vendors/Flot/jquery.flot.js"></script>
<script src="../vendors/Flot/jquery.flot.pie.js"></script>
<script src="../vendors/Flot/jquery.flot.time.js"></script>
<script src="../vendors/Flot/jquery.flot.stack.js"></script>
<script src="../vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="../vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="../vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="../vendors/moment/min/moment.min.js"></script>
<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="../build/js/custom.min.js"></script>

</body>
</html>
