
public class main {

	public static void main(String[] args) {

		resultado val = new resultado(0);
    	System.out.println(val.reduzido());
    	
    	soma somar = new soma(new resultado(1), new resultado(2));
    	System.out.println(somar.reduzido());
    	
    	soma soma = new soma(new resultado(2), new resultado(3));
    	multi mult = new multi(new resultado(1), new resultado(soma.reduzido()));
    	System.out.println(mult.reduzido());

    	sub sub = new sub(new resultado(5), new resultado(3));
    	div div = new div(new resultado(4), new resultado(sub.reduzido()));
    	multi multiplicacao = new multi(new resultado(2), new resultado(3));
    	soma soma1 = new soma(new resultado(multiplicacao.reduzido()), new resultado(div.reduzido()));
    	System.out.println(soma1.reduzido());
    	

	}

}
