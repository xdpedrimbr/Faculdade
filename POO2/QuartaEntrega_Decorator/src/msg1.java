
public class msg1 {
	private String texto;
	
	public msg1(String msg) {
		this.texto = msg;
	}
	
	public String print() {
		msg2 msg = new msg2("Feliz natal");
		return (msg.print() + "\nFeliz Navidad");
	}
}
