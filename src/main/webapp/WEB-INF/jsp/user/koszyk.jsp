<%-- 
    Document   : home
    Created on : 2014-12-05, 12:21:52
    Author     : Damian
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="../config/css/bootstrap.min.css" rel="stylesheet">
        <link href="../config/css/style.css" rel="stylesheet">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../config/img/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../config/img/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../config/img/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../config/img/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="../config/img/favicon.png">

        <script type="text/javascript" src="../config/js/jquery.min.js"></script>
        <script type="text/javascript" src="../config/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../config/js/scripts.js"></script>

        <title>Home page:</title>

    </head>
    <body>
        <script>
            function formSubmit() {
                document.getElementById("logoutForm").submit();
            }
        </script>
        <c:url value="/j_spring_security_logout" var="logoutUrl" />

        <!-- csrt for log out-->
        <form action="${logoutUrl}" method="post" id="logoutForm">
            <input type="hidden" 
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form>

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1>
                            Księgarnia <small><span>Czytaj dużo albo wcale</span></small>
                        </h1>
                    </div>
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="home.htm">Strona główna</a>
                        </div>
                        <ul class="nav navbar-nav navbar-left">
                            <li>
                                <a href="category.htm">Książki</a>
                            </li>
                        </ul>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control">
                                </div> <button type="submit" class="btn btn-default">Wyszukaj</button>
                            </form>
                            <c:if test="${pageContext.request.userPrincipal.authorities == '[ROLE_USER]'}">
                                ${pageContext.request.userPrincipal.authorities}
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${pageContext.request.userPrincipal.name}<strong class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">Edycja konta</a>
                                            </li>
                                            <li>
                                                <a href="#">Another action</a>
                                            </li>
                                            <li>
                                                <a href="#">Something else here</a>
                                            </li>
                                            <li class="divider">
                                            </li>
                                            <li>
                                                <a href="#">Koszyk</a>
                                            </li>
                                            <li class="divider">
                                            </li>
                                            <li>
                                                <a href="javascript:formSubmit()"> Wyloguj</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href=""></a>
                                    </li>
                                </ul>
                            </c:if>
                        </div>

                    </nav>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    #
                                </th>
                                <th>
                                    Tytuł
                                </th>
                                <th>
                                    Autor
                                </th>
                                <th>
                                    Cena
                                </th>
                                <th>
                                   ISBN
                                </th>
                                <th>
                                    
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    01/04/2012
                                </td>
                                <td>
                                    Default
                                </td>
                                <td>
                                    <a href="#">44324234</a>
                                </td>
                                <td>
                                    <a href="#">usuń</a>
                                </td>
                            </tr>
                            <tr class="active">
                                <td>
                                    1
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    01/04/2012
                                </td>
                                <td>
                                    Approved
                                </td>
                            </tr>
                            <tr class="success">
                                <td>
                                    2
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    02/04/2012
                                </td>
                                <td>
                                    Declined
                                </td>
                            </tr>
                            <tr class="warning">
                                <td>
                                    3
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    03/04/2012
                                </td>
                                <td>
                                    Pending
                                </td>
                            </tr>
                            <tr class="danger">
                                <td>
                                    4
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    04/04/2012
                                </td>
                                <td>
                                    Call in to confirm
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
