
public class soma implements Expressao {
    private Expressao a;
    private Expressao b;

    public soma(Expressao a, Expressao b) {
        this.a = a;
        this.b = b;
    }

    @Override
    public int reduzido() {
        return a.reduzido() + b.reduzido();
    }
}