<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <c:set var="valores" scope="session" value="${{1, 2, 3, 4, 5, 6}}"/>
</head>
<body>
<div class="container">
    <div class="row mt-3"><h2>Lenguajes</h2></div>
    <div class="row mt-3">
        <ul>
            <c:forEach items="${lista}" var="item">
                <li>${item.nombre}</li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
