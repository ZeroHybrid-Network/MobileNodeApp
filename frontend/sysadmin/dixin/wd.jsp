<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0" name="viewport"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <title>首页</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/wd.css" />
     <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/modernizr.custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.rwdimagemaps.min.js"></script>
</head>
<body>
    <div class="nav">
        <a href="/zerohybrid/user/toIndex"><img src="<%=request.getContextPath()%>/img/sdzt_2.png"></a>
        <a href="/zerohybrid/user/toIndex"><img src="<%=request.getContextPath()%>/img/sdzt_3.png"></a>
    </div>
    <div class="content">
        <p class="i1">Recent Transactions</p>
        <%--<table id="myzuantan">
            <tr>
                <th class="i2">Date</th>
                <th class="i3">Type</th>
                <th class="i4">In/Out</th>
            </tr>--%>
            <script>
                var date=new Array();
                var type=new Array();
                var number=new Array();
                var len;
                var zuanshi=0;
                var zuanshi1=0;
                window.onload=function () {
                        ajax();
                }
                function ajax() {
                   // var url="http://47.95.198.146:8080/zerohybrid/rest/SmsDemoService/user/userwd";
                   var url="/zerohybrid/user/userwd";
                    $.ajax({
                        type: 'POST',
                        url:url,
                        global:false,
                        dataType: 'json',
                        success: function (json) {
                         len=getjsonLength(json);
                         for (var i=0;i<len;i++){
                             date[i]=json[i][0];
                             type[i]=json[i][1];
                             number[i]=json[i][2];
                             zuanshi=zuanshi+parseInt(number[i]);
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
                                window.location.href = "/zerohybrid/login/toLogin";
                            }*/
                        }
                    })

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
                    $("#myzuantan").append("<tr><th>日期</th> <th>类型</th> <th>数量</th> </tr>");
                    for (var i = 0; i < len; i++) {
                      if(number[i]==0){
                            //number[i]="...";
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
                    $(".nav").append(" <p class=\"i1\">我的地心</p>");
                    $(".nav").append("<p class='i2' id='zuan1'>"+zuanshi+"</p>");
                    $(".nav").append(" <p class=\"i3\">钻石数</p>");
                }
                setInterval('contain()',15000);
                setInterval('roll()',20000);
            </script>
     <%--   </table>--%>
    </div>
    <div class="foot">
        <div class="row">
            <a href="/zerohybrid/user/toIndex"><div class="col-md-6">
                <img src="<%=request.getContextPath()%>/img/foot-2.png">
                <p>地心矿产</p>
            </div></a>
            <a href="/zerohybrid/user/toWd"><div class="col-md-6 active">
                <img src="<%=request.getContextPath()%>/img/foot-3.png">
                <p>我的地心</p>
            </div></a>
        </div>
    </div>
    <!-- 自适应大小规定rem值！！重要 -->
    <script>
        !function (n) {
            var e = n.document, t = e.documentElement, i = 750, d = i / 100, o = "orientationchange" in n ? "orientationchange" : "resize", a = function () { var n = t.clientWidth || 320; n > 750 && (n = 750), t.style.fontSize = n / d + "px" };
            e.addEventListener && (n.addEventListener(o, a, !1), e.addEventListener("DOMContentLoaded", a, !1))
        }(window);
    </script>
</body>

</html>
