<%--
  Created by IntelliJ IDEA.
  User: yjsong
  Date: 2018/8/20
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0" name="viewport"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <title>About us</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/yqhy.css" />
</head>
<body>
<div class="nav">
    <img src="<%=request.getContextPath()%>/img/yqhy_1.jpg" class="i1">
    <%--
            <a href="#" onClick="javascript :history.back(-1);"><img src="<%=request.getContextPath()%>/img/sdzt_2.png" class="i2"></a>
    --%>
    <a href="#" onClick="yq_hideweb()"><img src="<%=request.getContextPath()%>/img/sdzt_2.png" class="i2"></a>
</div>
<div class="content">
    <div class="card">
        <button class="i3">App Info</button>
        <center>Copyright 2021 ZeroHybrid Network. App Ver: <b><%= request.getParameter("ver")==null?"0.5.0":request.getParameter("ver")%> </b></center>
    </div>
</div>

<script>
    function yq_hideweb() {
        AndroidNative.hideWeb();
    }
    !function (n) {
        var e = n.document, t = e.documentElement, i = 750, d = i / 100, o = "orientationchange" in n ? "orientationchange" : "resize", a = function ()
        { var n = t.clientWidth || 320; n > 750 && (n = 750), t.style.fontSize = n / d + "px" };
        e.addEventListener && (n.addEventListener(o, a, !1), e.addEventListener("DOMContentLoaded", a, !1))
    }(window);
</script>
</body>
</html>
