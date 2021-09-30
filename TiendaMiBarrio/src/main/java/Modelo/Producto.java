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
public class Producto {
    
    private int idProd; 
    private String nombreProd; 
    private String marcaProd; 
    private int cantidadProd; 
    private double precioProd;
    private int idProvFK;
    
     public Producto() {
    }

    public int getIdProd() {
        return idProd;
    }

    public void setIdProd(int idProd) {
        this.idProd = idProd;
    }

    public String getNombreProd() {
        return nombreProd;
    }

    public void setNombreProd(String nombreProd) {
        this.nombreProd = nombreProd;
    }

    public String getMarcaProd() {
        return marcaProd;
    }

    public void setMarcaProd(String marcaProd) {
        this.marcaProd = marcaProd;
    }

    public int getCantidadProd() {
        return cantidadProd;
    }

    public void setCantidadProd(int cantidadProd) {
        this.cantidadProd = cantidadProd;
    }

    public double getPrecioProd() {
        return precioProd;
    }

    public void setPrecioProd(double precioProd) {
        this.precioProd = precioProd;
    }

    public int getidProvFK() {
        return idProvFK;
    }

    public void setidProvFK(int idProvFK) {
        this.idProvFK = idProvFK;
    }
     
     //METODOS 
    public void crearProducto(){
        
        ConexionBD objConector = new ConexionBD(); 
        objConector.conectar();
        
        try {
            
            String sql = "INSERT INTO producto VALUES(?,?,?,?,?,?);";
            PreparedStatement stmt; 
            stmt = objConector.conn.prepareStatement(sql); 
            stmt.setInt(1, this.idProd);
            stmt.setString(2, this.nombreProd);
            stmt.setString(3, this.marcaProd);
            stmt.setInt(4, this.cantidadProd);
            stmt.setDouble(5, this.precioProd); 
            stmt.setInt(6, this.idProvFK);
            
            stmt.execute(); 
            
            objConector.desconectar();
        } catch (Exception error) {
            System.out.println("Error Modelo: "+error);
        }
    }
    
    public void consultarProducto(){
        
    }
    
    public ResultSet listarProducto() {
        ConexionBD objConector = new ConexionBD();
        objConector.conectar();

        try {

            String sql = "SELECT * FROM producto; ";
            PreparedStatement stmt;
            stmt = objConector.conn.prepareStatement(sql);
            ResultSet consulta = stmt.executeQuery();
            objConector.desconectar();
            return consulta;

        } catch (Exception error) {
            System.out.println("Error Modelo Producto: " + error);
        }

        return null;
    }
    
        
    public void actualizarProducto(){
        
    }
    
    public void eliminarProducto(){
        
    }
}