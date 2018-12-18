package br.com.pontosefaz.exception;

import javax.servlet.ServletException;

public class invalidUser extends ServletException {
    public invalidUser(String message) {

        super(message);
    }
}
