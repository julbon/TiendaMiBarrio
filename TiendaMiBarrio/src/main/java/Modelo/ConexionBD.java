/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionBD {

    // Configuracion de la conexion a la base de datos 
    public Connection conn; 
    private String host="localhost:3306";
    private String dataBase = "tiendamibarrio";
    private String user = "root"; 
    private String password = ""; 
    
    public void conectar(){ 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
            conn = DriverManager.getConnection("jdbc:mysql://"+this.host+"/"+this.dataBase+"?zeroDateTimeBehavior=CONVERT_TO_NULL",this.user,this.password);
            System.out.println("Conexión Exitosa!!");
        } catch (Exception error) {
            System.out.println("Error en la conexion: "+error);
        }
    }

    //Cerrar la conexin
         public void desconectar(){
        conn = null; 
        }


    public static void main(String[] args) {
        ConexionBD b = new ConexionBD();
        b.desconectar();
    }
}