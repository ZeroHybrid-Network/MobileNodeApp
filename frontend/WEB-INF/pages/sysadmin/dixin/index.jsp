<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0" name="viewport"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <title>ZeryHybrid Network</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/staticfile/picture/css/dl.css" />
</head>
<body>

    <div class="content">
        <div class="docdiv">
        <!-- // hide external link at this moment
            <a class="dixingl doclink" >Announcement:</a>
            <marquee id="mar" behavior="scroll">
            </marquee>
        -->
        </div>
        <div class="docdiv">
            <!-- // hide external link at this moment
            <a class="dixingl doclink" onclick="gonglue()">Document</a>
            -->
        </div>
        <div class="dix-right">
        </div>
        <div id="dianxian" class="main_bg">
            <!--<div id="particles-js"></div>-->
        </div>
        <div  id="index" class="index_but row" position="fixed" style="overflow: hidden;">
           <%-- <a onclick="use1()"> <div class="col-md-6">
                <p class="i1"> <p class="i3"><a href=#" >StartNode</a></p></p>
                 </div>
            </a>
            
            <a onclick="use()"> <div class="col-md-6">
                <p class="i2"> <p class="i3">Use ZHT</p></p>
            </div>
            </a><br/><br/><br/><br/><br/><br/><br/>--%>
                <button class="dl" id="login" onclick="AndroidNative.startShare(); return false;">Start Node</button>
               </div>
               </a>

               </div>
        </div>
        <div class="index" style="height:15%">
        <!--
          <table id="pm" >
           <tr>
               <p  align="center">TopN</p>
               <p  align="center">Refresh Hourly</p>
          </tr>
             <tr>
                    <th >NO.</th>
                    <th>Miner</th>
                    <th>ZHT</th>
             </tr>
            </table>
        -->
        </div>
    </div>

 <%--<div class="foot">
        <div class="row">

            <a href="/zerohybrid/user/toIndex"><div class="col-md-6 active">
                <img src="<%=request.getContextPath()%>/img/foot-1.png">
                <p>Mining</p>
            </div></a>
            <a href="/zerohybrid/user/toWd"><div class="col-md-6" active>
                <img src="<%=request.getContextPath()%>/img/foot-4.png">
                <p>My Account</p>
            </div></a>
        </div>
    </div>
</div>--%>

<!--
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
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
        <script type="text/javascript">
            //start-smoth-scrolling
        jQuery(document).ready(function($) {
        $(".scroll").click(function(event) {
        event.preventDefault();
        $('html,body').animate({
        scrollTop: $(this.hash).offset().top
        }, 1000);
        });
        });
        </script>
            <script type="text/javascript">
        // start-smoth-scrolling
                $(document).ready(function(){
                    getnotice();
                });
                function getnotice() {
                    var url="/zerohybrid/common/getnotice";
                    $.ajax({
                        type: 'POST',
                        url:url,
                        global:false,
                        dataType: 'text',
                        success: function (json) {
                            var notice = json;
                            if (notice!=null&&!notice.match("null")) {
                                $("#mar").text(notice);
                            }
                        },
                        error: function(){
                            //$("#mar").text("测试");
                        }
                    })
                }
            </script>
-->
                <script>                  
                    var user=new Array();
                    var username=new Array();
                    var zuanshi=new Array();
                    var len;
                    var zuans=0;
                    var shendu=0;
                    $(document).ready(function(){
                        contain();
                        reload();
                    });
                   function reload() {
                	    //alert("更新");
                       //var url="http://47.95.198.146:8080/zerohybrid/rest/SmsDemoService/user/pm";
                       var token = "<%= request.getHeader("authorization")%>";
                       if (token.match("null")){
                           token = "<%= request.getParameter("Authorization")%>";
                       }
                       var dataNum={"Authorization":token};
                       var url="/zerohybrid/user/pm";
                       $.ajax({
                           type: 'POST',
                           url:url,
                           data:dataNum,
                           global:false,
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
                               //window.alert('System Error. Code3');
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
                      $("#pm").append("<tr><th>No.</th> <th>Miner</th> <th>Token</th> </tr>");
                        for (var i = 0; i < len; i++) {
                            var j = i + 1;
                            if(zuanshi[i]==0 ||  null==zuanshi[i] ){
                                zuanshi[i]="...";
                            }
                            if (i == 0) {
                                    $("#pm").append("<tr> <td class='ta_mingci'><img src=\"../img/index_7.png\"></td>" +
                                        "<td>" + username[i] + "</td>" + "<td>" + zuanshi[i] + "</td>"
                                    )
                            } else if (i == 1) {
                                    $("#pm").append("<tr> <td class='ta_mingci'><img src=\"../img/index_8.png\"></td>" +
                                        "<td>" + username[i] + "</td>" + "<td>" + zuanshi[i] + "</td>"
                                    )
                            } else if(i==2){
                                    $("#pm").append("<tr> <td class='ta_mingci'><img src=\"../img/index_9.png\"></td>" +
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
                    	 //var url="http://47.95.198.146:8080/zerohybrid/rest/SmsDemoService/user/zs";
                        var token = "<%= request.getHeader("authorization")%>";
                        if (token.match("null")){
                            token = "<%= request.getParameter("Authorization")%>";
                        }
                        //alert("index-header"+header);
                        <%--var token = "<%= request.getParameter("Authorization")%>";--%>

                        var dataNum={"Authorization":token};
                    	 var  url="/zerohybrid/user/zs";
                    	 $.ajax({
                             type:'POST',
                             url:url,
                             data:dataNum,
                             global:false,
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
                                 //window.alert('系统错误。请联系管理员4');
                             }
                         });
                    }
                    setInterval('contain()',15000);
                    function use() {
                        alert("Coming soon ~ ")
                    }
                    function logout(){
                        var iframe = document.createElement("IFRAME");
                        iframe.setAttribute("src", 'data:text/plain,');
                        document.documentElement.appendChild(iframe);
                        if(window.frames[0].window.confirm("Confirm to exit?")){
                            document.cookie = "";
                            AndroidNative.logout();
                        }
                    }
                    function gonglue() {
                        var token = "<%= request.getHeader("authorization")%>";
                        if (token.match("null")){
                            token = "<%= request.getParameter("Authorization")%>";
                        }
                        //window.location.href="/zerohybrid/user/toGongLue"+"?Authorization="+token;
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
                	   var token = "<%= request.getHeader("authorization")%>";
                       if (token.match("null")){
                           token = "<%= request.getParameter("Authorization")%>";
                       }
                       window.location.href="/zerohybrid/user/toShenduzt"+"?Authorization="+token;
                       /*if(count){
                	   }else {
                           var conFlag = confirm("Please login~");
                           if (conFlag) { //确认标志
                               window.location.href = "/zerohybrid/login/toLogin";
                           }
                       }*/
                   }
                </script>
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
  <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
  <script src="<%=request.getContextPath()%>/staticfile/picture/js/particles.min.js"></script>
  <script src="<%=request.getContextPath()%>/staticfile/picture/js/p.js"></script>
</body>
</html>
