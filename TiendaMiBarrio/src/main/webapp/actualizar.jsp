<%-- 
    Document   : actualizar
    Created on : 30/09/2021, 02:01:14 PM
    Author     : julian.bonilla
--%>

<%@page import="java.util.*"%>
<%@page import="Modelo.Proveedor"%>
<%@page import="Controlador.ControlProveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Proveedores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/estilos/estilos.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>

        <header>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h1>TIENDA MI BARRIO.COM</h1>
            </div>
        </header>
        
        <%
            String idStr = request.getParameter("idProv");
            int idInt = Integer.parseInt(idStr.toString());
            ControlProveedor ctrProv = new ControlProveedor();
            ArrayList<Proveedor> consultaProv = new ArrayList(); 
            consultaProv = ctrProv.consultar(idInt);
        %>
        
        <section class="container">
            <form method="POST" action="ControlProveedor">
                <h3 style="text-align: center"><br>Actualización de Proveedores<br></h3>
                <div class="row">
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="idProv" readonly="" value="<%out.println(consultaProv.get(0).getIdProv());%>">
                            <label for="floatingInput">Codigo: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="nombreProv" required="" value="<%out.println(consultaProv.get(0).getNombreProv());%>">
                            <label for="floatingInput">Nombre: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="dirProv" required="" value="<%out.println(consultaProv.get(0).getDirProv());%>">
                            <label for="floatingInput">Dirección: </label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="telProv" required="" value="<%out.println(consultaProv.get(0).getTelProv());%>">
                            <label for="floatingInput">Teléfono: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="emailProv" required="" value="<%out.println(consultaProv.get(0).getEmailProv());%>">
                            <label for="floatingInput">Email: </label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <button class="btn btn-primary" name="btnAccion" value="Actualizar">Actualizar</button>
                    </center>
                </div>
            </form>
        </section>
            <br>
         <footer>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h6>Grupo 6 S46, Mision TIC 2021, Todos los derechos reservados</h6>
            </div>
        </footer>

        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
