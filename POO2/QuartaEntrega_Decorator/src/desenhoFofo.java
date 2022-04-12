
abstract class desenhoFofo extends janelaDecorator {
	public desenhoFofo(janelaAbstract window) {
		super(window);
	}
	
	public void draw() {
		desenhaCoracao();
		window.draw();
	}
	
	private void desenhaCoracao() {
		System.out.println("\uD83C");
	}
}
