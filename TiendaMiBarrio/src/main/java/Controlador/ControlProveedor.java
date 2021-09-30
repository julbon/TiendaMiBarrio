/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Producto;
import Modelo.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
@WebServlet(name = "ControlProveedor", urlPatterns = {"/ControlProveedor"})
public class ControlProveedor extends HttpServlet {
    Proveedor objProv = new Proveedor();
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
                
                int idProv = Integer.parseInt(request.getParameter("idProv")); 
                String nombreProv = request.getParameter("nombreProv");
                String dirProv = request.getParameter("dirProv");
                int telProv = Integer.parseInt(request.getParameter("telProv"));
                String emailProv = request.getParameter("emailProv"); 
                
                objProv.setIdProv(idProv);
                objProv.setNombreProv(nombreProv);
                objProv.setDirProv(dirProv);
                objProv.setTelProv(telProv);
                objProv.setEmailProv(emailProv);
                               
                objProv.crearProveedor();
                
                String mensaje = "<html> <body>"+
                                 " <script type='text/javaScript'> "+
                                 "      alert('Proveedor agregado correctamente!'); "+
                                 "      window.location.href='index.jsp'"+
                                 "</script> </body> </html>"; 
                
                out.println(mensaje);
            }
        }
        catch(Exception error){
            System.out.println("Error en el Controlador Proveedor: "+ error);
        }
    }
        
     public ArrayList listar(){
        try {
            ResultSet consulta = objProv.listarProveedor(); 
            ArrayList<Proveedor> listaProveedor = new ArrayList<>(); 
            
            while(consulta.next()){
                objProv = new Proveedor(); 
                objProv.setIdProv(consulta.getInt(1));
                objProv.setNombreProv(consulta.getString(2));
                objProv.setDirProv(consulta.getString(3));
                objProv.setTelProv(consulta.getInt(4));
                objProv.setEmailProv(consulta.getString(5));
                listaProveedor.add(objProv); 
            }
            
            return listaProveedor; 
            
        } catch (Exception error) {
            System.out.println("Error Controlador Proveedor:" + error);
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