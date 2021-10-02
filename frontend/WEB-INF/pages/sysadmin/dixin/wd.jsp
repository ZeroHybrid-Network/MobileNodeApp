<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0" name="viewport"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <title>首页</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/wd.css" />
     <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<!--
    <script src="<%=request.getContextPath()%>/js/modernizr.custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.rwdimagemaps.min.js"></script>
    <script type="<%=request.getContextPath()%>/staticfile/picture/application/x-javascript">
          addEventListener("load", function(){
            setTimeout(hideURLbar, 0);
          }, false);
          function hideURLbar() {
            window.scrollTo(0, 1);
          }
        </script>
-->
</head>
<body>
    <div class="nav"><!--
        <%--href="/zerohybrid/user/toIndex"--%>
        <a href="#" onclick="wd_hideweb()"><img src="<%=request.getContextPath()%>/img/sdzt_2.png"></a>
        <%--<a href="/zerohybrid/user/toIndex"><img src="<%=request.getContextPath()%>/img/sdzt_3.png"></a>--%>
        -->
    </div>
    <div class="content">
        <p class="i1" >Recent Transactions</p>
       <table id="myzuantan">
       </table>
            <script>
                var date=new Array();
                var type=new Array();
                var number=new Array();
                var len;
                var zuanshi=0;
                var addrStr="";
                var zuanshi1=0;
                $(document).ready(function(){
                   ajax();
                });

                function ajax() {
                    <%--var token = "<%= request.getParameter("Authorization")%>";--%>
                    var token = "<%= request.getHeader("authorization")%>";
                    var dataNum={"Authorization":token};
                   var url="/zerohybrid/user/userwd";
                    $.ajax({
                        type: 'POST',
                        url:url,
                        data:dataNum,
                        global:false,
                        dataType: 'json',
                        success: function (json) {
                        var result = json;
                         len=getjsonLength(json);
                         for (var i=0;i<len;i++){
                             date[i]=json[i][0];
                             type[i]=json[i][1];
                             number[i]=json[i][2];
                             zuanshi=zuanshi+parseFloat(number[i]);
                         /*    if(zuanshi1==0){
                                 zuanshi="...";
                             }else{
                                 zuanshi=zuanshi1;
                             }*/
                         }   
                         contain();
                         roll();
                        
                        },
                        error: function(){
                          /*  var conFlag = confirm("登录以后，才可以噢~");
                            if (conFlag) { //确认标志
                                window.location.href = "/dx_chain/login/toLogin";
                            }*/
                        }
                    })
                    function getAddr() {
                        var token = "<%= request.getHeader("authorization")%>";
                        var dataNum={"Authorization":token};
                        var addrUrl="/zerohybrid/user/getuseraddr";
                        $.ajax({
                            type: 'POST',
                            url:addrUrl,
                            data:dataNum,
                            global:false,
                            dataType: 'text',
                            success: function (json) {
                                addrStr = json;
                                contain();
                            },
                            error: function(err){
                                err.toString();
                            }
                        })
                    }
                    getAddr();

                }

                function getjsonLength(jsondata) {
                    var jsonLength=0;
                    for (var item in jsondata)
                    {
                        jsonLength++;
                    }
                    return jsonLength;
                }

                function roll() {
                    $("#myzuantan tr:not(:first)").remove();
                    $("#myzuantan").empty();
                    $("#myzuantan").append("<tr><th>Date</th> <th>Token</th> <th>In/Out</th> </tr>");
                    for (var i = 0; i < len; i++) {
                      if(number[i]==0){
                           // number[i]="...";
                        }else{
                          $("#myzuantan").append("<tr><td> "+date[i]+"</td>" +
                              "<td>" + type[i] + "</td>" + "<td>" + number[i] + "</td>"
                          )
                      }
                    }
                }

                function contain() {

                    if($("#zuan1")!=null)
                    {
                        $(".nav  p").remove();

                    }
                    $(".nav").append(" <p class=\"i1\">My assessment(ZHT)</p>");
                    $(".nav").append("<p class='i2' id='zuan1'>"+zuanshi.toPrecision(7)+"</p>");
                    $(".nav").append("<p class=\"pl\">Address：\n" +
                        "                        <a href=\"javascript:void(0)\" class=\"i4\" style=\"border-radius: .25em;\">"+AndroidNative.getUserAddress()+"</a>\n" +
                        "                    </p>");
                    /*
                    $(".nav").append("<p align='center' class=\"pb\">\n" +
                        "                        <button class=\"button\" type=\"button\" onclick='alert_info()'>Withdraw</button>\n" +
                        "                    </p>");*/
                }
                setInterval('contain()',15000);
                setInterval('roll()',20000);
            </script>
     <%--   </table>--%>
    </div>
    <%--<div class="foot">
        <div class="row">
            <a href="/zerohybrid/user/toIndex"><div class="col-md-6">
                <img src="<%=request.getContextPath()%>/img/foot-2.png">
                <p>ZeroHybrid Token</p>
            </div></a>
            <a href="/zerohybrid/user/toWd"><div class="col-md-6 active">
                <img src="<%=request.getContextPath()%>/img/foot-3.png">
                <p>Account</p>
            </div></a>
        </div>
    </div>--%>
    <!-- 自适应大小规定rem值！！重要 -->
    <script>
        function wd_hideweb() {
            AndroidNative.hideWeb();
        }
        function alert_info() {
            window.alert("敬请期待！")
        }
        !function (n) {
            var e = n.document, t = e.documentElement, i = 750, d = i / 100, o = "orientationchange" in n ? "orientationchange" : "resize", a = function () { var n = t.clientWidth || 320; n > 750 && (n = 750), t.style.fontSize = n / d + "px" };
            e.addEventListener && (n.addEventListener(o, a, !1), e.addEventListener("DOMContentLoaded", a, !1))
        }(window);
    </script>
</body>

</html>
