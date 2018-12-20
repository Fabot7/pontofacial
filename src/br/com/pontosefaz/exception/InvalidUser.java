package br.com.pontosefaz.exception;

import javax.servlet.ServletException;

public class InvalidUser extends ServletException {
    public InvalidUser(String message) {

        super(message);
    }
}
