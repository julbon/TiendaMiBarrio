/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author julian.bonilla
 */
public class TestConexion {
    public static void main(String[] args) {
        // TODO code application logic here
        ConexionBD objConexion = new ConexionBD(); 
        objConexion.conectar();
    }
}
