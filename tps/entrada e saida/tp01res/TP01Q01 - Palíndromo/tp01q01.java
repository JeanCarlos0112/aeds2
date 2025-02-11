import java.util.Scanner;

public class tp01q01 {

    static boolean ispalindrome( String word ){
        boolean resp = false;
        int n = word.length();

        for (int i = 0, j = n-1 ; i < n/2 && j > 0; i++, j-- ) {
            if ( word.charAt(i) == word.charAt(j) ){
                resp = true;
            } else {
                resp = false;
            }
        }

        return resp;

    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        String word = scanner.nextLine();

        if ( ispalindrome(word) ){
            System.out.println("SIM");
        } else{
            System.out.println("NAO");
        }

        scanner.close();
    }
}