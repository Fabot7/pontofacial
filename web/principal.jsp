<%@ page import="java.rmi.ServerException" %><%--
  Created by IntelliJ IDEA.
  User: vsnorberto
  Date: 17/12/2018
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>

        <link rel="stylesheet" href="Style.css">

        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <![endif]-->

        <title>Tela-Principal</title>

    </head>

    <body>
        <% String nomeUsuario = (String) session.getAttribute("autenticador");
            if (nomeUsuario == null) {
                throw new ServerException("Nenhum usuario logado");
            }
        %>
        Seja Bem Vindo: <%=nomeUsuario%> | <a href="logout.jsp">Exit</a>

        <section>
            <article>
                <h1 align="center">Usuário Logado Com Sucesso</h1>
                <p align="center">Sistema de ponto para escola fazendaria</p>
                <h3 align="center">LOGADO</h3>
            </article>
        </section>
    </body>
</html>
