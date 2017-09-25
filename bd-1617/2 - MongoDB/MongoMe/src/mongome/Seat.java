/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mongome;

/**
 *
 * @author João
 */
public class Seat {
    private final int numero;
    private final int carruagem;
    private final int classe;

    public Seat(int numero, int carruagem, int classe) {
        this.numero = numero;
        this.carruagem = carruagem;
        this.classe = classe;
    }

    public int getNumero() {
        return numero;
    }

    public int getCarruagem() {
        return carruagem;
    }

    public int getClasse() {
        return classe;
    }
    
    
    
    
}
