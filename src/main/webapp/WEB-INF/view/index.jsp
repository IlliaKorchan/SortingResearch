<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: koill
  Date: 18.05.2019
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Дослідження алгоритмів сортування</title>
</head>
<body>
    <form method="GET" action="${pageContext.request.contextPath}/api/starter">
        <div align="center"><h3>Вас вітає аналізатор алгоритмів сортування!</h3></div>
        <p align="center">Для початку роботи натисніть "Розпочати"<br></p>
        <p align="center"><input type="submit" name="select" class="b1" value="Розпочати" onclick="openPage('${pageContext.request.contextPath}/starter')"/></p>
    </form>

    <script type="text/javascript">
        function openPage(pageURL)
        {
            window.location.href = pageURL;
        }
    </script>

    <style>
        body {
            background: #BAE8E7;
        }
    </style>

    <style>
        .b1 {
            background: #BAC6E8;
            color: black;
        }
    </style>
</body>
</html>


