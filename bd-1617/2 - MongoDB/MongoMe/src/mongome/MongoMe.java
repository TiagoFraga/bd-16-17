/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mongome;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author João
 */
public class MongoMe {

    /**
     * @param args the command line arguments
     */
     
     public static void main(String args[]){
        System.out.println("___  ___                       ___  ___     \n" +
                        "|  \\/  |                       |  \\/  |     \n" +
                        "| .  . | ___  _ __   __ _  ___ | .  . | ___ \n" +
                        "| |\\/| |/ _ \\| '_ \\ / _` |/ _ \\| |\\/| |/ _ \\\n" +
                        "| |  | | (_) | | | | (_| | (_) | |  | |  __/\n" +
                        "\\_|  |_/\\___/|_| |_|\\__, |\\___/\\_|  |_/\\___|\n" +
                        "                     __/ |                  \n" +
                        "                    |___/                   ");

        System.out.println("> Starting..");
        System.out.println("> Checking SQL database..");
        SQLreader getSQL = new SQLreader();
        try {
             getSQL.connect();
             getSQL.close();
             
        } catch (SQLException | ClassNotFoundException ex) {
             System.out.println(">>> Error connecting to databse. Quitting..\n Error: " + ex);
             return;
        } 
        
        System.out.println("> SQL connection successfull!");        
        MongoWriter mw = new MongoWriter();
        System.out.println("> Mongo connection successfull!");  
        
        ArrayList<Train> lista;
        ArrayList<User> listaUsers;
        ArrayList<Reserva> listaReservas;
         try {
             lista = getSQL.getTrains();
             listaUsers = getSQL.getUsers();
             listaReservas = getSQL.getReserva();
         } catch (SQLException | ClassNotFoundException ex) {
             System.out.println(">>> SQL error. Quitting..\n Error: " + ex);
             return;
        } 
        
        mw.addReserva(listaReservas);
        mw.addComboios(lista);
        mw.addUsers(listaUsers);
        
        System.out.println("All done!");
        pressAnyKeyToContinue();
   
        
    }
     
     public static void pressAnyKeyToContinue(){ 
        System.out.println("Press any key to continue...");
        try
        {
            System.in.read();
        }  
        catch(Exception e)
        {}  
    }
}
