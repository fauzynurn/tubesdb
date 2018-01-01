/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Time;

/**
 *
 * @author fauzy
 */
public class Subject {
    private String namaMatkul;
    private String namaDosen; 
    private String jenisMatkul;
    private Time jamMulai;
    private Time jamSelesai;
    private String ruangan;

    /**
     * @return the namaMatkul
     */
    public String getNamaMatkul() {
        return namaMatkul;
    }

    /**
     * @param namaMatkul the namaMatkul to set
     */
    public void setNamaMatkul(String namaMatkul) {
        this.namaMatkul = namaMatkul;
    }

    /**
     * @return the jamMulai
     */
    public Time getJamMulai() {
        return jamMulai;
    }

    /**
     * @param jamMulai the jamMulai to set
     */
    public void setJamMulai(Time jamMulai) {
        this.jamMulai = jamMulai;
    }

    /**
     * @return the jamSelesai
     */
    public Time getJamSelesai() {
        return jamSelesai;
    }

    /**
     * @param jamSelesai the jamSelesai to set
     */
    public void setJamSelesai(Time jamSelesai) {
        this.jamSelesai = jamSelesai;
    }

    /**
     * @return the sks
     */
    /**
     * @return the ruangan
     */
    public String getRuangan() {
        return ruangan;
    }

    /**
     * @param ruangan the ruangan to set
     */
    public void setRuangan(String ruangan) {
        this.ruangan = ruangan;
    }

    /**
     * @return the namaDosen
     */
    public String getNamaDosen() {
        return namaDosen;
    }

    /**
     * @param namaDosen the namaDosen to set
     */
    public void setNamaDosen(String namaDosen) {
        this.namaDosen = namaDosen;
    }

    /**
     * @return the jenisMatkul
     */
    public String getJenisMatkul() {
        return jenisMatkul;
    }

    /**
     * @param jenisMatkul the jenisMatkul to set
     */
    public void setJenisMatkul(String jenisMatkul) {
        this.jenisMatkul = jenisMatkul;
    }
    
}
