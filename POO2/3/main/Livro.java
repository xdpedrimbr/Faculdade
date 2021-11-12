package main;

import java.util.ArrayList;

public class Livro extends Biblioteca {
	private String autor;

	

	public Livro(String autor, String titulo, int ano) {
		setTitulo(titulo);
		setAno(ano);
		setAutor(autor);
	}
	
	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public static void addLivro(Livro l) throws Exception {
		insereBanco.insereLivro(l);
	}
		
}
