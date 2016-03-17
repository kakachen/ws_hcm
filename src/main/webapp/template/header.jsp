<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/functions' prefix='fn'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/fmt' prefix='fmt'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>
<%@ taglib uri='http://www.springframework.org/security/tags' prefix='sec'%>

<head>
    <meta name='viewport' content='initial-scale=1, maximum-scale=1' charset='utf-8'>
    <!--<meta name='viewport' content='width=device-width, initial-scale=1'>-->    

    <link rel='shortcut icon' type='image/x-icon' href='<%=request.getContextPath()%>/resources/images/favicon.ico'/>

    <%--<link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/css/bootstrap/bootstrap-3.3.6/bootstrap-datetimepicker.min.css'/> 
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/frameworks/bootstrap-3.3.6/css/bootstrap.min.css'/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/frameworks/font-awesome-4.5.0/css/font-awesome.min.css'/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/webjars/bootstrap/3.3.6/css/bootstrap-datetimepicker.min.css'>--%>

    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/webjars/bootstrap/3.3.6/css/bootstrap.min.css'>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/webjars/font-awesome/4.5.0/css/font-awesome.min.css'>

    <%--<link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/css/jquery/jquery-datatable-1.10.10/dataTables.bootstrap.min.css'/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/css/jquery/jquery-datatable-1.10.10/jquery.dataTables.min.css'/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/themes/jquery-ui-1.11.4/Base/jquery-ui.css'/>--%> 

    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/css/oith/oith-1.0.0.css'/> 
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/css/oith/oith-styles-1.0.0.css'/> 
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/resources/css/utility/animate-3.5.0.css'/> 

    <script>var contextPath = '<%=request.getContextPath()%>'</script>

    <!--<script src='<=request.getContextPath()%>/resources/frameworks/bootstrap-3.3.6/js/bootstrap.js'></script>-->
    <!--<script src='<=request.getContextPath()%>/resources/js/bootstrap/bootstrap-datepicker.js'></script>-->
    <!--<script src='<=request.getContextPath()%>/resources/js/jquery/jquery-1.11.3/jquery-min.js'></script>-->

    <%--<script src='<%=request.getContextPath()%>/resources/js/jquery/jquery-datatable-1.10.10/dataTables.bootstrap.js'></script>
    <script src='<%=request.getContextPath()%>/resources/js/jquery/jquery-datatable-1.10.10/dataTables.jqueryui.js'></script>
    <script src='<%=request.getContextPath()%>/resources/js/jquery/jquery-datatable-1.10.10/jquery.dataTables.js'></script>
    <script src='<%=request.getContextPath()%>/resources/themes/jquery-ui-1.11.4/Base/jquery-ui.js'></script>--%>

    <script src='<%=request.getContextPath()%>/webjars/bootstrap/3.3.6/js/bootstrap.min.js'></script>
    <script src='<%=request.getContextPath()%>/resources/js/oith/oith-1.0.0.js'></script>
    <script src='<%=request.getContextPath()%>/webjars/jquery/2.2.1/jquery.min.js'></script>

</head>

