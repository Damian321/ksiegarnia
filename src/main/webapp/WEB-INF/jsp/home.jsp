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

        <link href="config/css/bootstrap.min.css" rel="stylesheet">
        <link href="config/css/style.css" rel="stylesheet">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="config/img/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="config/img/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="config/img/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="config/img/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="config/img/favicon.png">

        <script type="text/javascript" src="config/js/jquery.min.js"></script>
        <script type="text/javascript" src="config/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="config/js/scripts.js"></script>

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
                            <c:choose>
                                <c:when test="${pageContext.request.userPrincipal.authorities == '[ROLE_USER]'}">
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
                                                    <a href="user/koszyk.htm">Koszyk</a>
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
                                </c:when>
                                <c:otherwise>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li>
                                            <a href="login.htm">Logowanie</a>
                                        </li>
                                        <li>
                                            <a href="#">Rejestracja</a>
                                        </li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </nav>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="thumbnail">
                                <img alt="300x200" src="http://lorempixel.com/600/200/people">
                                <div class="caption">
                                    <h3>
                                        Nowa powieść S. Kinga dostępna!
                                    </h3>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                    <p>
                                        <a class="btn btn-primary" href="#">Więcej</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumbnail">
                                <img alt="300x200" src="http://lorempixel.com/600/200/city">
                                <div class="caption">
                                    <h3>
                                        Super promocje tylko w tym tygodniu
                                    </h3>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                    <p>
                                        <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumbnail">
                                <img alt="300x200" src="http://lorempixel.com/600/200/sports">
                                <div class="caption">
                                    <h3>
                                        Wielki konkurs
                                    </h3>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                    <p>
                                        <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <h2>
                                    Heading
                                </h2>
                                <p>
                                    Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
                                </p>
                                <p>
                                    <a class="btn" href="#">View details »</a>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
