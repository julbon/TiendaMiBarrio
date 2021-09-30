<%-- 
    Document   : index
    Created on : 29/09/2021, 02:39:51 PM
    Author     : julian.bonilla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css" type="text/css"/>
        <title>Inicio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <header>

            <div class="logo">
                <img src=url('assets/imagen/logo.png') alt="">
            </div>
            <nav class="navegacion">
                <ul class="menu">
                    <li><a href="#">Gestión de Inventarios</a>
                        <ul class="submenu">
                            <li><a href="productos.jsp">Gestión de Productos</a></li>
                            <li><a href="proveedores.jsp">Gestión de Proveedores</a></li>

                        </ul>
                    </li>
                    <li><a href="#">Gestión de Ventas</a>
                        <ul class="submenu">
                            <li><a href="ventas.html">Registrar Venta</a></li>
                            <li><a href="#">Consultar Factura</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Reportes</a>
                        <ul class="submenu">
                            <li><a href="#">Ventas Diarias</a></li>
                            <li><a href="#">Stock Bajo</a></li>
                        </ul>
                    </li>

                </ul>
            </nav>
        </header>
    </body>
</html>
