package br.com.banco;

import java.sql.*;

public class Banco {

    public static void main(String[] args) throws SQLException {
      Connection conexao = iniciandoConexao();
      exibirDados(conexao);
      conexao.close();
    }

    //iniciar conexao com banco

    public static Connection iniciandoConexao() throws SQLException {
        Connection conexao = DriverManager.getConnection(
                "jdbc:oracle:thin:@10.10.214.71:1521:xe","system","123456");
        System.out.println("Conectado!");
        return conexao;
    }

    //exibir dados do banco
    public static void exibirDados(Connection conexao) throws SQLException {
        String sql1 = "SELECT ID_PESSOA,NOME_PESSOA FROM TESTE";
        PreparedStatement ps = conexao.prepareStatement(sql1);
        //Executa o comando de consulta aonde guarda os dados retornados dentro do ResultSet.
        //Pelo fato de gerar uma lista de valores, é necessário percorrer os dados através do laço while
        ResultSet rs = ps.executeQuery();
        //Faz a verificação de enquanto conter registros, percorre e resgata os valores

        while(rs.next()){
            //Recupera o valor do campo referente ao nome do campo
            int idPessoa = rs.getInt("ID_PESSOA");
            String nomePessoa = rs.getString("NOME_PESSOA");
            System.out.println("ID:"+ idPessoa +", NOME:"+nomePessoa);
        }
    }
}
//codigo para inserir dados
  /*String sql = "INSERT INTO TESTE (ID_PESSOA, NOME_PESSOA) VALUES (255,'aaaaaa')";
        //Prepara a instrução SQL
        PreparedStatement ps = conexao.prepareStatement(sql);
        //Executa a instrução SQL
        ps.execute();
        */