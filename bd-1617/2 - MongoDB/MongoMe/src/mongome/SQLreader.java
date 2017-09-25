/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mongome;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author João
 */
public class SQLreader {
    
    private final String url;
    private final String user;
    private final String password;
    private Connection con;
    
    public SQLreader() {
        this.url = "jdbc:mysql://localhost/reserva_bilhetes?autoReconnect=true&useSSL=false";
        this.user = "root";
        this.password = "password";
    }
    
    public void connect() throws SQLException, ClassNotFoundException{

            Class.forName("com.mysql.jdbc.Driver");
            con = (com.mysql.jdbc.Connection) DriverManager.getConnection("jdbc:mysql://localhost/reserva_bilhetes?autoReconnect=true&useSSL=false", "root", "password");
      }
      
    public void close() throws SQLException {
        if(con!=null && !con.isClosed())
            con.close();
    }
    
    public ArrayList getTrains() throws ClassNotFoundException, SQLException{
        Statement st = null;
        ResultSet rs_comboios = null;
        ResultSet rs_lugares = null;
        ArrayList<Train> trainList = new ArrayList <>();
        
        HashMap<String,ArrayList<Seat>> seatList = new HashMap<>();
        

        connect();
        st = con.createStatement();
        rs_lugares = st.executeQuery("SELECT * FROM lugar_comboio");

        
        while (rs_lugares.next()){
            int i = 1;
            while(i <= 3)
                if(seatList.get(rs_lugares.getString(4)) != null) {
                     seatList.get(rs_lugares.getString(4)).add(
                                  new Seat(rs_lugares.getInt(i++),
                                           rs_lugares.getInt(i++),
                                           rs_lugares.getInt(i++)
                     ));
                }else{
                    ArrayList<Seat> aux = new ArrayList<>();
                    aux.add(new Seat(rs_lugares.getInt(i++),
                                     rs_lugares.getInt(i++),
                                     rs_lugares.getInt(i++)));

                    seatList.put(rs_lugares.getString(4),aux);
                }
        }

        rs_comboios = st.executeQuery("SELECT * FROM comboio");

        while (rs_comboios.next()){
            int i = 1;
            while(i <= 3)
                trainList.add(new Train(rs_comboios.getString(i++),
                                        rs_comboios.getInt(i++),
                                        rs_comboios.getString(i++),
                                        seatList.get(rs_comboios.getString(1))


                ));
        }


        
        close();
        
        return trainList;
       }
    
    public ArrayList getUsers() throws ClassNotFoundException, SQLException{
        Statement st = null;
        ResultSet rs = null;
        ArrayList<User> usersList = new ArrayList <>();
      
        connect();
        st = con.createStatement();
        rs = st.executeQuery("SELECT * FROM cliente");

        while (rs.next()){
            int i = 1;
            while(i <= 6)
                usersList.add(new User(rs.getString(i++),
                                       rs.getString(i++),
                                       rs.getString(i++),
                                       rs.getString(i++),
                                       rs.getInt(i++),
                                       rs.getString(i++)
                ));
        }

        close();
        return usersList;
}
    
    public ArrayList getReserva() throws ClassNotFoundException, SQLException{
        Statement st = null;
        ResultSet rs = null;
        ResultSet rs_lugares = null;
        ArrayList<Reserva> reservaList = new ArrayList <>();
        
        connect();
        st = con.createStatement();
        
        HashMap<String,ArrayList<Seat>> seatList = new HashMap<>();
        rs_lugares = st.executeQuery("SELECT * FROM lugar_reserva");
        
        while (rs_lugares.next()){
            int i = 1;
            while(i <= 3)
                if(seatList.get(rs_lugares.getString(5)) != null) {
                     seatList.get(rs_lugares.getString(5)).add(
                                  new Seat(rs_lugares.getInt(i++),
                                           rs_lugares.getInt(i++),
                                           rs_lugares.getInt(i++)
                     ));
                }else{
                    ArrayList<Seat> aux = new ArrayList<>();
                    aux.add(new Seat(rs_lugares.getInt(i++),
                                     rs_lugares.getInt(i++),
                                     rs_lugares.getInt(i++)));

                    seatList.put(rs_lugares.getString(5),aux);
                }
        }
        
        rs = st.executeQuery("SELECT id_Reserva,R.Username, Data_Reserva, V.id_Comboio, Preço, Origem, Destino, Hora_Partida, Hora_Chegada\n" +
                                 "FROM reserva AS R INNER JOIN viagem AS V\n" +
                                     "ON V.id_Viagem = R.id_Viagem");
        
        


        while (rs.next()){
            int i = 1;
            while(i <= 9)
                reservaList.add(new Reserva(rs.getString(i++),
                                            rs.getString(i++),
                                            rs.getString(i++),
                                            rs.getString(i++),
                                            rs.getDouble(i++),
                                            rs.getString(i++),
                                            rs.getString(i++),
                                            rs.getString(i++),
                                            rs.getString(i++),
                                            seatList.get(rs.getString(1))
                ));
        }

        close();

        return reservaList;
       }
}

