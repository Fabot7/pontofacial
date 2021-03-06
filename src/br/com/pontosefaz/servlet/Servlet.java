package br.com.pontosefaz.servlet;

import br.com.pontosefaz.exception.InvalidUser;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "login", urlPatterns = "/login")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        validar(req);
        //Direciona para uma pagina ("Principal").
        RequestDispatcher rd = req.getRequestDispatcher("principal.jsp");
        rd.forward(req, resp);
    }

    private void validar(HttpServletRequest req )throws ServletException {
        String nomeUsuario = req.getParameter("loginusuario");
        String senhaUsuario = req.getParameter("senhausuario");

        if(!nomeUsuario.equals("admin") || !senhaUsuario.equals("admin")){
            throw new InvalidUser("Login ou Senha Invalidos");
        }

        HttpSession session = req.getSession();
        session.setAttribute("autenticador",nomeUsuario);

    }


}


