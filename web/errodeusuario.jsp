<%--
  Created by IntelliJ IDEA.
  User: vsnorberto
  Date: 18/12/2018
  Time: 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- pagina de direcionamento quando um erro no login acontece --%>
<html>
<head>
    <%--link de referencia ao boostrap--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <%-- link de referencia ao css --%>
    <link rel="stylesheet" href="Style.css">

    <title>ERRO</title>
</head>
<body>
    <div align="center">
        <h2>Erro ao logar, usuario ou senha incorretos!</h2>
        <a href="login.jsp">Tentar Novamente</a>
    </div>
</body>
</html>
