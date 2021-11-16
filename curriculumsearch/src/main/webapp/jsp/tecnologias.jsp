<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"><link href="../css/cargoStyle.css" rel="stylesheet" type="text/css"/></layout:put>
    <layout:put block="contents" type="REPLACE">
        <h2>Lista de Tecnologias</h2>

        <div>
            <form>
                <label for="tecnologias">Nombre:</label>
                <input type="text" name="nombre" id="nombre" value="${param.nombre}"/>
                <input type="submit" value="Buscar">
            </form>
            <a href="/tecnologia">Agregar Nueva Tecnologia</a>
        </div>
        <div>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tecnologia</th>
                  </tr>
                </thead>
                <tbody>
                  
                    <c:forEach items="${tecnologias}" var="tecnologia" varStatus="sta">
                        <tr>
                            <th scope="row">${sta.index+1}</th>
                            <td>${tecnologia.getNombre()}</td>
                           
                            <td><a href="/tecnologia/${tecnologia.id}">Editar tecnologia</a></td>
                        </tr>
                    </c:forEach>
                    
                  
                 
                </tbody>
              </table>
        </div>
    </layout:put>
</layout:extends>
