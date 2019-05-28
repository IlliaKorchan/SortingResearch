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
        <%--<h3>--%>
            <%--<c:forEach var="result" items="${requestScope.results}">--%>
                <%--<c:out value="${result}"/><br>--%>
            <%--</c:forEach>--%>
        <%--</h3>--%>
        <%--<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="600" height="70">--%>
            <%--<polyline points="5,35 5,20, 100,20, 150,35, 295,35, 250,50, 420,50 440,65"--%>
                      <%--stroke="#b4241b" stroke-width="3" fill="none" />--%>
        <%--</svg>--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link type="text/css" rel="StyleSheet" href="http://bootstraptema.ru/plugins/2016/shieldui/style.css" />
        <script src="http://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
        <script src="http://bootstraptema.ru/plugins/2016/shieldui/script.js"></script>

        <br><br><br>

        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">

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
                                dataSeries: [{
                                    seriesType: 'line',
                                    axis: 0,
                                    collectionAlias: ${requestScope.sortings}[0],
                                    data: ${requestScope.times}[0]
                                }, {
                                    seriesType: 'line',
                                    axis: 1,
                                    collectionAlias: ${requestScope.sortings}[1],
                                    data: ${requestScope.times}[1]
                                }, {
                                    seriesType: 'line',
                                    axis: 2,
                                    collectionAlias: ${requestScope.sortings}[2],
                                    data: ${requestScope.times}[2]
                                }]
                            });
                        });
                    </script><!-- /.График -->

                </div><!-- /.col-md-8 col-md-offset-2 -->
            </div><!-- /.row -->
        </div><!-- /.container -->

        <form method="get" action="${pageContext.request.contextPath}/api/starter">
            <input type="submit" name="clear" class="b1" value="Повернутися" onclick="openPage('${pageContext.request.contextPath}/starter')"/>
        </form>

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
</html>
