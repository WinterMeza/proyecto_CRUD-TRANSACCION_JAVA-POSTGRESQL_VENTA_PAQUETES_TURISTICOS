//Metodo1: Varios métodos de tabla CLIENTE
package venta_paquetes_turisticos;


import java.sql.*;
import javax.swing.JOptionPane;

public class meto_tranpt {
    
Connection db = null;
Statement st = null;
ResultSet rs = null;
PreparedStatement pst=null;

String tipo_p;
Integer id_vpt,id_e,id_c,id_ci,id_cli,id_a,can;
Float pre,total;
String sql;
Boolean a;

//Conexion base datos    
public void conecciondb() {
  try {
      db=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ventas_paquetes_turisticos_et","postgres","winter2021"); 
          //Acualize ruta .../basedatos,usuario,contraseña
      } catch (SQLException e) {System.out.println("Ocurrio un error : "+e.getMessage());}
}



//Consulta tabla paquetes_turisticos si existe cedula
public void consulta_cliente() throws SQLException {
conecciondb(); st = db.createStatement();id_vpt=Integer.valueOf(paquetes_turisticos.a5.getText());
 rs = st.executeQuery("select * from  paquete_turistico where id_pt='"+id_vpt+"'");
 if (rs.next()) {a=true;
  paquetes_turisticos.a6.setText(rs.getString(2));
  paquetes_turisticos.a7.setText(rs.getString(3));
  paquetes_turisticos.a8.setText(rs.getString(4));
  paquetes_turisticos.a9.setText(rs.getString(5));
  paquetes_turisticos.a10.setText(rs.getString(6));
  paquetes_turisticos.a11.setText(rs.getString(7));
  paquetes_turisticos.a12.setText(rs.getString(8));
  paquetes_turisticos.a13.setText(rs.getString(9));
  paquetes_turisticos.a14.setText(rs.getString(10));
 }
 else {JOptionPane.showMessageDialog(null,"No Existe Transacción...");a=false;} }

 
//Limpiar datos entrada de paquetes_turisticos
public void limpia() {
paquetes_turisticos.a5.setText("");paquetes_turisticos.a6.setText("");
paquetes_turisticos.a7.setText("");paquetes_turisticos.a8.setText("");
paquetes_turisticos.a9.setText("");paquetes_turisticos.a10.setText("");
paquetes_turisticos.a11.setText("");paquetes_turisticos.a12.setText("");
paquetes_turisticos.a13.setText("");paquetes_turisticos.a14.setText("");
}

public void transacciones_commit_rollback() throws SQLException {
  try {
      if (a==false) { 
      conecciondb();
  id_vpt=Integer.valueOf(paquetes_turisticos.a5.getText());
  id_e=Integer.valueOf(paquetes_turisticos.a6.getText());
  id_c=Integer.valueOf(paquetes_turisticos.a7.getText());
  id_ci=Integer.valueOf(paquetes_turisticos.a8.getText());
  id_cli=Integer.valueOf(paquetes_turisticos.a9.getText());
  id_a=Integer.valueOf(paquetes_turisticos.a10.getText());
  tipo_p=paquetes_turisticos.a11.getText();
  can=Integer.valueOf(paquetes_turisticos.a12.getText());
  pre =Float.valueOf(paquetes_turisticos.a13.getText());
  total =Float.valueOf(paquetes_turisticos.a14.getText());
  sql = "insert into paquete_turistico (id_pt,id_empresa_pa,id_convenios,id_ciudad,id_cliente,id_agente,tipo_pt,cantidad_pt,precio_pt,total_pt) values (?,?,?,?,?,?,?,?,?,?)";
  pst = db.prepareStatement(sql);
  pst.setInt(1,id_vpt);pst.setInt(2,id_e);pst.setInt(3,id_c);
  pst.setInt(4,id_ci);pst.setInt(5,id_cli);pst.setInt(6,id_a);
  pst.setString(7,tipo_p); pst.setInt(8,can); pst.setFloat(9,pre);
  pst.setFloat(10,total);rs.next();
  pst.executeUpdate();
 //LLAMAR AL PROCEDIMIENTO ALMACENADO
  CallableStatement cst = db.prepareCall("call propaquetes()");
  cst.execute();
  PreparedStatement pstnt = db.prepareStatement("select max(id_pt) from paquete_turistico where total_pt is null ");
  rs=pstnt.executeQuery();
  rs.close();
  JOptionPane.showMessageDialog(null,"SE TRANFERIO CON EXITO, SE REALIZÓ EL COMMIT");}
  }catch (SQLException e) {JOptionPane.showMessageDialog(null,"NO SE PUEDE REALIZAR TRANSACION, SE ACTIVO EL ROLLBACK");}
}
}
