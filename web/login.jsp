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

  <img class="mb-4" src="recursos/img/Logo.png" alt="" width="300" height="230"/>

  <body class="text-center" >

    <form class="form-signin" action="login" method="post" name="formlogin" id="teste">

        <body class="bg-dark">

        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="text" name="loginusuario" id="loginusuario" class="form-control" placeholder="Usuario" required autofocus>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="password" name="senhausuario" id="senhausuario" class="form-control" placeholder="senha" required>
                                <label for="senhausuario">Password</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="remember-me">
                                    Remember Password
                                </label>
                            </div>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" onclick="alerta()" type="submit">Entrar</button>
                    </form>
                    <div class="text-center">
                        <a class="d-block small mt-3" href="#">Registrar-se</a>
                        <a class="d-block small" href="#">Esqueceu a Senha ?</a>
                    </div>
                </div>
            </div>
        </div>
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
