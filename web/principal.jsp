
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

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
    <h4> Seja Bem Vindo: <%=nomeUsuario%> </h4>


    <div class="middle">
        <div class="menu">
            <li class="item" id='profile'>
                <a href="#profile" class="btn"><i class="far fa-user"></i>Perfil</a>
                <div class="smenu">
                    <a href="#">Trocar Senha</a>
                    <a href="#">Editar Perfil</a>
                </div>
            </li>

            <li class="item" id="messages">
                <a href="#messages" class="btn"><i class="fas fa-file-alt"></i>Relatórios</a>

                    <div class="smenu">
                        <a href="recursos/Relatorios/relatorioComp.jsp">Relatório Completo</a>
                    <a href="recursos/Relatorios/relatorioResumido.jsp">Relatório Resumido</a>
                    <a href="recursos/Relatorios/relatorioPersonalizado.jsp">Relatório Personalizado</a>
                </div>
            </li>

            <li class="item" id="settings">
                <a href="#settings" class="btn"><i class="fas fa-cog"></i>Configurações</a>
                <div class="smenu">
                    <a href="#">Tema</a>
                    <a href="#">Idioma</a>
                </div>
            </li>

            <li class="item">
                <a class="btn" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a>


            </li>
        </div>
    </div>




    </body>


    </header>
    </html>