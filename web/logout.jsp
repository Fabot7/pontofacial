<%--
  Created by IntelliJ IDEA.
  User: vsnorberto
  Date: 19/12/2018
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--link de referencia ao boostrap--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <title>ERROR</title>
</head>
<body>
    <% session.removeAttribute("autenticador");
    response.sendRedirect("login.jsp");
    %>
</body>
</html>
