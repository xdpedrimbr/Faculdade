import java.util.ArrayList;

public class Revista extends Biblioteca{
	private String org;
	private int vol;
	private int nro;

	
	public Revista(String org, int vol, int nro, String titulo, int ano) {
		setTitulo(titulo);
		setAno(ano);
		setOrg(org);
		setVol(vol);
		setNro(nro);
	}
	
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public int getVol() {
		return vol;
	}
	public void setVol(int vol) {
		this.vol = vol;
	}
	public int getNro() {
		return nro;
	}
	public void setNro(int nro) {
		this.nro = nro;
	}
	
	public static void addRevista(Revista r) {
		arrayrevista.add(r);
		Integer[] array = {2, arrayrevista.size() - 1};
		Revista.mapBiblioteca.put(getIndex(), array);
	}
	
}
