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
    <title>Сортування вставкою</title>
</head>

<body>
<div align="center"><h3>Сортування вставкою</h3></div>
&emsp;&emsp;Сортування вставкою — простий алгоритм сортування на основі порівнянь. На великих масивах є значно менш ефективним
за такі алгоритми, як швидке сортування, пірамідальне сортування та сортування злиттям. Однак, має цілу низку переваг:<br>
- простота у реалізації;<br>
- ефективний (зазвичай) на маленьких масивах;<br>
- ефективний при сортуванні масивів, дані в яких вже непогано відсортовані: продуктивність рівна O(n + d),
де d — кількість інверсій;<br>
- на практиці ефективніший за більшість інших квадратичних алгоритмів (O(n2)), як то сортування вибором та сортування
бульбашкою: його швидкодія рівна n2/4, і в найкращому випадку є лінійною;<br>
- є стабільним алгоритмом.<br>
Наприклад, більшість людей при сортуванні колоди гральних карт, використовують метод, схожий на алгоритм сортування вставкою.
<br>
&emsp;&emsp;На кожному кроці алгоритму ми вибираємо один з елементів вхідних даних і вставляємо його на потрібну позицію у вже
відсортованому списку доти, доки набір вхідних даних не буде вичерпано. Метод вибору чергового елементу з початкового
масиву довільний; може використовуватися практично будь-який алгоритм вибору. Зазвичай (із метою отримання стійкого
алгоритму сортування), елементи вставляються за порядком їх появи у вхідному масиві.<br>
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
        for (int left = 0; left < array.length; left++) {
            int value = array[left];
            int i = left - 1;
            for (; i >= 0; i--) {
                if (value < array[i]) {
                    array[i + 1] = array[i];
                } else {
                    break;
                }
            }
            array[i + 1] = value;
        }
        return array;
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
