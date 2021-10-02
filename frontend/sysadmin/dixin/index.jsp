<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0" name="viewport"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <title>地心首页</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/staticfile/picture/css/base.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/staticfile/picture/css/main.css" />
        <!-- js -->
        <script src="<%=request.getContextPath()%>/staticfile/picture/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/staticfile/picture/js/modernizr.custom.min.js"></script>
        <script src="<%=request.getContextPath()%>/staticfile/picture/js/jquery.rwdimagemaps.min.js"></script>
        <script type="<%=request.getContextPath()%>/staticfile/picture/application/x-javascript">
          addEventListener("load", function(){
            setTimeout(hideURLbar, 0);
          }, false);
          function hideURLbar() {
            window.scrollTo(0, 1);
          }
        </script>
        <!-- js -->
            <!-- start-smoth-scrolling -->
        <script type="text/javascript">
        jQuery(document).ready(function($) {
        $(".scroll").click(function(event) {
        event.preventDefault();
        $('html,body').animate({
        scrollTop: $(this.hash).offset().top
        }, 1000);
        });
        });
        </script>
        <!-- start-smoth-scrolling -->
</head>
<body>

    <div class="content">
        <div class="gonggao">
            <img src="<%=request.getContextPath()%>/staticfile/picture/img/index_1.png" class="i1">
            <span class="i2">公告 ：</span>
            <span class="i3">
            <marquee id="mar" behavior="scroll">地心开始内测，初期对持续稳定贡献计算的用户特别鼓励。DXC定期会有兑换活动，敬请期待！</marquee>
             </span>
        </div>
        <div style="height: 1.2rem;overflow: hidden;background: url(<%=request.getContextPath()%>/staticfile/picture/img/index_2.png) top left no-repeat; background-size: auto 60%; margin-top: 0.2rem;">
            <a class="dixingl" href="#"><p>地心攻略</p></a>
        </div>
        <div class="dix-right">
        </div>
        <div id="dianxian">
            <div id="particles-js"></div>
        </div>
        <div  id="index" class="index_but row" position="relative">
           <%-- <a onclick="use1()"> <div class="col-md-6">
                <p class="i1"> <p class="i3">深度钻探</p></p>
                 </div>
            </a>
            <a onclick="use()"> <div class="col-md-6">
                <p class="i2"> <p class="i3">使用钻石</p></p>
            </div>
            </a>--%>
               <a onclick="use1()"> <div id="sd" class="col-md-6"  position="absolute">
                <p class="i1"  style="color:white; font-size:20px;" > 深度钻探 </p>
               </div>
               </a>
               <a onclick="use()"> <div  id="sy" class="col-md-6" position="absolute">
                 <p class="i2" style="color:white; font-size:20px;">使用钻石</p>  </p>
               </div>
               </a>
        </div>
        <div class="paihang">
          <table id="pm">
           <tr>
               <p  align="center">排行榜</p>
               <p  align="center">排名数据每小时更新一次</p>
          </tr>
             <tr>
                    <th >排名</th>
                    <th>用户</th>
                    <th>钻石</th>
             </tr>
                <script>                  
                    var user=new Array();
                    var username=new Array();
                    var zuanshi=new Array();
                    var len;
                    var zuans=0;
                    var shendu=0;                  
                  window.onload=function () {
                	  contain();
                      reload();
                  }
                   function reload() {
                	    //alert("更新");
                       //var url="http://47.95.198.146:8080/dx_chain/rest/SmsDemoService/user/pm";
                      var iport="http://47.95.198.146:8080";
                      var url="/dx_chain/user/pm";
                       $.ajax({
                           type: 'POST',
                           url:url,
                           dataType: 'json',
                           success: function (json) {
                               len=getjsonLength(json);
                               for (var i=0;i<len;i++){
                                   username[i]=json[i][0];
                                   console.log(username[i]);
                                   zuanshi[i]=json[i][1];
                                   if(zuanshi[i]==0 || zuanshi[i]=="" || zuanshi[i]==null || zuanshi[i]=="0" ){
                                       zuanshi[i]="...";
                                   }
                                   console.log(zuanshi[i]);
                               }
                              contain();
                              roll();
                           },
                           error: function(){
                               window.alert('系统错误。请联系管理员3');
                           }
                       })
                    }
                  setInterval('reload()',30000);
                  function getjsonLength(jsondata) {
                        var jsonLength=0;
                        for (var item in jsondata){
                            jsonLength++;
                        }
                       return jsonLength;
                }
                 function roll() {
                      $("#pm tr:not(:first)").remove();
                      $("#pm").append("<tr><th>排名</th> <th>用户</th> <th>钻石</th> </tr>");
                        for (var i = 0; i < len; i++) {
                            var j = i + 1;
                            if(zuanshi[i]==0 ||  null==zuanshi[i] ){
                                zuanshi[i]="...";
                            }
                            if (i == 0) {
                                    $("#pm").append("<tr> <td class='ta_mingci'><img src=\"./img/index_7.png\"></td>" +
                                        "<td>" + username[i] + "</td>" + "<td>" + zuanshi[i] + "</td>"
                                    )
                            } else if (i == 1) {
                                    $("#pm").append("<tr> <td class='ta_mingci'><img src=\"./img/index_8.png\"></td>" +
                                        "<td>" + username[i] + "</td>" + "<td>" + zuanshi[i] + "</td>"
                                    )
                            } else if(i==2){
                                    $("#pm").append("<tr> <td class='ta_mingci'><img src=\"./img/index_9.png\"></td>" +
                                        "<td>" + username[i] + "</td>" + "<td>" + zuanshi[i] + "</td>"
                                    )
                            } else if (i < 9) {
                                $("#pm").append("<tr> <td class='ta_mingci'>0" + j + "</td>" +
                                    "<td>" + username[i] + "</td>" + "<td>" + zuanshi[i] + "</td>"
                                )
                            } else {
                                $("#pm").append("<tr> <td class='ta_mingci'>" + j + "</td>" +
                                    "<td>" + username[i] + "</td>" + "<td>" +"..." + "</td>"
                                )
                                console.log(zuanshi[i]);
                            }
                        }
                        }

                     var   count=false;
                    function contain() {
                        if($("#shen")!=null&&$("#demo")!=null) {
                          $(".dix-right  p").remove();
                        }
                    	 //var url="http://47.95.198.146:8080/dx_chain/rest/SmsDemoService/user/zs";
                    	 var  url="/dx_chain/user/zs";
                    	 $.ajax({
                             type:'POST',
                             url:url,
                             dataType: 'json',
                             success: function (json) {
                            	 if("1"==json){
                            		//setInterval(alert("登录以后，就可以看见你的钻石了噢~ "),20000000000000);
                            	 }else{
                            		  count=true;
                            		  shendu=json.shendu;
                                 	 console.log(shendu);
                                      zuans=json.zuanshi;  
                                 	 console.log(zuans);
                                 	 if(shendu==null || shendu==0 || shendu=="0"){
                                         shendu="...";
                                 	 }
                                 	 if(zuans==null  || zuans==0 || zuans=="0"){
                                 		zuans="...";
                                 	 }
                                     $(".dix-right").empty();
                                 	 $(".dix-right").append("<p>深度：<span id=\"shen\">"+shendu+"</span></p>");
                                     $(".dix-right").append("<p>钻石：<span id=\"demo\">"+zuans+"</span></p>");
                            	 }
                             },
                             error: function(){
                                 window.alert('系统错误。请联系管理员4');
                             }
                         });
                    }
                    setInterval('contain()',15000);
                    function use() {
                        alert("敬请期待噢 ~ ")
                    }
                    //获取cookie
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
                   function use1(){
                	   /* var str = getCookie("phone");
                	   console.log("1111111111");
                	   if(null!=str){
                		   console.log("shendu");
                           window.location.href="shenduzt.jsp";           
                	   }else{
                		   console.log("login");
                           window.location.href="login.jsp";          
                	   } */
                	   if(count){
                		   window.location.href="/dx_chain/user/toShenduzt";
                	   }else {
                           var conFlag = confirm("登录以后，才可以噢~");
                           if (conFlag) { //确认标志
                               window.location.href = "/dx_chain/login/toLogin";
                           }
                       }
                   }
                </script>
            </table>
        </div>
    </div>

 <div class="foot">
        <div class="row">

            <a href="/dx_chain/user/toIndex"><div class="col-md-6 active">
                <img src="<%=request.getContextPath()%>/img/foot-1.png">
                <p>地心矿产</p>
            </div></a>
            <a href="/dx_chain/user/toWd"><div class="col-md-6" active>
                <img src="<%=request.getContextPath()%>/img/foot-4.png">
                <p>我的地心</p>
            </div></a>
        </div>
    </div>
</div>

  <script>
        !function (n) {
            var e = n.document, t = e.documentElement, i = 750, d = i / 100, o = "orientationchange" in n ? "orientationchange" : "resize", a = function () { var n = t.clientWidth || 320; n > 750 && (n = 750), t.style.fontSize = n / d + "px" };
            e.addEventListener && (n.addEventListener(o, a, !1), e.addEventListener("DOMContentLoaded", a, !1))
        }(window);
 </script>

<script>
    $(document).ready(function() {
	    $('img[usemap]').rwdImageMaps();
	    $(".usecase-btn").click(function(){
		    var id = $(this).attr("id");
		    var currentActive = $(".usecase-active");
		    var curId=currentActive.attr("id");
		    if(id == curId) return;
		    currentActive.removeClass("usecase-active");
		    $(this).addClass("usecase-active");
		    $("#" + curId + "_content").slideToggle();
		    $("#" + id + "_content").slideToggle();
	    });
    });
  </script>
  <script src="<%=request.getContextPath()%>/staticfile/picture/js/particles.min.js"></script>
  <script src="<%=request.getContextPath()%>/staticfile/picture/js/p.js"></script>
  <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>