
public class resultado implements Expressao {
    private final int res;

    public resultado(int num) {
        this.res = num;

    }

    @Override
    public int reduzido() {
        return this.res;
    }


}

