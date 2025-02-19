
class tp01q03 {
    public static String ciframento(String s) {
        return ciframento(s,3);
    }

    public static boolean isFim(String s) {
        return (s.length() >= 3 && s.charAt(0) == 'F' &&
                s.charAt(1) == 'I' && s.charAt(2) == 'M');
    }

    public static String ciframento(String s, int deslocamento) {
        char[] array = new char[s.length()];
        for (int i = 0; i < s.length(); i++) {
            array[i] = (char) (s.charAt(i) + deslocamento);
        }
        return new String(array);
    }

    public static void main(String[] args) {
        String[] entrada = new String[1000];
        int numEntrada = 0;

        // Leitura da entrada padrao
        do {
            entrada[numEntrada] = MyIO.readLine();
        } while (isFim(entrada[numEntrada++]) == false);
        numEntrada--; // Desconsiderar ultima linha contendo a palavra FIM

        for (int i = 0; i < numEntrada; i++) {
            MyIO.println(ciframento(entrada[i]));
        }
    }
}
