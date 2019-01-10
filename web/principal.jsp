
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: vsnorberto
  Date: 17/12/2018
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<html>
    <head>
        <%@ page import="java.rmi.ServerException" %>
        <%--link de referencia ao boostrap--%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <%-- fazendo referencia ao css --%>

        <link rel="stylesheet" href="Style.css">
        <%-- script para exibição em internet explorer --%>

        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <![endif]-->

        <title>Tela-Principal</title>

    </head>

    <body id="principal" >

    <%-- scriptlet que serve para realizar a autenticação do usuario na hora do login --%>
        <% String nomeUsuario = (String) session.getAttribute("autenticador");
            if (nomeUsuario == null) {
                throw new ServerException("Nenhum usuario logado");
            }
        %>
        Seja Bem Vindo: <%=nomeUsuario%> | <a href="logout.jsp">Exit</a>



    <div class="container-fluid">
        <div class="row content">
            <div class="col-sm-3 sidenav">
                <h4>John's Blog</h4>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="#section1">Home</a></li>
                    <li><a href="#section2">Friends</a></li>
                    <li><a href="#section3">Family</a></li>
                    <li><a href="#section3">Photos</a></li>
                </ul><br>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search Blog..">
                    <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
                </div>
            </div>

            <div class="col-sm-9">
                <h4><small>RECENT POSTS</small></h4>
                <hr>
                <h2>I Love Food</h2>
                <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
                <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
                <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br><br>

                <h4><small>RECENT POSTS</small></h4>
                <hr>
                <h2>Officially Blogging</h2>
                <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
                <h5><span class="label label-success">Lorem</span></h5><br>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <hr>

                <h4>Leave a Comment:</h4>
                <form role="form">
                    <div class="form-group">
                        <textarea class="form-control" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Submit</button>
                </form>
                <br><br>

                <p><span class="badge">2</span> Comments:</p><br>

                <div class="row">
                    <div class="col-sm-2 text-center">
                        <img src="bandmember.jpg" class="img-circle" height="65" width="65" alt="Avatar">
                    </div>
                    <div class="col-sm-10">
                        <h4>Anja <small>Sep 29, 2015, 9:12 PM</small></h4>
                        <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <br>
                    </div>
                    <div class="col-sm-2 text-center">
                        <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
                    </div>
                    <div class="col-sm-10">
                        <h4>John Row <small>Sep 25, 2015, 8:25 PM</small></h4>
                        <p>I am so happy for you man! Finally. I am looking forward to read about your trendy life. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <br>
                        <p><span class="badge">1</span> Comment:</p><br>
                        <div class="row">
                            <div class="col-sm-2 text-center">
                                <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
                            </div>
                            <div class="col-xs-10">
                                <h4>Nested Bro <small>Sep 25, 2015, 8:28 PM</small></h4>
                                <p>Me too! WOW!</p>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="container-fluid">
        <p>Footer Text</p>
    </footer>

    </body>
    </body>
</html>
