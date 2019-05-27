<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: koill
  Date: 18.05.2019
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Дослідження алгоритмів сортування</title>
</head>

<body>
    <h3>Для отримання результатів оберіть алгоритми:</h3>

    <form name="checkboxes" method="get" action="${pageContext.request.contextPath}/api/execute-sorting">
        <fieldset id="choose">
            <legend><input type="checkbox"> Вибрати всі</legend>
            <input type="checkbox" name="Sorting" value="Bubble">
                <a href="${pageContext.request.contextPath}/api/bubble-sorting" title="Переглянути опис алгоритму">Методом "Бульбашки"</a><br>
            <input type="checkbox" name="Sorting" value="Selection">
                <a href="${pageContext.request.contextPath}/api/counting-sorting" title="Переглянути опис алгоритму">Методом підрахунку</a><br>
            <input type="checkbox" name="Sorting" value="Insertion">
                <a href="${pageContext.request.contextPath}/api/insertion-sorting" title="Переглянути опис алгоритму">Методом вставки</a><br>
            <input type="checkbox" name="Sorting" value="Merge">
                <a href="${pageContext.request.contextPath}/api/merge-sorting" title="Переглянути опис алгоритму">Методом злиття</a><br>
            <input type="checkbox" name="Sorting" value="Quick">
                <a href="${pageContext.request.contextPath}/api/quick-sorting" title="Переглянути опис алгоритму">Методом швидкого сортування</a><br>
            <input type="checkbox" name="Sorting" value="Selection">
                <a href="${pageContext.request.contextPath}/api/selection-sorting" title="Переглянути опис алгоритму">Методом вибору</a><br>
            <input type="checkbox" name="Sorting" value="Shell">
                <a href="${pageContext.request.contextPath}/api/shell-sorting" title="Переглянути опис алгоритму">Методом Шелла</a><br>
            <input type="checkbox" name="Sorting" value="Shuttle">
                <a href="${pageContext.request.contextPath}/api/shuttle-sorting" title="Переглянути опис алгоритму">Методом "човникового" сортування</a><br>
        </fieldset>
        <br>

        <input type="submit" name="select" class="b1" value="Сортувати" onclick="if(checkboxCheck(checkboxes.Sorting)); openPage('${pageContext.request.contextPath}/execute-sorting')"/>
    </form>
    <form name="back" action="${pageContext.request.contextPath}/api/main">
        <input type="submit" class="b1" value="На головну" onclick="openPage('${pageContext.request.contextPath}/main')"/>
    </form>

<script>
    function checkboxCheck(checkboxs)
    {
        for(var i=0; i<checkboxs.length; i++) {
            if (checkboxs[i].checked) {
                return true;
            }
        }
        alert("Оберіть принаймні один алгоритм");
        return false;
    }
</script>

<script type="text/javascript">
    function openPage(pageURL)
    {
        window.location.href = pageURL;
    }
</script>

<script>
    var main = document.querySelector('#choose legend [type="checkbox"]'),
        all = document.querySelectorAll('#choose > [type="checkbox"]');

    for(var i=0; i<all.length; i++) {  // 1 и 2 пункт задачи
        all[i].onclick = function() {
            var allChecked = document.querySelectorAll('#choose > [type="checkbox"]:checked').length;
            main.checked = allChecked == all.length;
            main.indeterminate = allChecked > 0 && allChecked < all.length;
        }
    }

    main.onclick = function() {
        for(var i=0; i<all.length; i++) {
            all[i].checked = this.checked;
        }
    }
</script>

    <style>
        body {
            background: #BAE8E7;
        }
    </style>

    <style>
        .b1 {
            background: #BAC6E8;
            color: black;
        }
    </style>
</body>
</html>
