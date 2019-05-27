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
    <title>Сортування "Бульбашкою"</title>
</head>


<body>
<div align="center"><h3>Сортування "Бульбашкою"</h3></div>
&emsp;&emsp;Сортування обміном або сортування бульбашкою є простим алгоритмом сортування. Алгоритм працює таким чином — у
поданому наборі даних (списку чи масиві) порівнюються два сусідні елементи. Якщо один з елементів, не відповідає
критерію сортування (є більшим, або ж, навпаки, меншим за свого сусіда), то ці два елементи міняються місцями.
Прохід по списку продовжується доти, доки дані не будуть відсортованими. Алгоритм отримав свою назву від того,
що процес сортування за ним нагадує поведінку бульбашок повітря у резервуарі з водою. Оскільки для роботи
з елементами масиву він використовує лише порівняння, це сортування на основі порівнянь.<br>
<br>
&emsp;&emsp;Складність алгоритму у найгіршому у середньостатистичному випадку рівна О(n²), де n — кількість елементів
для сортування. Існує чимало значно ефективніших алгоритмів, наприклад, з найгіршою ефективністю рівною O(n log n).
Тому даний алгоритм має низьку ефективність у випадках, коли N є досить великим, за винятком рідкісних конкретних
випадків, коли заздалегідь відомо, що масив з самого початку буде добре відсортований.<br>
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
        boolean needIteration = true;
        while (needIteration) {
            needIteration = false;
            for (int i = 1; i < array.length; i++) {
                if (array[i] < array[i - 1]) {
                    swap(array, i, i-1);
                    needIteration = true;
                }
            }
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
