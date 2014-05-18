
/**
 * IF62C Fundamentos de Programação 2
 * Exemplo de programação em Java.
 * @author Wilson Horstmeyer Bogado <wilson@utfpr.edu.br>
 */
public class Pratica34 {

    public static void main(String[] args) {
        long f;
        int n = 0;
        do {
            f = fatorial(n);
            if (f > 0) System.out.printf("%d! = %d%n", n, f);
            n++;
        } while (f > 0);
        int mdc1 = mdc(12, 24);
        int mdc2 = mdc(7, 5);
        System.out.printf("MDC de %d e %d = %d%n", 12, 24, mdc1);
        System.out.printf("MDC de %d e %d = %d%n", 7, 5, mdc2);
    }

    /**
     * Retorna o fatorial de n recursivamente.
     * @param n O número cujo fatorial será calculado
     * @return O O fatorial de n
     */
    public static long fatorial(int n) {
        if (n < 2) { // o caso trivial
            return 1;
        } else { // a chamada recursiva
            return n * fatorial(n - 1);
        }
    }
    
    /**
     * Retorna o maior divisor comum entre m e n.
     * @param m O dividendo
     * @param n O divisor
     * @return O maior divisor comum entre e m e n
     */
    public static int mdc(int m, int n) {
        if (n > m)
            return mdc(n, m);
        else
            if (n > 0)
                return mdc(n, m % n);
            else
                return m;
    }
}
