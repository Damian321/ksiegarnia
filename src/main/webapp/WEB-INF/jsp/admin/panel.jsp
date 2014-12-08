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
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="../home.htm">Strona główna</a>
                        </div>
                        <ul class="nav navbar-nav navbar-left">
                            <li>
                                <a href="../category.htm">Książki</a>
                            </li>
                        </ul>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control">
                                </div> <button type="submit" class="btn btn-default">Wyszukaj</button>
                            </form>
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
                                            <a href="javascript:formSubmit()"> Wyloguj</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href=""></a>
                                </li>
                            </ul>
                        </div>

                    </nav>

                    <h3>
                        Panel administratora
                    </h3>
                    <br>
                    <div class="tabbable" id="tabs-635136">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#panel-791964" data-toggle="tab">Książki</a>
                            </li>
                            <li>
                                <a href="#panel-692676" data-toggle="tab">Pracownicy</a>
                            </li>
                            <li>
                                <a href="#panel-692671" data-toggle="tab">Użytkownicy</a>
                            </li>
                            <li>
                                <a href="#panel-692670" data-toggle="tab">Wiadomości</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="panel-791964">

                                <table class="table">
                                    <thead>
                                        <tr>
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
                                            <th>

                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="ksiazka" items="${lista_ksiazek}">                           
                                            <tr>
                                                <td>
                                                    <a href="../book.htm?id=${ksiazka.id}">${ksiazka.tytul}</a>
                                                </td>
                                                <td>
                                                    ${ksiazka.autor}
                                                </td>
                                                <td>
                                                    ${ksiazka.cena}
                                                </td>
                                                <td>
                                                    ${ksiazka.ISBN}
                                                </td>
                                                <td>
                                                    <a href="#">edycja</a>
                                                </td>
                                                <td>
                                                    <a href="#">usuń</a>
                                                </td>
                                            </tr>
                                        </c:forEach>                          
                                    </tbody>
                                </table>

                            </div>
                            <div class="tab-pane" id="panel-692676">
                                <table class="table">
                                    <thead>
                                        <tr>                                         
                                            <th>
                                                Login
                                            </th>
                                            <th>
                                                Hasło
                                            </th>
                                            <th>
                                                Aktywność konta
                                            </th>
                                            <th>

                                            </th>
                                            <th>

                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="pracownik" items="${lista_pracownikow}">                           
                                            <tr>
                                                <td>
                                                    ${pracownik.username}
                                                </td>
                                                <td>
                                                    ${pracownik.password}
                                                </td>
                                                <td>
                                                    <div class="checkbox">
                                                        <input type="checkbox" disabled="disabled"<c:if test="${user.enabled==true}"> checked </c:if>/> 
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <a href="#">usuń</a>
                                                    </td>
                                                    <td>
                                                        <a href="#">edycja</a>
                                                    </td>
                                                </tr>
                                        </c:forEach>                          
                                    </tbody>
                                </table>
                                <a href="#">Dodaj pracownika</a>
                            </div>
                            <div class="tab-pane" id="panel-692671">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>
                                                Login
                                            </th>
                                            <th>
                                                Hasło
                                            </th>
                                            <th>
                                                Aktywność konta
                                            </th>                                         
                                            <th>

                                            </th>
                                            <th>

                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${lista_uzytkownikow}">                           
                                            <tr>
                                                <td>
                                                    ${user.username}
                                                </td>
                                                <td>
                                                    ${user.password}
                                                </td>
                                                <td>
                                                    <div class="checkbox">
                                                        <input type="checkbox" disabled="disabled"<c:if test="${user.enabled==true}"> checked </c:if>/> 
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <a href="#">edycja</a>
                                                    </td>
                                                    <td>
                                                        <a href="#">usuń</a>
                                                    </td>
                                                </tr>
                                        </c:forEach>                          
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="panel-692670">
                                <p>
                                    Wiadomości
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
