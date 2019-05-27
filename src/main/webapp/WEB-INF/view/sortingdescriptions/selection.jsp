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
    <title>Сортування вибором</title>
</head>

<body>
<div align="center"><h3>Сортування вибором</h3></div>
&emsp;&emsp;Сортування вибором — простий алгоритм сортування лінійного масиву, на основі вставок. Має ефективність n2,
що робить його неефективним при сортуванні великих масивів, і в цілому, менш ефективним за подібний алгоритм сортування
включенням. Сортування вибором вирізняється більшою простотою, ніж сортування включенням, і в деяких випадках, вищою
продуктивністю.
<br>
&emsp;&emsp;Алгоритм працює таким чином:<br>
1) Знаходить у списку найменше значення<br>
2) Міняє його місцями із першим значеннями у списку<br>
3) Повторює два попередніх кроки, доки список не завершиться (починаючи з наступної позиції)<br>
Фактично, таким чином ми поділили список на дві частини: перша (ліва) — повністю відсортована, а друга (права) — ні.<br>
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
        <td>O(n<sup><small>2</small></sup>)</td>
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
        for (int left = 0; left < array.length; left++) {
            int minInd = left;
            for (int i = left; i < array.length; i++) {
                if (array[i] < array[minInd]) {
                    minInd = i;
                }
            }
            swap(array, left, minInd);
        }
        return array;
    }

    private void swap(Integer[] array, int index1, int index2) {
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
