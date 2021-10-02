<%-- 
    Document   : proveedores
    Created on : 30/09/2021, 02:50:34 PM
    Author     : julian.bonilla
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ControlProveedor"%>
<%@page import="Modelo.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Proveedores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/estilos/estilos.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        
        <script type="text/javascript">
            function confirmar(){
                var respuesta = confirm("¿Desea eliminar el proveedor?");
                if (respuesta === true){
                    return true;
                }else{
                    return false;
                }
            }
            
            
        </script>

        <header>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h1>TIENDA MI BARRIO.COM</h1>
            </div>
        </header>

        <section class="container">
            <form method="POST" action="ControlProveedor">
                <h3 style="text-align: center">Creación de Proveedores</h3>
                <div class="row">
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="idProv" required="">
                            <label for="floatingInput">Codigo: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="nombreProv" required="">
                            <label for="floatingInput">Nombre: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="dirProv" required="">
                            <label for="floatingInput">Dirección: </label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="telProv" required="">
                            <label for="floatingInput">Teléfono: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="emailProv" required="">
                            <label for="floatingInput">Email: </label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <button class="btn btn-primary" name="btnAccion" value="Insertar">Guardar</button>
                    </center>
                </div>
            </form>
        </section>
        <br>
        <section class="container">
            <table class="table table-light table-hover">
                <thead>
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Dirección</th>
                        <th scope="col">Teléfono</th>
                        <th scope="col">Email</th>
                        <th scope="col">Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Proveedor> listaProveedor = new ArrayList<>();
                        ControlProveedor ctrProveedor = new ControlProveedor();
                        listaProveedor = ctrProveedor.listar();

                        for (int i = 0; i < listaProveedor.size(); i++) {

                    %>                                 
                    <tr>
                        <th scope="row"><%=listaProveedor.get(i).getIdProv()%></th>
                        <td><%=listaProveedor.get(i).getNombreProv()%></td>
                        <td><%=listaProveedor.get(i).getDirProv()%></td>
                        <td><%=listaProveedor.get(i).getTelProv()%></td>
                        <td><%=listaProveedor.get(i).getEmailProv()%></td>
                        <td>
                            <a href="actualizar.jsp?idProv=<%=listaProveedor.get(i).getIdProv()%>"><button class="btn btn-outline-success">Actualizar</button></a>
                            <a href="ControlProveedor?idProv=<%=listaProveedor.get(i).getIdProv()%>&btnAccion=Eliminar"><button class="btn btn-danger" onclick="return confirmar();"> Eliminar </button></a>
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
