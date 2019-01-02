package aaaaaa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Banco {
    public static void main(String[] args) throws SQLException {
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@10.10.214.71:1521:xe","system",
                "123456");
        System.out.println("conectado");
        connection.close();
    }
}
