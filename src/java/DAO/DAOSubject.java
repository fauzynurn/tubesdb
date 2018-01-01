
package DAO;
import Model.Subject;
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
public class DAOSubject {
   public List<Subject> listSu = new ArrayList<>();
   public static Connection getConnection() {
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");  
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesdb", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }
    public void takeDataKelas(String kelas){
        try{
            Connection con = getConnection();
            PreparedStatement ps = null;
                ps = con.prepareStatement("SELECT * FROM jadwal_kelas_hari WHERE nama_kelas=?");
                ps.setString(1, kelas);
            executeData(ps);
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    public void takeDataHari(String hari){
        try{
            Connection con = getConnection();
            PreparedStatement ps = null;
                ps = con.prepareStatement("SELECT * FROM jadwal_kelas_hari WHERE hari=?");
                ps.setString(1, hari);
            executeData(ps);
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    public void takeDataKelasDanHari(String kelas, String hari){
        try{
            Connection con = getConnection();
            PreparedStatement ps = null;
                ps = con.prepareStatement("SELECT * FROM jadwal_kelas_hari WHERE nama_kelas=? AND hari=?");
                ps.setString(1, kelas);
                ps.setString(2, hari);
            executeData(ps);
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    private void executeData(PreparedStatement ps) {
        try {
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Subject su = new Subject();
                su.setNamaMatkul(rs.getString("NAMA_MATKUL"));
                if(rs.getInt("TEORI_PRAKTEK")==1){
                    su.setJenisMatkul("Teori");
                }else{
                    su.setJenisMatkul("Praktek");
                }
                su.setNamaDosen(rs.getString("NAMA_DOSEN"));
                su.setJamMulai(rs.getTime("WAKTU_MULAI"));
                su.setJamSelesai(rs.getTime("WAKTU_SELESAI"));
                su.setRuangan(rs.getString("NAMA_RUANGAN"));
                listSu.add(su);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}