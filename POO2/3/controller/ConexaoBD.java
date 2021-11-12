package controller;

import java.sql.*;

public class ConexaoBD {
	private static Connection conexao = null;
	
	private String fonte = "bancopoo";
	private ConexaoBD() {
		try {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + fonte, "root", "marillia1");
		
		} 
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Ocorreu um erro na conexao com o banco de dados!!!");
		}
	}

	public static Connection getInstance() {
		if (conexao == null) {
			new ConexaoBD();
		}
		return conexao;
	}
}
