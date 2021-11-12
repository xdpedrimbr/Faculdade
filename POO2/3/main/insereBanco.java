package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import controller.ConexaoBD;

public class insereBanco {
	static Connection conexao = null;
	
	public static void insereRevista(Revista revista) throws Exception{
		try {	
			Connection conexao = ConexaoBD.getInstance();
			
			String sql = "insert into Revista(titulo, ano, org, vol, nro) values (?,?,?,?,?)";
					
			PreparedStatement stmt = conexao.prepareStatement(sql);
					
			stmt.setString(1, revista.getTitulo());
			stmt.setInt(2, revista.getAno());
			stmt.setString(3, revista.getOrg());
			stmt.setInt(4, revista.getVol());
			stmt.setInt(5, revista.getNro());

			
			stmt.execute();
			stmt.close();
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public static void insereLivro(Livro livro) throws Exception{
		try {
			Connection conexao = ConexaoBD.getInstance();
			
			String sql = "insert into Livro(titulo, ano, autor) values (?,?,?)";
			
			PreparedStatement stmt = conexao.prepareStatement(sql);
			
			stmt.setString(1, livro.getTitulo());
			stmt.setInt(2, livro.getAno());
			stmt.setString(3, livro.getAutor());
			
			stmt.execute();
			stmt.close();
			
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	public static void mostraLivro() throws Exception{
		conexao = ConexaoBD.getInstance();
		
		String sql = "select * from Livro";
		
		PreparedStatement stmt = conexao.prepareStatement(sql);
		ResultSet resultado = stmt.executeQuery();
		
		Livro livroInserido = null;
		
		while(resultado.next()) {
			livroInserido = new Livro(
					resultado.getString("titulo"),
					resultado.getString("autor"),
					resultado.getInt("ano")
					);
			
				Livro.arraylivro.add(livroInserido);
				Integer[] array = {1, Livro.arraylivro.size() - 1};
				Livro.mapBiblioteca.put(Livro.getIndex(), array);
				
		}
		resultado.close();
		stmt.close();
	}
	
	public static void mostraRevista() throws Exception{
		conexao = ConexaoBD.getInstance();
		
		String sql = "select * from Revista";
		
		PreparedStatement stmt = conexao.prepareStatement(sql);
		ResultSet resultado = stmt.executeQuery();
		
		Revista revistaInserida = null;
		
		while(resultado.next()) {
			revistaInserida = new Revista(
					resultado.getString("titulo"),
					resultado.getInt("ano"),
					resultado.getInt("vol"),
					resultado.getString("org"),
					resultado.getInt("nro")
					);
			
				Revista.arrayrevista.add(revistaInserida);
				Integer[] array = {2, Revista.arrayrevista.size() - 1};
				Revista.mapBiblioteca.put(Revista.getIndex(), array);
				
		}
		resultado.close();
		stmt.close();
	}
	
	
	
}

