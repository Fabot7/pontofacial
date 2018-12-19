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
    <title>ERROR</title>
</head>
<body>
    <% session.removeAttribute("autenticador");
    response.sendRedirect("login.jsp");
    %>
</body>
</html>
