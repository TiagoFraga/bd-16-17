/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mongome;

import com.mongodb.MongoClient;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

/**
 *
 * @author João
 */
public class MongoWriter {

    MongoClient mongoClient;
    
    public MongoWriter() {
        this.mongoClient = new MongoClient("localhost",27017);
    }
    
    public void addUsers (ArrayList<User> usersList) {
      
        try{
           MongoDatabase db = mongoClient.getDatabase("reserva_bilhetes");
           System.out.println(">> Database connection sucessful!");
           
           MongoCollection col = db.getCollection("utilizadores");

           for(User usr: usersList){
               Document doc = new Document();
               doc.put("_id", usr.getUsername());
               doc.put("nome",usr.getNome());
               doc.put("password",usr.getPassword());
               doc.put("email",usr.getEmail());
               doc.put("nif",usr.getNIF());
               doc.put("morada",usr.getMorada());
               
                    col.insertOne(doc);
               System.out.println("User " + usr.getNome() + " added!");
                 
           }
       } catch (Exception e) {System.out.println(e);}
        
    }
    
    public void addReserva (ArrayList<Reserva> reservaList) {
      
        try{
           MongoDatabase db = mongoClient.getDatabase("reserva_bilhetes");
           System.out.println(">> Database connection sucessful!");
           
           MongoCollection col = db.getCollection("reservas");

           for(Reserva r: reservaList){
               Document doc = new Document();
               doc.put("_id",r.getId());
               doc.put("username",r.getUsername());
               doc.put("data_reserva",r.getDataRes());
               doc.put("id_comboio",r.getIdComboio());
               doc.put("preco",r.getPreco());
               doc.put("origem",r.getOrigem());
               doc.put("destino",r.getDestino());
               doc.put("horaPartida",r.getHoraPartida());
               doc.put("horaChegada",r.getHoraChegada());
               List<BasicDBObject> lugares = new ArrayList<>();
               
               for(Seat s : r.getLugares()){
                   BasicDBObject tmp = new BasicDBObject();
                   tmp.put("numero",s.getNumero());
                   tmp.put("carruagem",s.getCarruagem());
                   tmp.put("classe", s.getClasse());
                   lugares.add(tmp);
               }
               doc.put("lugares", lugares);
               
               if (doc!=null)
                    col.insertOne(doc);
               System.out.println("Reserva " + r.getId() + " added!");
                 
           }
       } catch (Exception e) {System.out.println(e);}
        
    }
    
    public void addComboios (ArrayList<Train> trainList) {
      
        try{
           MongoDatabase db = mongoClient.getDatabase("reserva_bilhetes");
           System.out.println(">> Database connection sucessful!");
           
           MongoCollection col = db.getCollection("comboios");

           for(Train t: trainList){
               Document doc = new Document();
               doc.put("_id",t.getId_Comboio());
               doc.put("lotacão",t.getLotacao());
               doc.put("nome",t.getNome());
               
               List<BasicDBObject> lugares = new ArrayList<>();
               for(Seat s : t.getLugares()){
                   BasicDBObject tmp = new BasicDBObject();
                   tmp.put("numero",s.getNumero());
                   tmp.put("carruagem",s.getCarruagem());
                   tmp.put("classe", s.getClasse());
                   lugares.add(tmp);
               }
               doc.put("lugares", lugares);
               
               if (doc!=null)
                    col.insertOne(doc);
               System.out.println("Comboio " + t.getNome() + " added!");
                 
           }
       } catch (Exception e) {System.out.println(e);}
        
    }
}
