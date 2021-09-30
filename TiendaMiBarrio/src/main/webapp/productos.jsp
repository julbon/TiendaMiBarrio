<%-- 
    Document   : productos
    Created on : 30/09/2021, 02:50:48 PM
    Author     : julian.bonilla
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ControlProducto"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Productos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/estilos/estilos.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <header>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h1>Gestión de Productos</h1>
            </div>
        </header>

        <section class="container">
            <form method="POST" action="ControlProducto">
                <h3 style="text-align: center">Información General</h3>
                <div class="row">
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="idProd" required="">
                            <label for="floatingInput">Codigo: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="nombreProd" required="">
                            <label for="floatingInput">Descripción: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="marcaProd" required="">
                            <label for="floatingInput">Presentación: </label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="cantidadProd" required="">
                            <label for="floatingInput">Cantidad: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="precioProd" required="">
                            <label for="floatingInput">Precio: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="idProvFK" required="">
                            <label for="floatinInput">Proveedor: </label>
                        </div>
                        <div class="row">
                            <center>
                                <button class="btn btn-primary" name="btnAccion" value="Insertar">Guardar</button> 
                            </center>
                        </div>
                        </form>
                        </section>
                       
                        <section class="container">
                             <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Código</th>
                                        <th scope="col">Descripción</th>
                                        <th scope="col">Marca</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Proveedor</th>
                                    </tr>
                                </thead>
                                
                                    <tbody>
                                    <% 
                                    ArrayList<Producto> listaProducto = new ArrayList<>(); 
                                    ControlProducto ctrProducto = new ControlProducto(); 
                                    listaProducto = ctrProducto.listar(); 
                                    
                                    for(int i=0; i<listaProducto.size();i++){
                                                                  
                                    %>                                 
                                        <tr>
                                            <th scope="row"><%=listaProducto.get(i).getIdProd()%></th>
                                            <td><%=listaProducto.get(i).getNombreProd()%></td>
                                            <td><%=listaProducto.get(i).getMarcaProd()%></td>
                                            <td><%=listaProducto.get(i).getCantidadProd()%></td>
                                            <td><%=listaProducto.get(i).getPrecioProd()%></td>
                                            <td><%=listaProducto.get(i).getidProvFK()%></td>
                                            <td>
                                                <a href="actualizar.jsp?idProd=<%=listaProducto.get(i).getIdProd()%>"><button class="btn btn-outline-success">Actualizar</button></a>
                                                <a href="ControlProducto?idProd=<%=listaProducto.get(i).getIdProd()%>"><button class="btn btn-danger"> Eliminar </button></a>
                                            </td>
                                        </tr>
                                        <%}%>
                                        </tbody>
                                        </table>
                                        </section>

                                        <footer>
                                            <div class="container bg-success text-center bg-opacity-25 margen" >
                                                <h6>Grupo 6 S46, Mision TIC 2021, Todos los derechos reservados</h6>
                                            </div>
                                        </footer>

                                        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
                                        </body>
                                        </html>

