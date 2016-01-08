<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="defaultTemplate" />

<tiles:putAttribute name="header">
    <jsp:include page="/template/header.jsp" />
</tiles:putAttribute>

<tiles:putAttribute name="menu">
    <%--<jsp:include page="/template/menu.jsp" />--%>
</tiles:putAttribute>

<tiles:putAttribute name="body">

    <title><spring:message code="project.title.show" text="Show"/></title>

    <div>   
        <a href="${pageContext.request.contextPath}/"><spring:message code="home"/></a> |
        <a href="${pageContext.request.contextPath}/report/index"><spring:message code="list.link.label"/>&NonBreakingSpace;<spring:message code="report" text="Report"/></a> |
        <a href="${pageContext.request.contextPath}/report/create"><spring:message code="create.link.label"/>&NonBreakingSpace;<spring:message code="report" text="Report"/></a>
    </div>

    <h1><spring:message code="show.page.title"/></h1>
    <div>
        <%--<form:hidden path="id"/>--%>
        <dl class="dl-horizontal">

            <c:if test="${report.code!=null}">
                <dt><spring:message code="code" text="Code"/></dt>
                <dd>
                    <c:out value="${report.code}"/>
                </dd>
            </c:if>

            <c:if test="${report.reportGroup!=null}">
                <dt><spring:message code="reportGroup" text="Report Group"/></dt>
                <dd>
                    <c:out value="${report.reportGroup}"/>
                </dd>
            </c:if>

            <c:if test="${report.title!=null}">
                <dt><spring:message code="title" text="Title"/></dt>
                <dd>
                    <c:out value="${report.title}"/>
                </dd>
            </c:if>

            <c:if test="${report.fileName!=null}">
                <dt><spring:message code="fileName" text="File Name"/></dt>
                <dd>
                    <c:out value="${report.fileName}"/>
                </dd>
            </c:if>

            <c:if test="${report.isActive!=null}">
                <dt><spring:message code="isActive" text="Is Active"/></dt>
                <dd>
                    <c:out value="${report.isActive}"/>
                </dd>
            </c:if>

            <c:if test="${report.slNo!=null}">
                <dt><spring:message code="slNo" text="Sl No"/></dt>
                <dd>
                    <c:out value="${report.slNo}"/>
                </dd>
            </c:if>

            <c:if test="${report.remarks!=null}">
                <dt><spring:message code="remarks" text="Remarks"/></dt>
                <dd>
                    <c:out value="${report.remarks}"/>
                </dd>
            </c:if>

            <c:set target="audit" property="audit" var="audit" value="${report}" scope="request"/>
            <jsp:include page="../_auditShow.jsp" flush="true" />
        </dl>
        <!--<div><jspinclude page="_supportFormats.jsp"/></div>-->
        <div><jsp:include page="_reportDetails.jsp"/></div>

    </div>

    <a href="${pageContext.request.contextPath}/report/edit/<c:out value="${report.id}"/>"><spring:message code="edit.link.label"/></a> |
    <a href="${pageContext.request.contextPath}/report/copy/<c:out value="${report.id}"/>"><spring:message code="copy.link.label"/></a> |
    <a href="${pageContext.request.contextPath}/report/delete/<c:out value="${report.id}"/>" onclick="return confirm('Are you sure to delete?');" ><spring:message code="delete.link.label"/></a>

</tiles:putAttribute>  

<tiles:putAttribute name="footer">
    <jsp:include page="/template/footer.jsp" />
</tiles:putAttribute>    