<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<tiles:insertDefinition name="defaultTemplate"/>

<tiles:putAttribute name="header">
    <jsp:include page="/template/header.jsp"/>
</tiles:putAttribute>

<tiles:putAttribute name="menu">
    <%--<jsp:include page="/template/menu.jsp"/>--%>
</tiles:putAttribute>

<tiles:putAttribute name="body">

    <title><spring:message code="project.title.edit" text="Edit"/></title>

    <div>   
        <a href="${pageContext.request.contextPath}/"><spring:message code="home"/></a> |
        <a href="${pageContext.request.contextPath}/org/index"><spring:message code="list.link.label"/>&NonBreakingSpace;<spring:message code="org" text="Organization"/></a> |
        <a href="${pageContext.request.contextPath}/org/create"><spring:message code="create.link.label"/>&NonBreakingSpace;<spring:message code="org" text="Organization"/></a>
    </div>
    <h1><spring:message code="edit.page.title"/></h1>
    <div>
        <form:form action="${pageContext.request.contextPath}/org/edit/${org.id}" enctype="multipart/form-data" commandName="org" method="POST">
            <jsp:include page="_form.jsp"/>
            <div>
                <a href="${pageContext.request.contextPath}/org/show/<c:out value="${org.id}"/>"><spring:message code="show.link.label"/></a>
                <input type="submit" value="<spring:message code="edit.page.submit.label"/>"/>
            </div>
        </form:form>
    </div>
    <!--
    <div id="dialog" title="Basic dialog">
        <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
    </div>
    -->

</tiles:putAttribute>  

<tiles:putAttribute name="footer">
    <jsp:include page="/template/footer.jsp"/>
</tiles:putAttribute>  