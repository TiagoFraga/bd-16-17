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
public class User {
    private final String Username;
    private final String Password;
    private final String Nome;
    private final String Email;
    private final int NIF;
    private final String Morada;

    public User(String Username, String Password, String Nome, String Email, int NIF, String Morada) {
        this.Username = Username;
        this.Password = Password;
        this.Nome = Nome;
        this.Email = Email;
        this.NIF = NIF;
        this.Morada = Morada;
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }

    public String getNome() {
        return Nome;
    }

    public String getEmail() {
        return Email;
    }

    public int getNIF() {
        return NIF;
    }

    public String getMorada() {
        return Morada;
    }

    
    @Override
    public String toString() {
        return "User{" + "Username=" + Username + ", Password=" + Password + ", Nome=" + Nome + ", Email=" + Email + ", NIF=" + NIF + ", Morada=" + Morada + '}';
    }

    
    
    
}
