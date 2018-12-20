<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: vsnorberto
  Date: 17/12/2018
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
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
    <body>
    <h1 align="center">Sistema de Ponto - Sefaz</h1>
      <form action="login" method="post" name="formlogin">
        <p align="center"></p>
        <table align="center" cellspacing="20">
          <tr><td>Usuário:</td><td><input type="text" name="loginusuario"/></td></tr>
          <tr><td>Senha:</td><td><input type="password" name="senhausuario"/></td></tr>
          <tr><td colspan="2" align="center"><input  type="submit" value="Entrar" onclick="alerta()"/></td></tr>
        </table>



      </form>
    </body>
</html>
