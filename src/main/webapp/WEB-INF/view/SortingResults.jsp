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
        <div align="center"><h3>Результати виконання досліду</h3><br>

        <table style="border: 1px solid grey">
        <tbody>
        <h4>&emsp;Час виконання сортування, мс:</h4><br>
            <thead>
            <tr>
                <th>Назва алгоритму</th>
                <th>10 елементів</th>
                <th>50 елементів</th>
                <th>100 елементів</th>
                <th>500 елементів</th>
                <th>1000 елементів</th>
                <th>2500 елементів</th>
                <th>5000 елементів</th>
                <th>10000 елементів</th>
            </tr>
            </thead>
                <c:forEach var="sorting" items="${requestScope.sortTimes}">
                <tbody>
                    <tr>
                        <td><c:out value="${sorting.key}"/></td>
                        <c:forEach var="time" items="${sorting.value}">
                            <td><c:out value="${time}"/></td>
                        </c:forEach>
                    </tr>
                </tbody>
                </c:forEach>
            </div>
        </table>
        <br>
        <h4>&emsp;Залежність часу від кількості елементів у масиві, що сортується, наведено нижче:</h4>
        <br><br>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link type="text/css" rel="StyleSheet" href="http://bootstraptema.ru/plugins/2016/shieldui/style.css" />
        <script src="http://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
        <script src="http://bootstraptema.ru/plugins/2016/shieldui/script.js"></script>

        <div class="container">
            <div class="row">
                <div class="col-md-0 col-md-offset-0">

                    <!-- График --><div id="chart"></div>

                    <script>
                        $(function () {
                            $("#chart").shieldChart({
                                theme: "light",
                                primaryHeader: {
                                    text: "Залежність часу від розміру відсортованого масиву"
                                },
                                exportOptions: {
                                    image: false,
                                    print: false
                                },
                                axisY: [{
                                    min: 0,
                                    max: 1,
                                    title: {
                                        text: 'Час, с',
                                        style: {
                                            color: '#4DB0F5'
                                        }
                                    },
                                    axisTickText: {
                                        style: {
                                            color: '#4DB0F5'
                                        }
                                    }
                                }],
                                axisX: [{
                                    categoricalValues: [10,50,100,500,1000,2500,5000,10000],
                                    <%--categoricalValues: ${requestScope.amounts},--%>
                                    title: {
                                        text: 'К-ть елементів',
                                        style: {
                                            color: '#4DB0F5'
                                        }
                                    },
                                    axisTickText: {
                                        style: {
                                            color: '#4DB0F5'
                                        }
                                    }
                                }],
                                dataSeries: [{
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[0],
                                    data: ${requestScope.times}[0]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[1],
                                    data: ${requestScope.times}[1]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[2],
                                    data: ${requestScope.times}[2]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[3],
                                    data: ${requestScope.times}[3]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[4],
                                    data: ${requestScope.times}[4]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[5],
                                    data: ${requestScope.times}[5]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[6],
                                    data: ${requestScope.times}[6]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[7],
                                    data: ${requestScope.times}[7],
                                }]
                            });
                        });
                    </script><!-- /.График -->
                </div><!-- /.col-md-8 col-md-offset-2 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
        <br>
        <div align="center">
        <form method="get" action="${pageContext.request.contextPath}/api/starter">
            <input type="submit" name="clear" class="b1" value="Повернутися" onclick="openPage('${pageContext.request.contextPath}/starter')"/>
        </form>
        </div>

    </body>

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

    <style type="text/css">
        TABLE {
            border-collapse: collapse;
        }
        TD, TH {
            padding: 3px;
            border: 1px solid black;
        }
    </style>
</html>
