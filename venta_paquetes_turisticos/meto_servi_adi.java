//Metodo1: Varios métodos de tabla CLIENTE
package venta_paquetes_turisticos;


import java.sql.*;
import javax.swing.JOptionPane;

public class meto_servi_adi {
    
Connection db = null;
Statement st = null;
ResultSet rs = null;
PreparedStatement pst=null;

String cedu,nom;
Integer id_cli;
Integer id_servia;
Float seguro_v, seguro_a;
String sql;
Boolean a;

//Conexion base datos    
public void conecciondb() {
  try {
      db=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ventas_paquetes_turisticos_et","postgres","winter2021"); 
          //Acualize ruta .../basedatos,usuario,contraseña
      } catch (SQLException e) {System.out.println("Ocurrio un error : "+e.getMessage());} }


public void inserta_servicioadi() throws SQLException {
if (a==false) { conecciondb();
 id_servia=Integer.valueOf(servicios_adicionales.a5.getText());
 nom=servicios_adicionales.a6.getText();
 seguro_v =Float.valueOf(servicios_adicionales.a7.getText());
 seguro_a =Float.valueOf(servicios_adicionales.a8.getText());
 sql = "insert into servicios_adicionales (id_sa,nombre_s,seguro_vida,seguro_accidentes) values (?,?,?,?)";
 pst = db.prepareStatement(sql);
 pst.setInt(1,id_servia);
 pst.setString(2,nom);
 pst.setFloat(3,seguro_v);
 pst.setFloat(4,seguro_a);
 pst.executeUpdate();  
 JOptionPane.showMessageDialog(null,"Se Guardo..."); } }


//Actualiza tabla servicios adicionales
public void actualiza_servicioadi() throws SQLException {
if (a==true) { conecciondb();
 nom=servicios_adicionales.a6.getText();
 seguro_v=Float.valueOf(servicios_adicionales.a7.getText());
 seguro_a=Float.valueOf(servicios_adicionales.a8.getText());
 sql = "update servicios_adicionales set nombre_s=?,seguro_vida=?,seguro_accidentes=? where id_sa='"+id_servia+"'";
 pst = db.prepareStatement(sql);
 pst.setString(1,nom);pst.setFloat(2,seguro_v);
 pst.setFloat(3,seguro_a);
 pst.executeUpdate();
 JOptionPane.showMessageDialog(null,"Se Actualizo..."); } }

//Consulta tabla servicios adicionales si existe el id_serviciosadicionales
public void consulta_servicioadi() throws SQLException {
 conecciondb(); st = db.createStatement();id_servia=Integer.valueOf(servicios_adicionales.a5.getText());
 rs = st.executeQuery("select * from servicios_adicionales where id_sa='"+id_servia+"'");
 if (rs.next()) {a=true;
  servicios_adicionales.a6.setText(rs.getString(2));
  servicios_adicionales.a7.setText(rs.getString(3));
  servicios_adicionales.a8.setText(rs.getString(4));
 }
 else {JOptionPane.showMessageDialog(null,"No Existe...");a=false;} }

//Elimina tabla cliente si existe cedula y no está en otra tabla relacionada
public void elimina_servicioadi() throws SQLException {
 try {
 if (a==true) { conecciondb();
 int resp = JOptionPane.showConfirmDialog(null, "Lo elimina","ALERTA",JOptionPane.YES_NO_OPTION);
 if (resp!=1) {st.execute("delete from servicios_adicionales  where id_sa='"+id_servia+"'");
   JOptionPane.showMessageDialog(null,"SE ELIMINO, ya que no tiene relación tabla"); } } 
    }
 catch (SQLException e) {JOptionPane.showMessageDialog(null,"No se puede eliminar, tiene relación tabla");} }
 
//Limpiar datos entrada de cliente
public void limpia() {
servicios_adicionales.a5.setText("");servicios_adicionales.a6.setText("");
servicios_adicionales.a7.setText("");servicios_adicionales.a8.setText("");
}

}




