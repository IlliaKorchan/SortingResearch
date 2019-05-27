<%--
  Created by IntelliJ IDEA.
  User: koill
  Date: 26.05.2019
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>"Човникове" сортування</title>
</head>

<body>
<div align="center"><h3>"Човникове" сортування</h3></div>
&emsp;&emsp;Човникове сортування працює так само, як стандартний обмін, до тих пір, поки не треба виконувати перестановку.
При черговому порівнянні порівнюваний запис з меншим ключем переміщається наскільки це можливо до початку списку.
Якщо його ключ менше, ніж у попередника, то виконується обмін і починається чергове порівняння.
<br>
&emsp;&emsp;Човникове сортування характеризується наступними параметрами:<br>
Якісні:<br>
&emsp;1. Простота програмування.<br>
&emsp;2. Потрібно наявність всіх записів до початку сортування.<br>
&emsp;3. Час на сортування залежить від ступеня впорядкованості вихідного набору даних<br>
Кількісні:<br>
&emsp;1. Число порівнянь постійно N * (N-1) / 2.<br>
&emsp;2. Число обмінів:<br>
&emsp;&emsp;&bull; мінімальне - 0;<br>
&emsp;&emsp;&bull; максимальне - N * (N-1) / 2.<br>
&emsp;3. Додатковий обсяг пам'яті потрібно для запам'ятовування одного запису при реалізації операції обміну.<br>
<br>
&emsp;&emsp;Складність алгоритму:<br>
<br>
<table>
    <tbody>
    <tr>
        <th>Випадок</th>
        <th>Складність</th>
    </tr>
    <tr>
        <td>Найкращий</td>
        <td>O(n)</td>
    </tr>
    <tr>
        <td>Середній</td>
        <td>O(n<sup><small>2</small></sup>)</td>
    </tr>
    <tr>
        <td>Найгірший</td>
        <td>O(n<sup><small>2</small></sup>)</td>
    </tr>
    </tbody>
</table>
<br>
&emsp;&emsp;Реалізація алгоритму мовою Java:<br>
<pre>
    public Integer[] sort(Integer[] array) {
        for (int i = 1; i < array.length; i++) {
            if (array[i] < array[i - 1]) {
                swap(array, i, i - 1);
                for (int z = i - 1; (z - 1) >= 0; z--) {
                    if (array[z] < array[z - 1]) {
                        swap(array, z, z - 1);
                    } else {
                        break;
                    }
                }
            }
        }
        return array;
    }

    private static void swap(Integer[] array, int index1, int index2) {
        int tmp = array[index1];
        array[index1] = array[index2];
        array[index2] = tmp;
    }
    </pre>

<form method="get" action="${pageContext.request.contextPath}/api/starter">
    <input type="submit" name="clear" class="b1" value="Повернутися" onclick="openPage('${pageContext.request.contextPath}/starter')"/>
</form>

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
</body>
</html>
