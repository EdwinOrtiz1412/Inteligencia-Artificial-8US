/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package inteligencia.artificial;

/**
 *
 * @author Edwin
 */
public class OchoReinas {

    static final int N = 8;

    static void imprimirTablero(int tablero[][]) {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                System.out.print(tablero[i][j] + " ");
            }
            System.out.println();
        }
    }

    static boolean esSeguro(int tablero[][], int fila, int col) {
        int i, j;

        // Verificar la fila en la izquierda
        for (i = 0; i < col; i++)
            if (tablero[fila][i] == 1)
                return false;

        // Verificar la diagonal superior en la izquierda
        for (i = fila, j = col; i >= 0 && j >= 0; i--, j--)
            if (tablero[i][j] == 1)
                return false;

        // Verificar la diagonal inferior en la izquierda
        for (i = fila, j = col; j >= 0 && i < N; i++, j--)
            if (tablero[i][j] == 1)
                return false;

        return true;
    }

    static boolean resolverOchoReinasUtil(int tablero[][], int col) {
        if (col >= N)
            return true;

        for (int i = 0; i < N; i++) {
            if (esSeguro(tablero, i, col)) {
                tablero[i][col] = 1;

                if (resolverOchoReinasUtil(tablero, col + 1))
                    return true;

                tablero[i][col] = 0; // retroceder
            }
        }

        return false;
    }

    static boolean resolverOchoReinas() {
        int tablero[][] = new int[N][N];

        if (!resolverOchoReinasUtil(tablero, 0)) {
            System.out.println("No hay solución");
            return false;
        }

        imprimirTablero(tablero);
        return true;
    }

    public static void main(String args[]) {
        resolverOchoReinas();
    }
}

