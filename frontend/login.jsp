<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8"/>
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0" name="viewport"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <title>ZeroHybrid Network</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/staticfile/picture/css/normalize.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/staticfile/picture/css/style.css" media="screen" type="text/css" />
    <script src="<%=request.getContextPath()%>/staticfile/picture/js/modernizr.custom.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/staticfile/picture/css/base.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/staticfile/picture/css/dl.css" />
    <script src="<%=request.getContextPath()%>/staticfile/picture/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/staticfile/picture/js/modernizr.custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/staticfile/picture/js/jquery.rwdimagemaps.min.js"></script>
    <script src="<%=request.getContextPath()%>/staticfile/picture/js/toastAlert.js"></script>
</head>
<%
    if(request.getParameter("ver")==null || request.getParameter("ver").compareTo("v0.8.2") < 0){
%>
            <html><p align=center>This version was expired. Please download the newest package. <br/> <a href="#" onclick="AndroidNative.logout();">Close</a></p></html>
<%
       return;
    }
%>
<body>
   <div style="display: none; background-color: transparent;" id="loading">Loading...</div>
   <div class="blank_background">
     <div class="nav">
        <img src="<%=request.getContextPath()%>/staticfile/picture/img/dl_1.jpg">
     </div>
   </div>
   <div>
       <div class="content">
           <!--<center><textarea name="mnemonic" class="mnemonic" id="mnemonic" placeholder="Input mnemonics" rows=2 cols=40> </textarea></center>-->
           <input type="text" name="phone" class="phone" id="mobile" placeholder="Email"/>
           <input type="text" name="code" class="code" id="yzm" placeholder="Verification Code"/> <!--style="margin-left:1px;visibility:hidden " -->
           <br/><button class="code_fa" id="bt01">Get</button>
           <!--<br/><button class="code_fa" id="bt01" >Generate mnemonics</button>-->
       </div>
        <button class="dl" id="login" >Login</button>

        <script type="text/javascript">

        var pwd=0;


        //parse cookies
      function getCookie(cname) {
          var name = cname + "=";
          var ca = document.cookie.split(';');
          for(var i=0; i<ca.length; i++) {
              var c = ca[i];
              while (c.charAt(0)==' ') c = c.substring(1);
              if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
          }
          return "";
      }


    var ipPort="http://localhost:8080/";
            function invokeSettime(obj){
                var countdown=90;
                settime(obj);
                function settime(obj) {
                    if($("#mobile").val() == "" || !checkEmail($("#mobile").val()) || countdown == 0 ) {
                        $(obj).attr("disabled",false);
                        $(obj).text("Get");
                        countdown = 60;
                        return;
                    }else{
                        $(obj).attr("disabled",true);
                        $("#bt01").css({width:"69px",font:"0.01px",position:"relative"});
                        $(obj).text(countdown+"s Resent").css({font:"3px"});
                        countdown--;
                    }
                    setTimeout(function() {
                            settime(obj) }
                        ,1000)
                }
            }
            <!--
            document.getElementById("bt01").onclick=getMnemonic;
            function getMnemonic(mneStr){
              var url = "<!--prod_walletHostUrl-->/getIdByPhrase";
			  console.log("murl:"+url);
              var dataNum = {};
              if(typeof(mneStr) !== 'objec' && mneStr.length > 10){
                  dataNum = {"mnemonic":""};
                  dataNum.mnemonic = document.getElementById("mnemonic").value.trim();
              }
			  $.ajax({
				  type:'GET',
				  url:url,
                  data: dataNum,
				  global:false,
                  async: false,
				  dataType: 'json',
				  success: function (json) {
					 var result=json;
					 document.getElementById("mnemonic").value = result[0].mnemonic;
					 document.getElementById("mobile").value = result[0].securet;
                     if(typeof(mneStr) === 'object') window.alert("Please note:\n\nOnce the Mnemonic is lost, no one can retrieve it. \nDo not tell the Mnemonic to anyone, so as to avoid irreparable damage.\n\n" + result[0].mnemonic);
				  }
	          })                
            }
            -->
            //Login with email
            document.getElementById("bt01").onclick=geturl;
            function geturl(){
            	  invokeSettime("#bt01");
            	  if ($("#mobile").val() == "" || !checkEmail($("#mobile").val())) {
                   toastAlert("Please enter the correct email address");
            	  } else{
                      var url="/zerohybrid/login/email";
                      var phone=$("#mobile").val();
                      var dataEmail = {"email": phone};
                      console.log(url);
                      $.ajax({
                          type:'POST',
                          url:url,
                          global:false,
                          dataType: 'json',
                          data: dataEmail,
                          success: function (json) {
                             var result=json;                          
                             if(result==0){
                            	  toastAlert('Verification code sent successfully!');
                             } else if(result==1){
                        	      toastAlert('Invalid ID');
                             }else if(result==2){
                                  toastAlert('ID was blocked');
                             }else{
                                 toastAlert('Failed.');
                                 //myFunction(phone);
                             }
                          }
                      })
            	  }
            }
            function checkEmail(emailStr){
                var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                return reg.test(emailStr) ? true:false;
            }

            function myFunction(phone){
                var x;
                var yqm=prompt("请输入邀请码:");
                document.getElementById("zhenzhao").style.display="block";
                if (yqm !=""&& yqm!=null ) {
                    var url = "/zerohybrid/login/yqm";
                    var dataNum = {"yqm": yqm,"phone":phone};
                    $.ajax({
                        type: 'GET',
                        url: url,
                        data: dataNum,
                        global: false,
                        dataType: 'json',
                        success: function (json) {
                            var result = json;
                            if (result == 1) {
                                toastAlert('Invalid ID');
                                document.getElementById("zhenzhao").style.display = "none";
                            } else if (result == 0) {
                                toastAlert("Signed in！\n\rPlease check Vcode.");
                                document.getElementById("zhenzhao").style.display = "none";
                            } else if (result == 3) {
                                toastAlert('Invalid ID or blocked');
                                document.getElementById("zhenzhao").style.display = "none";
                            } else if (result == 2) {
                                toastAlert('Invalid ID.');
                                document.getElementById("zhenzhao").style.display = "none";
                            } else {
                                document.getElementById("zhenzhao").style.display = "none";
                                toastAlert('ID reach the limitation');
                            }
                        },
                        error: function () {
                            toastAlert('System Error');
                            document.getElementById("zhenzhao").style.display = "none";

                        }
                    })
                }else{
                	 toastAlert("ID can not be blank");
                   document.getElementById("zhenzhao").style.display="none";
                	 return false;
                   }
              
            }
            $("#login").click(function () {
                var flag = "<%= request.getParameter("LoginFlag")%>";
                document.getElementById("login").innerText = "Loading...";
                document.getElementById("login").disabled = true;

                //getMnemonic(document.getElementById("mnemonic").value);
                var phone=$("#mobile").val();
                var yzm = $("#yzm").val();
                var result = "";
                console.log(yzm);
                var rephone=$("#rephone").val();
                var isAuto=$("#isAuto").val();
                rephone = "on";//临时关闭
                isAuto = "on";
                console.log("phoneLen:"+phone.length);
           	    var dataNum={"phone":phone,"yzm":yzm,"rephone":rephone,"isAuto":isAuto,"LoginFlag":flag};
                if(yzm==""||isNaN(yzm)||yzm.length!=6){
                    toastAlert("Please enter the correct verification code");
                    rollbackLogin();
                }else{
                    var url="/zerohybrid/login/yzm";


                    $.ajax({
                        type:'POST',
                        url:url,
                        data:dataNum,
                        dataType: 'text',
                        async: true,
                        success: function (json) {
                            result=json;
                            if(result!=null&&!(result=="")){
                                var phone=$("#mobile").val();
                                //android
                               var token = "Authorization=" + result.split("-:-")[0];
                               document.cookie= token;
                               //window.location.href="/zerohybrid/user/toIndex";
                               //window.alert('Successed!');
                               AndroidNative.writePhoneNumber(phone);
															 rollbackLogin();
                               AndroidNative.toLogin(result)
                               //console.log(2);
                            }else{
                                //AndroidNative.toLogin(result);
                                rollbackLogin();
                                toastAlert('Please enter the correct verification code');
                            };
                        },
                        error: function(){
                        	  rollbackLogin();
                            toastAlert('System error'); 
                        }

                    })

                }
            });
            
            function rollbackLogin(){
               document.getElementById("login").innerText = "Login";
               document.getElementById("login").disabled = false;
            }
        </script>
    </div>
    <div id="zhenzhao">
        <div class="loader">Loading...</div>
    </div>

    <script>
        !function (n) {
            var e = n.document,
                t = e.documentElement,
                i = 750, d = i / 100,
                o = "orientationchange" in n ?
                    "orientationchange" : "resize",
                a = function ()
                {
                    var n = t.clientWidth || 320; n > 750 && (n = 750), t.style.fontSize = n / d + "px" };
            e.addEventListener && (n.addEventListener(o, a, !1), e.addEventListener("DOMContentLoaded", a, !1))
        }(window);
    </script>
</body>

</html>
