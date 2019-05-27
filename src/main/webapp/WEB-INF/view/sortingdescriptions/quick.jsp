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
    <title>Швидке сортування</title>
</head>

<body>
<div align="center"><h3>Швидке сортування</h3></div>
&emsp;&emsp;Швидке сортування (англ. Quick Sort) — алгоритм сортування, добре відомий, як алгоритм розроблений Тоні Гоаром, який
не потребує додаткової пам'яті і виконує у середньому O(nlog N) операцій. Однак, у найгіршому випадку робить O(n2) порівнянь.
Оскільки алгоритм використовує дуже прості цикли і операції, він працює швидше інших алгоритмів, що мають таку ж
асимптотичну оцінку складності. Наприклад, зазвичай більш ніж удвічі швидший порівняно з сортуванням злиттям.
<br>
&emsp;&emsp;Ідея алгоритму полягає в переставлянні елементів масиву таким чином, щоб його можна було розділити на дві частини
і кожний елемент з першої частини був не більший за будь-який елемент з другої. Впорядкування кожної з частин відбувається
рекурсивно. Алгоритм швидкого сортування може бути реалізований як у масиві, так і в двозв'язному списку.
<br>
&emsp;&emsp;Швидке сортування є алгоритмом на основі порівнянь, і не є стабільним.<br>
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
        <td>O(nlog n)</td>
    </tr>
    <tr>
        <td>Середній</td>
        <td>O(nlog n)</td>
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
    private void quick(Integer[] array, int left, int right) {
        int leftMarker = left;
        int rightMarker = right;
        int pivot = array[(leftMarker + rightMarker) / 2];
        do {
            while (array[leftMarker] < pivot) {
                leftMarker++;
            }

            while (array[rightMarker] > pivot) {
                rightMarker--;
            }

            if (leftMarker <= rightMarker) {
                if (leftMarker < rightMarker) {
                    int tmp = array[leftMarker];
                    array[leftMarker] = array[rightMarker];
                    array[rightMarker] = tmp;
                }

                leftMarker++;
                rightMarker--;
            }
        } while (leftMarker <= rightMarker);

        if (leftMarker < right) {
            quick(array, leftMarker, right);
        }
        if (left < rightMarker) {
            quick(array, left, rightMarker);
        }
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
