package utfpr.ct.dainf.grader;

/**
 *
 * @author Wilson Horstmeyer Bogado <wilson@utfpr.edu.br>
 */
public class TestUtils {

    public static int random(int min, int max) {
        return min + (int)Math.round((max-min) * Math.random());
    }
    
    public static double random(double min, double max) {
        return min + (max-min) * Math.random();
    }
    
    /**
     * Retorna o fatorial de n recursivamente.
     * @param n O número cujo fatorial será calculado
     * @return O O fatorial de n
     */
    public static long fatorialTest(int n) {
        if (n < 2) { // o caso trivial
            return 1;
        } else { // a chamada recursiva
            return n * fatorialTest(n - 1);
        }
    }
    
    /**
     * Retorna o maior divisor comum entre m e n.
     * @param m O dividendo
     * @param n O divisor
     * @return O maior divisor comum entre e m e n
     */
    public static int mdcTest(int m, int n) {
        if (n > m)
            return mdcTest(n, m);
        else
            if (n > 0)
                return mdcTest(n, m % n);
            else
                return m;
    }

}