<body>   
    <div class='wrapper'>
        <nav class="navbar navbar-inverse">
            <!--<nav class="navbar navbar-inverse navbar-fixed-top">-->
            <div class='container-fluid'>

                <div class='navbar-header'>

                    <button type='button' class='navbar-toggle' data-toggle='collapse' data-target='#myNavbar'>
                        <span class='icon-bar'></span>
                        <span class='icon-bar'></span>
                        <span class='icon-bar'></span>                        
                    </button>

                    <sec:authorize access='isAuthenticated()'>
                        <a class="navbar-brand" href="<%=request.getContextPath()%>">
                            <sec:authentication var='logoPicFile' property='principal.logoPicFile'/>
                            <c:url var='macImage' value='/client/getPhoto/${logoPicFile}' />
                            <img class='logo' id='imagePreview' height='40px' width='120px' src='${macImage}' alt='${macImage}'/>
                        </a>
                    </sec:authorize>
                    <sec:authorize access='isAnonymous()'>
                        <a class="navbar-brand" href="<%=request.getContextPath()%>">
                            <img class='logo' id='imagePreview' height='40px' width='120px' src='<%=request.getContextPath()%>/resources/images/oith_logo.png' alt='oith_logo'/>
                        </a>
                    </sec:authorize>
                </div>
                <div class='collapse navbar-collapse' id='myNavbar'>

                    <sec:authorize access='isAuthenticated()'>
                        <sec:authentication var='menus' property='principal.menus'/>
                        ${menus}
                    </sec:authorize>
                
                    <sec:authorize access='isAnonymous()'>
                        <ul class='nav navbar-nav navbar-right'>
                            <li>
                                <a href='${pageContext.request.contextPath}/user/create'><span class='glyphicon glyphicon-user'></span>&nbsp;<spring:message code='make.new.user' text='Make new user'/></a>
                            </li>
                            <li>
                                <a href='${pageContext.request.contextPath}/login'><span class='glyphicon glyphicon-log-in'></span>&nbsp;<spring:message code='login' text='Login'/></a>
                            </li>
                        </ul>
                    </sec:authorize>

                    <sec:authorize access='isAuthenticated()'>
                        <ul class='nav navbar-nav navbar-right'>
                            <li> 
                                <a href='${pageContext.request.contextPath}/user/show'><sec:authentication property='principal.fullName'/></a>
                            </li>
                            <li>
                                <sec:authentication var='profileId' property='principal.profileId'/>
                                <c:choose >
                                    <c:when test='${profileId==null}'>
                                        <a href='${pageContext.request.contextPath}/profile/create'><spring:message code='create.profile' text='Create profile'/></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href='${pageContext.request.contextPath}/profile/show'><spring:message code='show.profile' text='Show profile'/></a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <form role="search" class="navbar-form navbar-left">
                                <div class="form-group">
                                    <input id='quickAccessUrl' name='quickAccessUrl' class='form-control' placeholder="GO" type='text' size='3' maxlength='3'/>


                                    <c:set var='OPEN_IN_NEW_PAGE' value='<%=oith.ws.dom.core.EnvField.OPEN_IN_NEW_PAGE%>'/>
                                    <sec:authentication var='envs' property='principal.envs'/>
                                    <c:set var='openInNewPageLoc' value='${envs.get(OPEN_IN_NEW_PAGE)}'/>
                                    <div class='checkbox'>
                                        <label>
                                            <input id='openInNewPage' name='openInNewPage' type='checkbox'  value=''><spring:message code='default.open.in.new.page' text='Open in New Page'/>
                                        </label>
                                    </div>
                                </div>
                            </form> 
                            <li>
                                <a href='${pageContext.request.contextPath}/logout' onclick='return confirm('Are you sure to logout?');' ><span class='glyphicon glyphicon-log-out'></span>&nbsp;<spring:message code='logout' text='Logout'/></a>
                            </li>
                        </ul>
                    </sec:authorize>
                </div>
            </div>
        </nav>
    </div>
    <div id='wrapper'>
        <div id='wrapper-container'>

            <div id='header'>

                <div id='flags' style='float: right'>
                    <a href='?lang='>
                        <img alt='en' title='English' src='<%=request.getContextPath()%>/resources/images/flags/united-kingdom_14x11.png'/>
                    </a>
                    <a href='?lang=bn_BD'>
                        <img alt='bn' title='Bangladesh' src='<%=request.getContextPath()%>/resources/images/flags/bangladesh_14x11.png'/>
                    </a>
                    <a href='?lang=it'>
                        <img alt='it' title='Italy' src='<%=request.getContextPath()%>/resources/images/flags/italy_14x11.png'/>
                    </a>
                    <a href='?lang=hi_IN'>
                        <img alt='hi' title='India' src='<%=request.getContextPath()%>/resources/images/flags/india_14x11.png'/>
                    </a>
                </div>
            </div>

            <script type='text/javascript'>
                jQuery(document).ready(function () {
                    //alert('mac test jsb ');
                    $('#openInNewPage').prop('checked',${openInNewPageLoc});
                });
                //        $(document).ready(function () {
                //            alert('mac test js ' + contextPath);
                //            $('#openInNewPage').prop('checked',${openInNewPageLoc});
                //            //$('#openInNewPage').prop('checked',{lang});
                //        });
                $(document).on('change', '#quickAccessx', function () {

                    var isNewWindow = $('#openInNewPage').prop('checked');
                    var quickAccessx = $('#quickAccessx').val();

                    if (isNewWindow === '' || isNewWindow === null) {
                        isNewWindow = '_self';
                    } else {
                        isNewWindow = '_blank';
                    }

                    if (quickAccessx !== null || quickAccessx !== '') {
                        var urlToGo = $(this).val();
                        window.open(urlToGo, isNewWindow);
                        $('#quickAccessx').prop('selectedIndex', 0);
                    }
                });
                $('#quickAccessUrl').on('keydown', function (event) {
                    if (event.which === 13) {

                        var isNewWindow = $('#openInNewPage').prop('checked');

                        if (isNewWindow === null || isNewWindow === '') {
                            isNewWindow = '_self';
                        } else {
                            isNewWindow = '_blank';
                        }
                        var urlCode = $(this).val();
                        if (urlCode.length === 3) {
                            //                            window.open('http://www.google.com', '_blank');
                            goToQuickAccessUrl(urlCode, isNewWindow);
                        }
                    }
                });
                function goToQuickAccessUrl(urlCode, isNewWindow) {

                    //window.open('http://www.google.com', isNewWindow);
                    //window.open(urlToGo, isNewWindow);

                    $.ajax({
                        url: contextPath + '/menu/' + urlCode,
                        type: 'GET',
                        data: '',
                        async: false,
                        success: function (response) {

                            window.open(contextPath + '/' + response, isNewWindow);
                            $('#quickAccessUrl').val('');
                        },
                        error: function (exception) {
                            alert('Sorry, An Internal Error Occurred...!\n(Error : header.jsp/goToQuickAccessUrl:ln=206)');
                        }
                    });
                }
            </script>