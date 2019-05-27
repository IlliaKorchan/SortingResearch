<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: koill
  Date: 25.05.2019
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Результати сортування</title>
    </head>

    <body>
        <h3>
            <c:forEach var="result" items="${requestScope.results}">
                <c:out value="${result}"/><br>
            </c:forEach>
        </h3>
        <form method="get" action="${pageContext.request.contextPath}/api/starter">
            <input type="submit" name="clear" class="b1" value="Повернутися" onclick="openPage('${pageContext.request.contextPath}/starter')"/>
        </form>

        <div align="center" id="line_top_x"></div>
    </body>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['line']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var results = ${requestScope.results};
            var data = new google.visualization.DataTable();

            data.addColumn('number', 'К-ть елементів');
            data.addColumn('number', 'Guardians of the Galaxy');
            data.addColumn('number', 'The Avengers');
            data.addColumn('number', 'Transformers: Age of Extinction');

            data.addRows([
                [10,  37.8, 80.8, 41.8],
                [50,  37.8, 80.8, 41.8],
                [100,  37.8, 80.8, 41.8],
                [500,  37.8, 80.8, 41.8],
                [1000,  30.9, 69.5, 32.4],
                [2500,  30.9, 69.5, 32.4],
                [5000,  30.9, 69.5, 32.4],
                [10000,  25.4,   57, 25.7]
            ]);

            var options = {
                chart: {
                    title: 'Залежність часу від кількості елементів у відсортованому масиві',
                },
                width: 900,
                height: 500,
                axes: {
                    x: {
                        0: {side: 'top'}
                    }
                }
            };

            var chart = new google.charts.Line(document.getElementById('line_top_x'));

            chart.draw(data, google.charts.Line.convertOptions(options));
        }
    </script>

    <style>
        body {
            background: #BAE8E7; /* Цвет фона */
        }
    </style>

    <style>
        .b1 {
            background: #BAC6E8; /* Синий цвет фона */
            color: black; /* Белые буквы */
        }
    </style>
</html>
