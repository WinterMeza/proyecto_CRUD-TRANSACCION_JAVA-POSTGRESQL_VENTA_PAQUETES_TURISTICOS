package venta_paquetes_turisticos;


import java.sql.*;
import javax.swing.JOptionPane;

public class meto_cliente {
    
Connection db = null;
Statement st = null;
ResultSet rs = null;
PreparedStatement pst=null;

String cedu,nom,correo,tele,tipousu;
Integer id_cli;
String sql;
Boolean a;

//Conexion base datos    
public void conecciondb() {
  try {
      db=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ventas_paquetes_turisticos_et","postgres","winter2021"); 
          //Acualize ruta .../basedatos,usuario,contraseña
      } catch (SQLException e) {System.out.println("Ocurrio un error : "+e.getMessage());} }


public void inserta_cliente() throws SQLException {
if (a==false) { conecciondb();
 id_cli=Integer.valueOf(cliente.a5.getText());nom=cliente.a6.getText();
 cedu=cliente.a7.getText();tele=cliente.a8.getText();
 correo=cliente.a9.getText();tipousu=cliente.a10.getText();
 sql = "insert into cliente (id_cliente,nombre_c,cedula_c,nume_tele_c,correo_c,tipo_usuario) values (?,?,?,?,?,?)";
 pst = db.prepareStatement(sql);
 pst.setInt(1,id_cli);
 pst.setString(2,nom);
 pst.setString(3,cedu);
 pst.setString(4,tele);
 pst.setString(5,correo);
 pst.setString(6,tipousu);
 pst.executeUpdate();  
 JOptionPane.showMessageDialog(null,"Se Guardo..."); } }


//Actualiza tabla cliente
public void actuali_cliente() throws SQLException {
if (a==true) { conecciondb();
 nom=cliente.a6.getText();cedu=cliente.a7.getText();tele=cliente.a8.getText();
 correo=cliente.a9.getText();tipousu=cliente.a10.getText();
 sql = "update cliente set nombre_c=?, cedula_c=?,nume_tele_c=?,correo_c=?,tipo_usuario=? where id_cliente='"+id_cli+"'";
 pst = db.prepareStatement(sql);
 pst.setString(1,nom);pst.setString(2,cedu);
 pst.setString(3,tele);pst.setString(4,correo);
 pst.setString(5,tipousu);
 pst.executeUpdate();
 JOptionPane.showMessageDialog(null,"Se Actualizo..."); } }

//Consulta tabla cliente si existe cedula
public void consulta_cliente() throws SQLException {
 conecciondb(); st = db.createStatement();id_cli=Integer.valueOf(cliente.a5.getText());
 rs = st.executeQuery("select * from cliente where id_cliente='"+id_cli+"'");
 if (rs.next()) {a=true;
  cliente.a6.setText(rs.getString(2));
  cliente.a7.setText(rs.getString(3));
  cliente.a8.setText(rs.getString(4));
  cliente.a9.setText(rs.getString(5));
  cliente.a10.setText(rs.getString(6));
 }
 else {JOptionPane.showMessageDialog(null,"No Existe...");a=false;} }

//Elimina tabla cliente si existe cedula y no está en otra tabla relacionada
public void elimina_cliente() throws SQLException {
 try {
 if (a==true) { conecciondb();
 int resp = JOptionPane.showConfirmDialog(null, "Lo elimina","ALERTA",JOptionPane.YES_NO_OPTION);
 if (resp!=1) {st.execute("delete from cliente where id_cliente='"+id_cli+"'");
   JOptionPane.showMessageDialog(null,"SE ELIMINO, ya que no tiene relación tabla"); } } 
    }
 catch (SQLException e) {JOptionPane.showMessageDialog(null,"No se puede eliminar, tiene relación tabla");} }
 
//Limpiar datos entrada de cliente
public void limpia() {
cliente.a5.setText("");cliente.a6.setText("");
cliente.a7.setText("");cliente.a8.setText("");
cliente.a9.setText("");cliente.a10.setText("");}

}




