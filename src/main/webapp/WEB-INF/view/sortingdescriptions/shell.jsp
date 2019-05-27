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
    <title>Сортування методом Шелла</title>
</head>

<body>
<div align="center"><h3>Сортування методом Шелла</h3></div>
&emsp;&emsp;Сортува́ння Ше́лла — це алгоритм сортування, що є узагальненням сортування включенням.<br>
<br>
&emsp;&emsp;Алгоритм базується на двох тезах:<br>
1) Сортування включенням ефективне для майже впорядкованих масивів.<br>
2) Сортування включенням неефективне, тому що переміщує елемент тільки на одну позицію за раз.<br>
Тому сортування Шелла виконує декілька впорядкувань включенням, кожен раз порівнюючи і переставляючи елементи,
що розташовані на різній відстані один від одного. Сортування Шелла не є стабільним.
<br>
&emsp;&emsp;Ідея алгоритму полягає у наступному:<br>
На початку обираються m-елементів: d1, d2, ..., dm, причому, d1 > d2 > ... > dm = 1. Потім виконується m впорядкувань
методом включення, спочатку для елементів, що стоять через d1, потім для елементів через d2 і т. д. до dm = 1.
Ефективність досягається тим, що кожне наступне впорядкування вимагає меншої кількості перестановок, оскільки деякі
елементи вже стали на свої місця.<br>
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
        <td>В залежності від кроку</td>
    </tr>
    <tr>
        <td>Найгірший</td>
        <td>В залежності від кроку</td>
    </tr>
    </tbody>
</table>
<br>
&emsp;&emsp;Реалізація алгоритму мовою Java:<br>
<pre>
    public Integer[] sort(Integer[] array) {
        int gap = array.length / 2;
        while (gap >= 1) {
            for (int right = 0; right < array.length; right++) {
                for (int c = right - gap; c >= 0; c -= gap) {
                    if (array[c] > array[c + gap]) {
                        swap(array, c, c + gap);
                    }
                }
            }
            gap = gap / 2;
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
