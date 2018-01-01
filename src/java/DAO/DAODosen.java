
package DAO;
import Model.Dosen;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author fauzy
 */
public class DAODosen {
   public List<Dosen> listDsn = new ArrayList<>();
   public static Connection getConnection() {
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");  
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesdb", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    public void takeData(){
        try{
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM dosen");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Dosen dsn = new Dosen();
            dsn.setKodeDosen(rs.getString("KODE_DOSEN"));
            dsn.setNamaDosen(rs.getString("NAMA_DOSEN"));
            listDsn.add(dsn);
        }
        }catch(Exception e){
            System.out.println(e);
        }
    }
}