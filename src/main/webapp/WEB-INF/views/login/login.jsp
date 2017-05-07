<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/tablib.jsp" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 公 益 账 房 </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
</head>
<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form:form action="j_spring_security_check" modelAttribute="acctUser" method="post">
                    <h1> 公 益 账 房 </h1>

                    <div>
                        <form:input path="nickName" type="text" class="form-control" placeholder="账号/邮箱/手机号"
                                    required="true"/>
                    </div>
                    <div>
                        <form:password path="nickPassword" class="form-control" placeholder="密码" required="true"/>
                    </div>
                    <div>
                        <form:button class="btn btn-default submit"> 登 录 </form:button>
                        <a class="reset_pass" href="#">忘记密码?</a>
                    </div>
                </form:form>
                <c:if test="${not empty param.error}">
                    <%-- ERROR 信息 --%>
                    <i class="fa fa-times text-danger">Error: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</i>
                </c:if>
                <div class="clearfix"></div>

                <div class="separator">
                    <p class="change_link">没有账号?
                        <a href="#signup" class="to_register"> 注 册 </a>
                    </p>

                    <div class="clearfix"></div>
                    <br/>

                    <div>
                        <h1><i class="fa fa-paw"></i> 公益账房 </h1>

                        <p>©2017 All Rights Reserved.@Tomao</p>
                    </div>
                </div>

            </section>
        </div>

        <div id="register" class="animate form registration_form" style="width: 750px;margin: 0 auto">
            <section class="col-md-12 col-sm-12 col-xs-12">

                <div id="wizard" class="form_wizard wizard_horizontal">
                    <ul class="wizard_steps">
                        <li>
                            <a href="#step-1">
                                <span class="step_no">1</span>
                            <span class="step_descr">
                                              步骤1/2 个人信息<br/>
                                          </span>
                            </a>
                        </li>
                        <li>
                            <a href="#step-2">
                                <span class="step_no">2</span>
                            <span class="step_descr">
                                              步骤2/2 组织信息<br/>
                                          </span>
                            </a>
                        </li>
                    </ul>
                    <div id="step-1">
                        <h2 class="StepTitle">个人信息</h2>

                        <form:form id="regFrm" modelAttribute="acctUser" method="post" action="/user/register.htmls"
                                   class="form-horizontal form-label-left">
                            <div>
                                <form:input path="nickName" type="text" class="form-control" placeholder="账号"
                                            required="true" id="nick_name"/>
                                <span id="nickNameError" class="text-danger"></span>
                            </div>
                            <div>
                                <form:input path="telephone" type="text" class="form-control" placeholder="手机号"
                                            required="true" id="_telephone"/>
                                <span id="telephoneError" class="text-danger"></span>
                            </div>
                            <div>
                                <form:input path="email" type="email" class="form-control" placeholder="邮箱"
                                            required="true" id="_email"/>
                                <span style="color: red;" id="emailNameError"></span>
                            </div>
                            <div>
                                <form:password path="nickPassword" class="form-control" placeholder="密码" required="true"
                                               id="nick_password"/>
                                <span style="color: red;" id="nickPasswordError"></span>
                            </div>
                            <div>
                                <form:password path="conNickPassword" class="form-control" placeholder="重复密码"
                                               required="true" id="con_nick_password"/>
                                <span style="color: red;" id="conNickPasswordError"></span>
                            </div>
                            <%--<div>--%>
                                <%--<form:button class="btn btn-default submit" id=""> 提 交 </form:button>--%>
                            <%--</div>--%>
                    </div>
                    <div id="step-2">
                        <h2 class="StepTitle">组织信息</h2>

                        <p>
                        <div class="form-group">
                            <form:input path="orgName" type="text" class="form-control" placeholder="组织/团体名称"
                                        required="true" id="org_name"/>
                            <span id="orgNameError" class="text-danger"></span>
                        </div>
                        </p>

                        <p>
                        <div class="form-group">
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <from:textarea path="desc" class="resizable_textarea form-control" placeholder="组织简述述..."></from:textarea>
                            </div>
                        </div>
                        </p>
                    </div>
                    </form:form>
                </div>
                <!-- End SmartWizard Content -->

                <div class="separator">
                    <p class="change_link">已有账号 ?
                        <a href="#signin" class="to_register"> 登 录 </a>
                    </p>

                    <div class="clearfix"></div>
                    <br/>

                    <div>
                        <h1><i class="fa fa-paw"></i> 公益账房 </h1>

                        <p>©2017 All Rights Reserved.@Tomao</p>
                    </div>
                </div>
                <script type="text/javascript">
