<%@ page contentType='text/html;charset=UTF-8' language='java' %>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='spring' uri='http://www.springframework.org/tags' %>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form' %>

<tiles:insertDefinition name='defaultTemplate' />

<tiles:putAttribute name='header'>
    <jsp:include page='/template/header.jsp' />
</tiles:putAttribute>

<tiles:putAttribute name='menu'>
    <%--<jsp:include page='/template/menu.jsp' />--%>
</tiles:putAttribute>

<tiles:putAttribute name='body'>
    <title><spring:message code='project.title.copy'/></title>
    <div>
        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
            <i class="glyphicon glyphicon-home"></i>
            <spring:message code="home"/>
        </a>
        <a href="${pageContext.request.contextPath}/personnelSubarea/index" class="btn btn-info">
            <i class="glyphicon glyphicon-list"></i>
            <spring:message code="list.link.label"/>&NonBreakingSpace;<spring:message code="personnelSubarea" text="PersonnelSubarea"/>
        </a>
        <a href="${pageContext.request.contextPath}/personnelSubarea/create" class="btn btn-primary">
            <i class="glyphicon glyphicon-plus"></i>
            <spring:message code="create.link.label"/>&NonBreakingSpace;<spring:message code="personnelSubarea" text="PersonnelSubarea"/>
        </a>
    </div>
    <h1><spring:message code='copy.page.title'/></h1>
    <div>
        <form:form action='${pageContext.request.contextPath}/personnelSubarea/copy/${personnelSubarea.id}' commandName='personnelSubarea' method='POST'>
            <form:hidden path='id'/>
            <jsp:include page='_form.jsp' />
            <div>
                <a href="${pageContext.request.contextPath}/personnelSubarea/show/${personnelSubarea.id}" class="btn btn-info">
                    <i class="glyphicon glyphicon-book"></i>
                    <spring:message code="show.link.label"/>
                </a>
                <input class='btn btn-primary' type='submit' value='<spring:message code='copy.page.submit.label'/>'/>
            </div>
        </form:form>
    </div>
</tiles:putAttribute>

<tiles:putAttribute name='footer'>
    <jsp:include page='/template/footer.jsp' />
</tiles:putAttribute>