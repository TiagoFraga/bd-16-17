/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mongome;

import java.util.List;

/**
 *
 * @author João
 */
public class Reserva {
    private final String id;
    private final String username;
    private final String dataRes;
    private final String idComboio;
    private final double preco;
    private final String origem;
    private final String destino;
    private final String horaPartida;
    private final String horaChegada;
    private final List<Seat> lugares;

    public Reserva(String id, String username, String dataRes, String idComboio, double preco, String origem, String destino, String horaPartida, String horaChegada, List<Seat> lugares) {
        this.id = id;
        this.username = username;
        this.dataRes = dataRes;
        this.idComboio = idComboio;
        this.preco = preco;
        this.origem = origem;
        this.destino = destino;
        this.horaPartida = horaPartida;
        this.horaChegada = horaChegada;
        this.lugares = lugares;
    }

    public String getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getDataRes() {
        return dataRes;
    }

    public String getIdComboio() {
        return idComboio;
    }

    public double getPreco() {
        return preco;
    }

    public String getOrigem() {
        return origem;
    }

    public String getDestino() {
        return destino;
    }

    public String getHoraPartida() {
        return horaPartida;
    }

    public String getHoraChegada() {
        return horaChegada;
    }
    
    public List<Seat> getLugares(){
        return lugares;
    }
    
    
    
}
