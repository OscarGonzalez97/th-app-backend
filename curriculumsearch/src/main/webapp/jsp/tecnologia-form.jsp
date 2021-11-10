<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Hello, world!</title>

    
    <style type="text/css" media="screen">
          body {
                  background-color: rgba(98, 0, 255, 0)
              } </style>


</head>
<body>

    <form:form action="/tecnologia/${tecnologia.id == null ? '' : tecnologia.id}"  method="post" modelAttribute="tecnologia">
        <form:label path="nombre">name: </form:label> <form:input type="text" path="nombre"/>
        <input type="submit" value="submit"/>
    </form:form>





</body>



</html>