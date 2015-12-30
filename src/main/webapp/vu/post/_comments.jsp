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

<button id="comments_create" type="button" class="btn btn-primary" data-toggle="modal" data-target="#comments_modal"><spring:message code="create.link.label"/>&NonBreakingSpace;<spring:message code="comments" text="COMMENTS"/></button>

<c:if test="${not empty post.comments}">
    <div id="div_comments" style="margin: auto; overflow-x: scroll; padding-top: 10px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
            <thead style="color: white; background-color: #4A89DC; text-align: center">
                <tr>
                    <th></th>
                    <th></th>
                    <th><spring:message code="content" text="content"/></th>
                    <th><spring:message code="auditor" text="auditor"/></th>
                    <th><spring:message code="id" text="id"/></th>

                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${post.comments}" var="comments" varStatus="loopStatus">
                    <tr class="${loopStatus.index % 2 == 0 ? 'odd' : 'even'}">
                        <td><c:out value="${loopStatus.index}"/></td>
                        <td><button id="${post.id}~${loopStatus.index}" type="button" class="btn btn-info" value="${post.id}~${loopStatus.index}" data-toggle="modal" data-target="#comments_modal" class="btn btn-primary"><spring:message code="edit.link.label" text="Edit"/></button></td>
                        <td><c:out value="${comments.content}"/></td>
                        <td><c:out value="${comments.auditor}"/></td>
                        <td><c:out value="${comments.id}"/></td>

                        <td><button type="button" class="comments_del btn btn-warning" value="comments~${post.id}~${loopStatus.index}">Erase</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="comments_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">

                <form:form action="${pageContext.request.contextPath}/post/comments/edit" commandName="comments" method="POST" class="form-horizontal">

                    <!--modal-header-->                
                    <div class="modal-header" style="background-color: #5D9CEC">
                        <div class="form-group">
                            <h4 class="modal-title col-md-6" style="float: left">
                                <spring:message code="comments" text="COMMENTS"/>
                            </h4>
                            <button type="button" class="close col-md-6" data-dismiss="modal" style="float: right; text-align: right; color: red">&times;</button>
                        </div>
                    </div>

                    <!--modal-body-->
                    <div class="modal-body">

                        <input type="hidden" name="postId" id="postId" value="${post.id}" >
                        <input type="hidden" name="embdId" id="comments_id" value="" >
                        <div class="col-xs-6">
                            <spring:message code="content" text="content"/>
                            <input type="text" name="content" id="comments_content" class="form-control" value="" >
                        </div>
                        <div class="col-xs-6">
                            <spring:message code="auditor" text="auditor"/>
                            <input type="text" name="auditor" id="comments_auditor" class="form-control" value="" >
                        </div>
                        <div class="col-xs-6">
                            <spring:message code="id" text="id"/>
                            <input type="text" name="id" id="comments_id" class="form-control" value="" >
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
        $("#comments_id").val($("td:eq(0)", this).text());
        $("#comments_content").val($("td:eq(2)", this).text());
        $("#comments_auditor").val($("td:eq(3)", this).text());
        $("#comments_id").val($("td:eq(4)", this).text());

    });

    $(document).on("click", "#comments_create", function () {
        $("#comments_id").val("");
        $("#comments_content").val("");
        $("#comments_auditor").val("");
        $("#comments_id").val("");

    });

    $(document).on("click", ".comments_del", function () {
        var contextPath = "<%=request.getContextPath()%>";
        var action = "/post/det/del/";
        var data = $(this).val();

        $.ajax({
            url: contextPath + action + data,
            type: "GET",
            data: "",
            async: false,
            success: function (response) {
                $("#div_comments").load(location.href + " #div_comments>*", "");
                //                alert("Data deleted successfully!");
                setTimeout(function () {
                    alert("Data deleted successfully!");
                }, 200);
            },
            error: function (exception) {
                alert(
                        "Sorry, an error occurred! Please try again later\n" +
                        "(comments/Erase)"
                        );
            }
        });
    });
</script>
<!--========================================================================================================================================-->