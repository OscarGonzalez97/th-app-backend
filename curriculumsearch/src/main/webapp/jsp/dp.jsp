<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<layout:extends name="layouts/base.jsp">
    <layout:put block="contents" type="REPLACE">
        <h2 style="text-align: center;">
            DETALLE POSTULANTE        
        </h2>
        ${postulante.nombre} ${postulante.apellido}        
    </layout:put>
</layout:extends>

