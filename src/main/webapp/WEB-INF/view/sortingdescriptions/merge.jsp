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
    <title>Сортування злиттям</title>
</head>

<body>
<div align="center"><h3>Сортування злиттям</h3></div>
&emsp;&emsp;Сортування злиттям (англ. merge sort) — алгоритм сортування, в основі якого лежить принцип «Розділяй та володарюй».<br>
&emsp;&emsp;В основі цього способу сортування лежить злиття двох упорядкованих ділянок масиву в одну впорядковану ділянку
іншого масиву. Злиття двох упорядкованих послідовностей можна порівняти з перебудовою двох колон солдатів, вишикуваних
за зростом, в одну, де вони також розташовуються за зростом. Якщо цим процесом керує офіцер, то він порівнює зріст
солдатів, перших у своїх колонах і вказує, якому з них треба ставати останнім у нову колону, а кому залишатися першим
у своїй. Так він вчиняє, поки одна з колон не вичерпається — тоді решта іншої колони додається до нової.
<br>
&emsp;&emsp;Під час сортування в дві допоміжні черги з основної поміщаються перші дві відсортовані підпослідовності, які потім
зливаються в одну і результат записується в тимчасову чергу. Потім з основної черги беруться наступні дві відсортовані
підпослідовності і так доти, доки основна черга не стане порожньою. Після цього послідовність з тимчасової черги
переміщається в основну чергу. І знову продовжується сортування злиттям двох відсортованих підпослідовностей. Сортування
триватиме доти, доки довжина відсортованої підпослідовності не стане рівною довжині самої послідовності.<br>
<br>
Складність алгоритму:<br>
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
        <td>O(nlog n)</td>
    </tr>
    </tbody>
</table>
<br>
&emsp;&emsp;Реалізація алгоритму мовою Java:<br>
<pre>
    private void merge(Integer[] array, int left, int right) {
        if (right <= left)
            return;

        int middle = left + (right - left) / 2;
        merge(array, left, middle);
        merge(array, middle + 1, right);

        Integer[] buf = Arrays.copyOf(array, array.length);

        for (int k = left; k <= right; k++)
            buf[k] = array[k];

        int i = left, j = middle + 1;
        for (int k = left; k <= right; k++) {

            if (i > middle) {
                array[k] = buf[j];
                j++;
            } else if (j > right) {
                array[k] = buf[i];
                i++;
            } else if (buf[j] < buf[i]) {
                array[k] = buf[j];
                j++;
            } else {
                array[k] = buf[i];
                i++;
            }
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
