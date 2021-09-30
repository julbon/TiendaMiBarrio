/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author julian.bonilla
 */
@WebServlet(name = "ControlProducto", urlPatterns = {"/ControlProducto"})
public class ControlProducto extends HttpServlet {
    Producto objProducto = new Producto(); 
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String accion = request.getParameter("btnAccion");
           
            if(accion.equals("Insertar")){
                
                int idProd = Integer.parseInt(request.getParameter("idProd"));
                System.out.println(idProd);
                String nombreProd = request.getParameter("nombreProd");
                System.out.println(nombreProd);
                String marcaProd = request.getParameter("marcaProd");
                System.out.println(marcaProd);
                int cantidadProd = Integer.parseInt(request.getParameter("cantidadProd"));
                System.out.println(cantidadProd);
                int precioProd = Integer.parseInt(request.getParameter("precioProd"));
                System.out.println(precioProd);
                int idProvFK = Integer.parseInt(request.getParameter("idProvFK"));
                System.out.println(idProvFK);
                objProducto.setIdProd(idProd);
                objProducto.setNombreProd(nombreProd);
                objProducto.setMarcaProd(marcaProd);
                objProducto.setCantidadProd(cantidadProd);
                objProducto.setPrecioProd(precioProd);
                objProducto.setidProvFK(idProvFK);
                
                objProducto.crearProducto();
                
                String mensaje = "<html> <body>"+
                                 " <script type='text/javaScript'> "+
                                 "      alert('Producto insertado correctamente!'); "+
                                 "      window.location.href='index.jsp'"+
                                 "</script> </body> </html>"; 
                
                out.println(mensaje);
            }
        }
        catch(Exception error){
            System.out.println("Error en el Controlador Producto: "+ error);
        }
    }
    
     public ArrayList listar(){
        try {
            ResultSet consulta = objProducto.listarProducto(); 
            ArrayList<Producto> listaProducto = new ArrayList<>(); 
            
            while(consulta.next()){
                objProducto = new Producto(); 
                objProducto.setIdProd(consulta.getInt(1));
                objProducto.setNombreProd(consulta.getString(2));
                objProducto.setMarcaProd(consulta.getString(3));
                objProducto.setCantidadProd(consulta.getInt(4));
                objProducto.setPrecioProd(consulta.getInt(5));
                objProducto.setidProvFK(consulta.getInt(6));
                listaProducto.add(objProducto); 
            }
            
            return listaProducto; 
            
        } catch (Exception error) {
            System.out.println("Error Controlador Producto:" + error);
        }
 
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
