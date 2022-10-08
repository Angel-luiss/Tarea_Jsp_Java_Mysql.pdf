/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author angeltucubal
 */
public class Estudiante extends Persona {
    private String carnet;
    private int id_tipo_sangre;
    private Conexion cn;
    public Estudiante() {}
    public Estudiante(String carnet, int id_tipo_sangre, int id, String nombres, String apellidos, String direccion, String telefono, String correo_electronico, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, correo_electronico, fecha_nacimiento);
        this.carnet = carnet;
        this.id_tipo_sangre = id_tipo_sangre;
    }
    
    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public int getId_tipo_sangre() {
        return id_tipo_sangre;
    }

    public void setId_tipo_sangre(int id_tipo_sangre) {
        this.id_tipo_sangre = id_tipo_sangre;
    }
    
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
    try{
        cn = new Conexion();
        cn.abrir_conexion();
        String query = "SELECT e.id_estudiante as id,e.carnet,e.nombres,e.apellidos,e.direccion,e.telefono,e.correo_electronico,p.sangre,p.id_tipo_sangre,e.fecha_nacimiento FROM estudiantes as e inner join tipos_sangre as p on e.id_tipo_sangre = p.id_tipo_sangre;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado[] = {"id","carnet","nombres","apellidos","direccion","telefono","correo","nacimiento","sangre","id_tipo_sangre"};
        tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String [10];
        while(consulta.next()){
            datos[0] = consulta.getString("id");
            datos[1] = consulta.getString("carnet");
            datos[2] = consulta.getString("nombres");
            datos[3] = consulta.getString("apellidos");
            datos[4] = consulta.getString("direccion");
            datos[5] = consulta.getString("telefono");
            datos[6] = consulta.getString("correo_electronico");
            datos[7] = consulta.getString("sangre");
            datos[8] = consulta.getString("id_tipo_sangre");
            datos[9] = consulta.getString("fecha_nacimiento");
            tabla.addRow(datos);
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
    return tabla;
    }
    
    @Override
    public int agregar(){
    int retorno = 0;
    try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query;
            query="INSERT INTO estudiantes(carnet,nombres,apellidos,direccion,telefono,correo_electronico,id_tipo_sangre,fecha_nacimiento)\n" + "VALUES(?,?,?,?,?,?,?,?);";
            cn=new Conexion();
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1,this.getCarnet());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getCorreo_electronico());
            parametro.setInt(7, this.getId_tipo_sangre());
            parametro.setString(8, this.getFecha_nacimiento());
            
            int executar = parametro.executeUpdate();
            retorno = executar;
            cn.cerrar_conexion();
            //JOptionPane.showMessageDialog(null,Integer.toString(executar) + " Registro Ingresado","Agregar",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println("Error......" + ex.getMessage());
        }
    
    return retorno;
    }
    
    @Override
    public int modificar(){
    int retorno = 0;
    try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query;
            query="update estudiantes set carnet=?,nombres=?,apellidos=?,direccion=?,telefono=?,correo_electronico=?,id_tipo_sangre=?,fecha_nacimiento=? where id_estudiante=?;";
            cn=new Conexion();
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1,this.getCarnet());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getCorreo_electronico());
            parametro.setInt(7, this.getId_tipo_sangre());
            parametro.setString(8, this.getFecha_nacimiento());
            parametro.setInt(9, this.getId());
            
            int executar = parametro.executeUpdate();
            retorno = executar;
            cn.cerrar_conexion();
            //JOptionPane.showMessageDialog(null,Integer.toString(executar) + " Registro Ingresado","Agregar",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println("Error......" + ex.getMessage());
        }
    
    return retorno;
    }
    
    @Override
    public int eliminar(){
    int retorno = 0;
    try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query;
            query="delete from estudiantes where id_estudiante=?;";
            cn=new Conexion();
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, this.getId());
            
            int executar = parametro.executeUpdate();
            retorno = executar;
            cn.cerrar_conexion();
            //JOptionPane.showMessageDialog(null,Integer.toString(executar) + " Registro Ingresado","Agregar",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println("Error......" + ex.getMessage());
        }
    
    return retorno;
    }
    
    
}
