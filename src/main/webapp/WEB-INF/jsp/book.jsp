<%-- 
    Document   : home
    Created on : 2014-12-05, 12:21:52
    Author     : Damian
--%>

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

        <title>Home page</title>

    </head>
    <body>
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

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">Action</a>
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
                                            <a href="#">Separated link</a>
                                        </li>
                                        <li class="divider">
                                        </li>
                                        <li>
                                            <a href="#">One more separated link</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control">
                                </div> <button type="submit" class="btn btn-default">Wyszukaj</button>
                            </form>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#">Logowanie</a>
                                </li>
                                <li>
                                    <a href="#">Rejestracja</a>
                                </li>
                            </ul>
                        </div>

                    </nav>
                    <div class="container">
                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <ul class="breadcrumb">
                                    <li>
                                        <a href="#">Home</a> <span class="divider">/</span>
                                    </li>
                                    <li>
                                        <a href="#">Library</a> <span class="divider">/</span>
                                    </li>
                                    <li class="active">
                                        Data
                                    </li>
                                </ul>
                                <div class="row clearfix">
                                    <div class="col-md-2 column">
                                        <img alt="140x140" src="http://lorempixel.com/140/140/" class="img-thumbnail" />
                                    </div>
                                    <div class="col-md-8 column">
                                        <dl class="dl-horizontal">
                                            <dt>
                                            Tytuł
                                            </dt>
                                            <dd>
                                               Opowieśći z Narni
                                            </dd>
                                            <dt>
                                            Autor
                                            </dt>
                                            <dd>
                                                Alfred Nowak
                                            </dd>
                                            <dd>
                                                <br>
                                            </dd>
                                            <dt>
                                            Malesuada porta
                                            </dt>
                                            <dd>
                                                Etiam porta sem malesuada magna mollis euismod.
                                            </dd>
                                            <dt>
                                            Felis euismod semper eget lacinia
                                            </dt>
                                            <dd>
                                                Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="col-md-2 column">

                                        <button type="button" class="btn btn-primary">Rezerwacja</button> 
                                        <h1> </h1>
                                        <button type="button" class="btn btn-primary">Sprawdź dostępność</button>
                                    </div>
                                </div>
                                <br>
                                <blockquote>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
                                    </p> <small>Someone famous <cite>Source Title</cite></small>
                                </blockquote>
                                <br>
                                <p>
                                    Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
