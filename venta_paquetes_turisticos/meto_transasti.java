//Metodo1: Varios métodos de tabla CLIENTE
package venta_paquetes_turisticos;


import java.sql.*;
import javax.swing.JOptionPane;

public class meto_transasti {
    
Connection db = null;
Statement st = null;
ResultSet rs = null;
PreparedStatement pst=null;

Integer id_s,id_cli,b_v,m_v,t_v;
String inci;
Date fech;
String sql;
Boolean a;

//Conexion base datos    
public void conecciondb() {
  try {
      db=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ventas_paquetes_turisticos_et","postgres","winter2021"); 
          //Acualize ruta .../basedatos,usuario,contraseña
      } catch (SQLException e) {System.out.println("Ocurrio un error : "+e.getMessage());}
}



//Consulta tabla sastifaccion si existe cedula
public void consulta_cliente() throws SQLException {
conecciondb(); st = db.createStatement();id_s=Integer.valueOf(sastifaccion.a5.getText());
 rs = st.executeQuery("select * from  sastifaccion where id_sastifacion='"+id_s+"'");
 if (rs.next()) {a=true;
  sastifaccion.a6.setText(rs.getString(2));
  sastifaccion.a7.setText(rs.getString(3));
  sastifaccion.a8.setText(rs.getString(4));
  sastifaccion.a9.setText(rs.getString(5));
  sastifaccion.a10.setText(rs.getString(6));
  sastifaccion.a11.setText(rs.getString(7));
 }
 else {JOptionPane.showMessageDialog(null,"No Existe Transacción...");a=false;} }

//Limpiar datos entrada de sastifaccion
public void limpia() {
sastifaccion.a5.setText("");sastifaccion.a6.setText("");
sastifaccion.a7.setText("");sastifaccion.a8.setText("");
sastifaccion.a9.setText("");sastifaccion.a10.setText("");
sastifaccion.a11.setText("");
}

public void transacciones_commit_rollback() throws SQLException {
 try {
      if (a==false) { 
      conecciondb();
  id_s =Integer.valueOf(sastifaccion.a5.getText());
  id_cli=Integer.valueOf(sastifaccion.a6.getText());
  fech=Date.valueOf(sastifaccion.a7.getText()); 
  inci=sastifaccion.a8.getText();
  b_v=Integer.valueOf(sastifaccion.a9.getText());
  m_v=Integer.valueOf(sastifaccion.a10.getText());
  t_v=Integer.valueOf(sastifaccion.a11.getText());
  sql = "insert into sastifaccion (id_sastifacion,id_cliente,fecha_incidentes,incidentes_s,buenas_visitas,malas_visitas,total_visitas) values (?,?,?,?,?,?,?)";
  pst = db.prepareStatement(sql);
  pst.setInt(1,id_s);pst.setInt(2,id_cli);pst.setDate(3,fech);
  pst.setString(4,inci); pst.setInt(5,b_v);pst.setInt(6,m_v);
  pst.setInt(7,t_v); rs.next();
  pst.executeUpdate();
  //LLAMAR AL PROCEDIMIENTO ALMACENADO
  CallableStatement cst = db.prepareCall("call prosastifaccion()");
  cst.execute();
  PreparedStatement pstnt = db.prepareStatement("select max(id_sastifacion) from sastifaccion where total_visitas is null ");
  rs=pstnt.executeQuery();
  rs.close();
  JOptionPane.showMessageDialog(null,"SE REALIZÓ LA TRANSACCIÓN CON EXITO, SE REALIZÓ EL COMMIT");}
 }catch (SQLException e) {JOptionPane.showMessageDialog(null,"NO SE REALIZÓ LA TRANSACCIÓN,SE EJECUTA EL ROLLBACK");}}
}
