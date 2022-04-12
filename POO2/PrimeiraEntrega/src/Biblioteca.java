import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Biblioteca {
	private String titulo;
	private int ano;
	public static Map<Integer, Integer[]> mapBiblioteca = new HashMap<Integer, Integer[]>();
	public static ArrayList<Revista> arrayrevista = new ArrayList<Revista>();
	public static ArrayList<Livro> arraylivro = new ArrayList<Livro>();
	public static int index = 0;
	
	public Biblioteca() {
		index = index + 1;
	}
	
	public static int getIndex() {
		return index;
	}
	public static void setIndex(int index) {
		Biblioteca.index = index;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public static String printa() {
		String str = "";
		for(int i = 1; i <= mapBiblioteca.size(); i++) {
			if(mapBiblioteca.get(i)[0] == 1) {
				str += "\n\nLivros";
				str += "\nTitulo: " + arraylivro.get(mapBiblioteca.get(i)[1]).getTitulo();
				str += "\nAutor: " + arraylivro.get(mapBiblioteca.get(i)[1]).getAutor();
				str += "\nAno: " + arraylivro.get(mapBiblioteca.get(i)[1]).getAno();
			}else {
				str += "\n\nRevistas";
				str += "\nTitulo: " + arrayrevista.get(mapBiblioteca.get(i)[1]).getTitulo();
				str += "\nOrganizacao: " + arrayrevista.get(mapBiblioteca.get(i)[1]).getOrg();
				str += "\nAno: " + arrayrevista.get(mapBiblioteca.get(i)[1]).getAno();
				str += "\nVolume: " + arrayrevista.get(mapBiblioteca.get(i)[1]).getVol();
				str += "\nNumero: " + arrayrevista.get(mapBiblioteca.get(i)[1]).getNro();
			}
		}
		return str;
	}
}
