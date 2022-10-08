<%-- 
    Document   : index
    Created on : 1 oct. 2022, 14:20:47
    Author     : angeltucubal
--%>
<%@page import="modelo.Tipos_sangre"%>
<%@page import="modelo.Estudiante"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>Estudiantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body style="background-color: #f4f3f3" >
         
       
     <nav class="navbar navbar-expand" style="background-color: #2c2c2c" >
    
   
        
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active"  href="index.jsp"><img src="se.png" width="15"    ></a>
        </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" style="color: #d0d0d0" href="Estudiantesxd.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color: #d0d0d0" href="Nosotros.jsp">Nosotros</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color: #d0d0d0" href="Contacto.jsp">Contacto</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" style="color: #d0d0d0" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Sub Menu
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Copiar Accion</a></li>
            <li><a class="dropdown-item" href="#">Cortar Accion</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Pegar Accion</a></li>
          </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" style="color: #d0d0d0" href="Ubicacion.jsp">Ubicacion</a>
        </li>
      </ul>
        
     </div>
    
  </div>
</nav>
  
 <br>
 <h1 class="text-center">Formulario Estudiantes</h1>
   
   
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_estudiantes" onclick="limpiar()">
  Nuevo
</button>
        <br>

        
<!-- Modal -->
<div class="modal fade" id="modal_estudiantes" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">
        <div class"container">
        <h1><b>Formulario Estudiantes</b></h1>
        
            <form action="sr_estudiantes" method="post" class="form-group">
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_carnet"><b>Carnet:</b></label>
                <input type="text" name="txt_carnet" id="txt_carnet" class="form-control" min="E001" max="E009" placeholder="Ejemplo: E001 A E999" required>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 Apellido 2" required>
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #Casa Calle, Zona, Ciudad" required>
                <label for="lbl_telefono"><b>Telefono</b></label>
                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555" required>
                <label for="lbl_correo"><b>Correo Electronico:</b></label>
                <input type="email" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: ltucubala@miumg.edu.gt" required>
                <label for="lbl_sangre"><b>Tipo de Sangre:</b></label>
                <select name="drop_sangre" id="drop_sangre" class="form-control">
                    <% 
                    Tipos_sangre tipos_sangre = new Tipos_sangre();
                    HashMap<String,String> drop = tipos_sangre.drop_sangre();
                    for(String i: drop.keySet()){
                        out.println("<option value='"+ i +"'>'"+drop.get(i)+"'</option>");
                        }
                    %>
                </select>
                <label for="lbl_fn"><b>Nacimiento:</b></label>
                <input type="datetime" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ejemplo: 2000-01-01" required>
                <br>
            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('Desea Eliminar?'))return false">Eliminar</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>    
            </form>
                
        </div>
      </div>
    </div>
  </div>
</div>
                <br>
      
        <table class="table table-bordered">
    <thead>
      <tr>
        <th>Carnet</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Correo</th>
        <th>Sangre</th>
        <th>Nacimineto</th>
      </tr>
    </thead>
    <tbody id="tbl_estudiantes">
     <% Estudiante estudiante = new Estudiante();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = estudiante.leer();
                        for(int t=0;t<tabla.getRowCount();t++){
                        out.println("<tr data-id="+tabla.getValueAt(t, 0)+ " data-id_s="+tabla.getValueAt(t, 8)+" >");
                        out.println("<td> "+ tabla.getValueAt(t, 1)+" </td>");
                        out.println("<td> "+ tabla.getValueAt(t, 2)+" </td>");
                        out.println("<td> "+ tabla.getValueAt(t, 3)+" </td>");
                        out.println("<td> "+ tabla.getValueAt(t, 4)+" </td>");
                        out.println("<td> "+ tabla.getValueAt(t, 5)+" </td>");
                        out.println("<td> "+ tabla.getValueAt(t, 6)+" </td>");
                        out.println("<td> "+ tabla.getValueAt(t, 7)+" </td>");
                        out.println("<td> "+ tabla.getValueAt(t, 9)+" </td>");
                        out.println("</tr>");
                        }
          %>  
          
          
    </tbody>
  </table>
<br><br><br>
    <center>
<div><img src="travis.png" width="1500" height="410px" margin-right:10px;  ></div>
</center>

        
    <script src="https://code.jquery.com/jquery-3.6.1.slim.js" integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script type="text/javascript">
    function limpiar(){
        $("#txt_id").val(0);
            $("#txt_carnet").val('');
            $("#txt_nombres").val('');
            $("#txt_apellidos").val('');
            $("#txt_direccion").val('');
            $("#txt_telefono").val('');
            $("#txt_correo").val('');
            $("#drop_sangre").val('1');
            $("#txt_fn").val('');
    }
    
        $('#tbl_estudiantes').on('click','tr td',function(evt){
            var target,id,id_s,carnet,nombres,apellidos,direccion,telefono,correo,nacimiento;
            target = $(event.target);
            id = target.parent().data('id');
            
            carnet  = target.parent("tr").find("td").eq(0).html();
            nombres = target.parent("tr").find("td").eq(1).html();
            apellidos = target.parent("tr").find("td").eq(2).html();
            direccion = target.parent("tr").find("td").eq(3).html();
            telefono = target.parent("tr").find("td").eq(4).html();
            correo = target.parent("tr").find("td").eq(5).html();
            id_s = target.parent().data('id_s');
            nacimiento = target.parent("tr").find("td").eq(7).html();
            $("#txt_id").val(id);
            $("#txt_carnet").val(carnet);
            $("#txt_nombres").val(nombres);
            $("#txt_apellidos").val(apellidos);
            $("#txt_direccion").val(direccion);
            $("#txt_telefono").val(telefono);
            $("#txt_correo").val(correo);
            $("#drop_sangre").val(id_s);
            $("#txt_fn").val(nacimiento);
            $("#modal_estudiantes").modal('show');
            
        });
        
        
    </script>
    
    
    </body>
</html>
