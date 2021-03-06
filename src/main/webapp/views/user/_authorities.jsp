<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<button id="authorities_create" type="button" class="btn btn-primary" data-toggle="modal" data-target="#authorities_modal"><spring:message code="create.link.label"/>&NonBreakingSpace;<spring:message code="authorities" text="AUTHORITIES"/></button>

<c:if test="${not empty user.authorities}">
    <div id="div_authorities" style="margin: auto; overflow-x: scroll; padding-top: 10px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
            <thead style="color: white; background-color: #4A89DC; text-align: center">
                <tr>
                    <th></th>
                    <th></th>
                    <th><spring:message code="code" text="code"/></th>
                    <th><spring:message code="name" text="name"/></th>
                    <th><spring:message code="desc" text="desc"/></th>
                    <th><spring:message code="auditor" text="auditor"/></th>
                    <th><spring:message code="client" text="client"/></th>
                    <th><spring:message code="id" text="id"/></th>

                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${user.authorities}" var="authorities" varStatus="loopStatus">
                    <tr class="${loopStatus.index % 2 == 0 ? 'odd' : 'even'}">
                        <td><c:out value="${loopStatus.index}"/></td>
                        <td><button id="${user.id}~${loopStatus.index}" type="button" class="btn btn-info" value="${user.id}~${loopStatus.index}" data-toggle="modal" data-target="#authorities_modal" class="btn btn-primary"><spring:message code="edit.link.label" text="Edit"/></button></td>
                        <td><c:out value="${authorities.code}"/></td>
                        <td><c:out value="${authorities.name}"/></td>
                        <td><c:out value="${authorities.desc}"/></td>
                        <td><c:out value="${authorities.auditor}"/></td>
                        <td><c:out value="${authorities.client}"/></td>
                        <td><c:out value="${authorities.id}"/></td>

                        <td><button type="button" class="authorities_del btn btn-warning" value="authorities~${user.id}~${loopStatus.index}"><spring:message code='erase.button.label' text='Erase'/></button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="authorities_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">

                <form:form action="${pageContext.request.contextPath}/user/authorities/edit" commandName="authorities" method="POST" class="form-horizontal">

                    <!--modal-header-->                
                    <div class="modal-header" style="background-color: #5D9CEC">
                        <div class="form-group">
                            <h4 class="modal-title col-md-6" style="float: left">
                                <spring:message code="authorities" text="AUTHORITIES"/>
                            </h4>
                            <button type="button" class="close col-md-6" data-dismiss="modal" style="float: right; text-align: right; color: red">&times;</button>
                        </div>
                    </div>

                    <!--modal-body-->
                    <div class="modal-body">

                        <input type="hidden" name="userId" id="userId" value="${user.id}" >
                        <input type="hidden" name="embdId" id="authorities_id" value="" >
                        <div class="col-xs-6">
                            <spring:message code="code" text="code"/>
                            <input type="text" name="code" id="authorities_code" class="form-control" value="" >
                        </div>
                        <div class="col-xs-6">
                            <spring:message code="name" text="name"/>
                            <input type="text" name="name" id="authorities_name" class="form-control" value="" >
                        </div>
                        <div class="col-xs-6">
                            <spring:message code="desc" text="desc"/>
                            <input type="text" name="desc" id="authorities_desc" class="form-control" value="" >
                        </div>
                        <div class="col-xs-6">
                            <spring:message code="auditor" text="auditor"/>
                            <input type="text" name="auditor" id="authorities_auditor" class="form-control" value="" >
                        </div>
                        <div class="col-xs-6">
                            <spring:message code="client" text="client"/>
                            <input type="text" name="client" id="authorities_client" class="form-control" value="" >
                        </div>
                        <div class="col-xs-6">
                            <spring:message code="id" text="id"/>
                            <input type="text" name="id" id="authorities_id" class="form-control" value="" >
                        </div>

                        <div style="padding-left: 15px" class="form-group"></div>
                    </div>

                    <!--modal-footer-->
                    <div class="modal-footer" style="background-color: #4FC1E9">
                        <input type="submit" class="btn btn-primary" value="<spring:message code="create.page.submit.label" text="Save"/>"/>
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>    
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>
<!--========================================================================================================================================-->
<style>
    .modal {
        border: 1px solid #999999;
        border: 1px solid rgba(0, 0, 0, 0.2);
        border-radius: 6px;
        -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
        box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
        background-clip: padding-box;
    }
</style>
<!-------------------------------------------------------------------------------------------------------------------------------------------->
<script type="text/javascript">
    $(document).ready(function () {
        //    $(".not_show").hide();
    });

    $(document).on("click", "tr", function () {
        $("#authorities_id").val($("td:eq(0)", this).text());
        $("#authorities_code").val($("td:eq(2)", this).text());
        $("#authorities_name").val($("td:eq(3)", this).text());
        $("#authorities_desc").val($("td:eq(4)", this).text());
        $("#authorities_auditor").val($("td:eq(5)", this).text());
        $("#authorities_client").val($("td:eq(6)", this).text());
        $("#authorities_id").val($("td:eq(7)", this).text());

    });

    $(document).on("click", "#authorities_create", function () {
        $("#authorities_id").val("");
        $("#authorities_code").val("");
        $("#authorities_name").val("");
        $("#authorities_desc").val("");
        $("#authorities_auditor").val("");
        $("#authorities_client").val("");
        $("#authorities_id").val("");

    });

    $(document).on("click", ".authorities_del", function () {
        var contextPath = "<%=request.getContextPath()%>";
        var action = "/user/det/del/";
        var data = $(this).val();

        $.ajax({
            url: contextPath + action + data,
            type: "GET",
            data: "",
            async: false,
            success: function (response) {
                $("#div_authorities").load(location.href + " #div_authorities>*", "");
                //                alert("Data deleted successfully!");
                setTimeout(function () {
                    alert("Data deleted successfully!");
                }, 200);
            },
            error: function (exception) {
                alert(
                        "Sorry, an error occurred! Please try again later\n" +
                        "(authorities/Erase)"
                        );
            }
        });
    });
</script>
<!--========================================================================================================================================-->