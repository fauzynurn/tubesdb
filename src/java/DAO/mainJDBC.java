
package DAO;
import Model.JadwalKuliah;
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
public class mainJDBC {
   public List<JadwalKuliah> listJdw = new ArrayList<>();
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
    public void takeData(String name){
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT DISTINCT matkul.NAMA_MATKUL, jadwal_kuliah.TEORI_PRAKTEK, jadwal_kuliah.NAMA_KELAS FROM jadwal_kuliah,matkul WHERE jadwal_kuliah.KODE_MATKUL=matkul.KODE_MATKUL AND jadwal_kuliah.KODE_DOSEN=?");
            ps.setString(1, getCode(name));
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JadwalKuliah jdw = new JadwalKuliah();
                jdw.setNamaMatkul(rs.getString("NAMA_MATKUL"));
                if(rs.getInt("TEORI_PRAKTEK")==1){
                    jdw.setJenisMatkul("Teori");
                }else{
                    jdw.setJenisMatkul("Praktek");
                }
                jdw.setNamaKelas(rs.getString("NAMA_KELAS"));
                listJdw.add(jdw);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        }
    public String getName(String code){
        String name = "";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT NAMA_DOSEN FROM dosen WHERE KODE_DOSEN=?");
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                name = rs.getString("NAMA_DOSEN");
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return name;
    }
    public String getCode(String name){
        String code = "";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT KODE_DOSEN FROM dosen WHERE NAMA_DOSEN=?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                code = rs.getString("KODE_DOSEN");
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return code;
    }
}