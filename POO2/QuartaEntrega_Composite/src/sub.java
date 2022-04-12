
public class sub implements Expressao {
    private Expressao val1, val2;

    public sub(Expressao valor1, Expressao valor2) {
        this.val1 = valor1;
        this.val2 = valor2;
    }

    @Override
    public int reduzido() {
        return val1.reduzido() - val2.reduzido();
    }
}
