
public class janela extends janelaAbstract{
	public void draw() {
		msg1 msg = new msg1("Feliz Natal");
		System.out.println(msg.print());
		this.msg2();
		this.emoji();
	}

	public void msg1() {
		System.out.println("Feliz Navidad");
	}
	public void msg2() {
		System.out.println("Happy Birthday Papai Noel");
	}	
	public void emoji() {
		System.out.println("\uD83C");
	}
}
