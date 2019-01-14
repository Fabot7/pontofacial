<%@ page import="java.util.ArrayList" %>
<%@ page import="br.com.banco.Banco" %><%--
  Created by IntelliJ IDEA.
  User: vsnorberto
  Date: 17/12/2018
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page info="Pagina criada para Sefaz" %>
<html>
  <img>
      <%--link de referencia ao boostrap--%>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <%-- fazendo referencia ao css --%>
    <link rel="stylesheet" href="Style.css">
          <%-- script para exibição em internet explorer --%>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
    <title>SistemadePonto-Sefaz</title>
    <%-- um javascript que mostra um alerta quando os campos estão vazios --%>
    <script type="text/javascript">
        function alerta() {
            if (document.formlogin.loginusuario.value==""){
                alert("Usuario não informado");
                return false;
            }
            if(document.formlogin.senhausuario.value==""){
                alert("senha não informada");
                return false;
            }
            document.formlogin.submit();
        }
    </script>

</head>
    <body class="text-center" >

    <form class="form-signin" action="login" method="post" name="formlogin" id="teste">

        <img class="mb-4" src="recursos/img/Logo.png" alt="" width="300" height="300"/>


        <h1 class="h3 mb-3 font-weight-normal">Sistema de Ponto - Sefaz</h1>

        <label for="loginusuario" class="sr-only"></label>
        <input type="text" name="loginusuario" id="loginusuario" class="form-control" placeholder="Usuario" required autofocus>

        <label for="senhausuario" class="sr-only"></label>
        <input type="password" name="senhausuario" id="senhausuario" class="form-control" placeholder="senha" required>

        <button class="btn btn-lg btn-primary btn-block" onclick="alerta()" type="submit">Entrar</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>
    </form>

    <%--
    <h1 align="center">Sistema de Ponto - Sefaz</h1>
      <form action="login" method="post" name="formlogin">
        <p align="center"></p>
        <table align="center" cellspacing="20">
          <tr><td>Usuário:</td><td><input type="text" name="loginusuario"/></td></tr>
          <tr><td>Senha:</td><td><input type="password" name="senhausuario"/></td></tr>
          <tr><td colspan="2" align="center"><input  type="submit" value="Entrar" onclick="alerta() "class="rounded-circle"/></td></tr>
        </table>
      </form>
      --%>

    </body>
</html>
