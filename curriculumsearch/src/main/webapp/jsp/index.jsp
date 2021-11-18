<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="REPLACE">
        <link href="../css/indexStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="../img/LogoRoshka.ico">
    </layout:put>
    
</layout:extends>