//                    $(document).ready(function() {
//                        // Initialize Smart Wizard with ajax content load
////                        $('#wizard').smartWizard({contentURL:'/user/register.htmls'});
//
//                        // Smart Wizard
//                        $('#wizard').smartWizard({
//                            onLeaveStep:leaveAStepCallback,
//                            onFinish:onFinishCallback
//                        });
//
//                        function leaveAStepCallback(obj, context){
//                            alert("Leaving step " + context.fromStep + " to go to step " + context.toStep);
//                            return validateSteps(context.fromStep); // return false to stay on step and true to continue navigation
//                        }
//
//                        function onFinishCallback(objs, context){
//                            if(validateAllSteps()){
//                                $('form').submit();
//                            }
//                        }
//                    });
                </script>
            </section>
            <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>

            <script type="text/javascript">
                //                // 用户名合法性的判断
                //                $(function(){
                //                    $("#nick_name").blur(function(){
                //                        $("#nickNameError").html("");
                //                        var _nickName = $("#nick_name").val();
                //                        var len = $("#nick_name").val().length;
                //                        $.getJSON("/user/userJudge.htmls",{"nickName":_nickName},function(data){
                //                            if(data!=null){
                //                                alert("账号已注册，请重新输入！！！");
                //                                $("#nickNameError").html("账号已注册！请重新输入账号！！！");
                //                                $("#regFrm").attr("onsubmit","return false");
                //
                //                            }else{
                //                                $("#nickNameError").html("恭喜！账号可用！")
                //                                $("#regFrm").attr("onsubmit","return true");
                //                            }
                //                        });
                //                    });
                //                });
                //                // 密码合法性的判断
                //                $(function(){
                //                    $("#nick_password").blur(function(){
                //                        $("#nickPasswordError").html("");
                //                        var len = $("#nick_password").val().length;
                //                        if(len>0&&len<6){
                //                            $("#nickPasswordError").html("密码位数最少为6位！");
                //                            $("#regFrm").attr("onsubmit","return false");
                //                        }
                //                    })
                //                })
                //                // 确认两次密码
                //                $(function(){
                //                    $("#conNickPasswordError").html("");
                //                    $("#con_nick_password").blur(function(){
                //                        var oldpwd = $("#nick_password").val();
                //                        var conpwd = $("#con_nick_password").val();
                //                        if(oldpwd!=conpwd){
                //                            $("#conNickPasswordError").html("两次密码不一致！");
                //                            $("#regFrm").attr("onsubmit","return false");
                //                        }else{
                //                            $("#conNickPasswordError").html("密码符合！");
                //                            $("#regFrm").attr("onsubmit","return true");
                //                        }
                //                    })
                //                })
                //                function checkContactNumber() {
                //                    var mobile = $.trim($("#_telephone").val());
                //                    var isMobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
                //                    if (!isMobile.exec(mobile) && mobile.length != 11) {
                //                        $("#_telephone").focus();
                //                        return false;
                //                    }
                //                    return true;
                //                }
            </script>
        </div>

    </div>
</div>

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../vendors/nprogress/nprogress.js"></script>
<!-- jQuery Smart Wizard -->
<script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
<!-- Custom Theme Scripts -->
<script src="../build/js/custom.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        // Initialize Smart Wizard with ajax content load
//                        $('#wizard').smartWizard({contentURL:'/user/register.htmls'});

        // Smart Wizard
        $('#wizard').smartWizard({
            onLeaveStep:leaveAStepCallback,
            onFinish:onFinishCallback
        });

        function leaveAStepCallback(obj, context){
            alert("Leaving step " + context.fromStep + " to go to step " + context.toStep);
            return validateSteps(context.fromStep); // return false to stay on step and true to continue navigation
        }

        function onFinishCallback(objs, context){
            alert("submit form")
            if(validateAllSteps()){
                $('form').submit();
            }
        }
    });
</script>
</body>
</html>
