
public class multi  implements Expressao{
    private final Expressao x1, x2;


    public multi(Expressao valor1, Expressao valor2) {
        this.x1 = valor1;
        this.x2 = valor2;
    }


    @Override
    public int reduzido() {
        return x1.reduzido() * x2.reduzido();  //converte os valores
    }
}
