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
    <title>Сортування підрахунком</title>
</head>

<body>
    <div align="center"><h3>Сортування підрахунком</h3></div>
    &emsp;&emsp;Сортування підрахунком (англ. Counting sort) — алгоритм впорядкування, що застосовується при малій кількості
    різних елементів (ключів) у масиві даних. Час його роботи лінійно залежить як від загальної кількості елементів у масиві
    так і від кількості різних елементів.
    <br>
    &emsp;&emsp;Ідея алгоритму полягає в наступному: спочатку підрахувати скільки разів кожен елемент (ключ) зустрічається
    в вихідному масиві. Спираючись на ці дані можна одразу вирахувати на якому місці має стояти кожен елемент, а потім
    за один прохід поставити всі елементи на свої місця.
    <br>
    &emsp;&emsp;В алгоритмі присутні тільки прості цикли довжини N (довжина масиву), та один цикл довжини K (величина діапазону).
    Отже, обчислювальна складність роботиалгоритму становить O(N + K). В алгоритмі використовується додатковий масив.
    Тому алгоритм потребує E(K) додаткової пам’яті. В такій реалізації алгоритм є стабільним. Саме ця його властивість дозволяє
    використовувати його як частину інших алгоритмів сортування (наприклад, сортування за розрядами). Використання даного алгоритму
    є доцільним тільки у випадку малих K.<br>
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
            <td>O(n + k)</td>
        </tr>
        <tr>
            <td>Найгірший</td>
            <td>O(n + k)</td>
        </tr>
        </tbody>
    </table>

    <br>
    &emsp;&emsp;Реалізація алгоритму мовою Java:<br>
    <pre>
    private Integer[] counting(Integer[] array, int max) {
        int[] numCounts = new int[max + 1];
        for (int num : array) {
            numCounts[num]++;
        }

        Integer[] sortedArray = new Integer[array.length];
        int currentSortedIndex = 0;

        for (int n = 0; n < numCounts.length; n++) {
            int count = numCounts[n];

            for (int k = 0; k < count; k++) {
                sortedArray[currentSortedIndex] = n;
                currentSortedIndex++;
            }
        }
        return sortedArray;
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
        background: #BAC6E8;
        color: black;
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
