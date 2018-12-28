
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



        <section>
            <article>
                <h1 align="center">Usuário Logado Com Sucesso</h1>
                <p align="center">Sistema de ponto para escola fazendaria</p>
                <h3 align="center">LOGADO</h3>

                <%-- formulário para pesquisa por mes e setor --%>
                <h3 align="center">PESQUISA POR MÊS E SETOR </h3>
                <form align="center">
                    <fieldset>
                        <%-- select de mês --%>
                        <select name="mes">
                            <option value="1">Janeiro
                            <option value="2">Fevereiro
                            <option value="3">Março
                            <option value="4">Abril
                            <option value="5">Maio
                            <option value="6">Junho
                            <option value="7">Julho
                            <option value="8">Agosto
                            <option value="9">Setembro
                            <option value="10">Outubro
                            <option value="11">Novembro
                            <option value="12">Dezembro
                        </select>
                            <%-- select de mês --%>
                        <select name="setor">
                            <option value="13">RH
                            <option value="14">ADM
                            <option value="15">EAD
                            <option value="16">RECEPÇÃO
                            <option value="17">SEGURANÇA
                            <option value="18">ALIMENTAÇÃO
                        </select>
                        <button>Buscar</button>
                    </fieldset>
                </form>


            </article>
        </section>
    </body>
</html>
