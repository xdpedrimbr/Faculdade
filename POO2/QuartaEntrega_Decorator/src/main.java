
public class main {

	public static void main(String[] args) {
		for(int i = 1; i < 6; i++) {
			System.out.println("\n\nNumero " + (i));
			janelaAbstract cartao = new janela();
			cartao.draw();			
		}
	}

}
