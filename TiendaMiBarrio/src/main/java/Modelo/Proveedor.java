/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.*;

/**
 *
 * @author julian.bonilla
 */
public class Proveedor {
    
    private int idProv; 
    private String nombreProv; 
    private String dirProv; 
    private int telProv; 
    private String emailProv; 
    
    //CONSTRUCTOR
    public Proveedor() {
    }   

    public int getIdProv() {
        return idProv;
    }

    public void setIdProv(int idProv) {
        this.idProv = idProv;
    }

    public String getNombreProv() {
        return nombreProv;
    }

    public void setNombreProv(String nombreProv) {
        this.nombreProv = nombreProv;
    }

    public String getDirProv() {
        return dirProv;
    }

    public void setDirProv(String dirProv) {
        this.dirProv = dirProv;
    }

    public int getTelProv() {
        return telProv;
    }

    public void setTelProv(int telProv) {
        this.telProv = telProv;
    }

    public String getEmailProv() {
        return emailProv;
    }

    public void setEmailProv(String emailProv) {
        this.emailProv = emailProv;
    }

    //METODOS 
    public void crearProveedor(){
        
        ConexionBD objConector = new ConexionBD(); 
        objConector.conectar();
        
        try {
            
            String sql = "INSERT INTO proveedor VALUES(?,?,?,?,?);";
            PreparedStatement stmt; 
            stmt = objConector.conn.prepareStatement(sql); 
            stmt.setInt(1, this.idProv);
            stmt.setString(2, this.nombreProv);
            stmt.setString(3, this.dirProv);
            stmt.setInt(4, this.telProv); 
            stmt.setString(5, this.emailProv);
            
            stmt.execute(); 
            
            objConector.desconectar();
            
        } catch (Exception error) {
            System.out.println("Error en el Modelo: "+error);
        }
    }
    
    public ResultSet consultarProducto(){
        ConexionBD objConector = new ConexionBD(); 
        objConector.conectar();
        
        try {
            
            String sql = "SELECT * FROM proveedor WHERE idProv = ?; ";
            PreparedStatement stmt; 
            stmt = objConector.conn.prepareStatement(sql);
            stmt.setInt(1, this.idProv);
            ResultSet consulta = stmt.executeQuery(); 
            objConector.desconectar();
            return consulta; 
            
        } catch (Exception error) {
            System.out.println("Error Modelo Proveedor: "+error);
        }
 
        return null;
    }
    
    public ResultSet listarProveedor(){
        ConexionBD objConector = new ConexionBD(); 
        objConector.conectar();
        
        try {
            
            String sql = "SELECT * FROM proveedor; ";
            PreparedStatement stmt; 
            stmt = objConector.conn.prepareStatement(sql); 
            ResultSet consulta = stmt.executeQuery(); 
            objConector.desconectar();
            return consulta; 
            
        } catch (Exception error) {
            System.out.println("Error Modelo Proveedor: "+error);
        }
 
        return null;
        
    }
    
    public void actualizarProducto() {

        ConexionBD objConector = new ConexionBD();
        objConector.conectar();

        try {

            String sql = "UPDATE proveedor SET "
                    + "nombreProv = ?, "
                    + "dirProv = ?, "
                    + "telProv = ?, "
                    + "emailProv = ? "
                    + "WHERE idProv = ?; ";

            PreparedStatement stmt;
            stmt = objConector.conn.prepareStatement(sql);
            stmt.setInt(5, this.idProv);
            stmt.setString(1, this.nombreProv);
            stmt.setString(2, this.dirProv);
            stmt.setInt(3, this.telProv);
            stmt.setString(4, this.emailProv);

            stmt.execute();

            objConector.desconectar();

        } catch (Exception error) {
            System.out.println("Error en el Modelo: " + error);
        }
        
    }
    
    public void eliminarProducto(){
        ConexionBD objConector = new ConexionBD();
        objConector.conectar();

        try {

            String sql = "DELETE FROM proveedor "+
                         "WHERE idProv = ?; ";

            PreparedStatement stmt;
            stmt = objConector.conn.prepareStatement(sql);
            stmt.setInt(1, this.idProv);
            

            stmt.execute();

            objConector.desconectar();

        } catch (Exception error) {
            System.out.println("Error en Modelo: " + error);
        }
        
    }


}
