
public class div implements Expressao{
    private Expressao numerador, denominador;
    
    div(Expressao num, Expressao den) {
        this.numerador = num;
        this.denominador = den;
    }

    @Override
    public int reduzido() {
        return numerador.reduzido() / denominador.reduzido();
    }
}
