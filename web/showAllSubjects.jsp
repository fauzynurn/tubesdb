<%-- 
    Document   : showAllSubjects
    Created on : Dec 30, 2017, 5:37:18 PM
    Author     : fauzy
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOSubject"%>
<%@page import="Model.Subject"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result  |  Rooster Web App</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/se/dt-1.10.16/fh-3.1.3/r-2.2.1/datatables.min.css"/>
        
    </head>
    <body>
        <%
            DAOSubject me = new DAOSubject();
            String kelas = request.getParameter("kelas");
            String hari = request.getParameter("hari");
            System.out.printf("Kelas: %s dan hari: %s", kelas, hari);
            if("abc".equals(kelas) && !("def".equals(hari))){
                me.takeDataHari(hari);
            }
            if("def".equals(hari) && !("abc".equals(kelas))){
                me.takeDataKelas(kelas);
            }
            if(!("def".equals(hari)) && !("abc".equals(kelas))){
                me.takeDataKelasDanHari(kelas, hari);
            }
            
            request.setAttribute("attriSu",me.listSu);
        %>
        <div class="ui container">
            <div class="ui menu">
                <div class="item">
                    <form action="/TubesDB/SearchResult.jsp" method="GET">
                        <div class="ui input">
                            <input type="text" placeholder="Cari Dosen" name="q">
                         </div>
                        <button type="submit" class="ui icon basic button">
                            <i class="search icon"></i>
                        </button>
                    </form>
                    <a href="http://localhost:8080/TubesDB/showAllLecturer.jsp"
                    <button class="ui orange button" style="margin-left: 25px">Lihat Daftar Dosen</button>
                    </a>
                    <a href="http://localhost:8080/TubesDB/showAllSubjects.jsp"
                    <button class="ui green button" style="margin-left: 25px">Lihat Jadwal</button>
                    </a>
                </div>
            </div>
            <div style="margin-bottom: 30px">
                <p style="font-size: 20px"> Lihat jadwal mata kuliah berdasarkan kelas dan hari </p>
                <form action="/TubesDB/showAllSubjects.jsp" method="GET">
                    <select id="kelas" class="ui dropdown" name="kelas">
                        <option value="abc">Pilih Kelas</option>
                        <option value="1A">1A</option>
                        <option value="1B">1B</option>
                        <option value="2A">2A</option>
                        <option value="2B">2B</option>
                        <option value="3A">3A</option>
                        <option value="3B">3B</option>
                    </select>
                    <select id="hari" class="ui dropdown" name="hari">
                        <option value="def">Pilih Hari</option>
                        <option value="Senin">Senin</option>
                        <option value="Selasa">Selasa</option>
                        <option value="Rabu">Rabu</option>
                        <option value="Kamis">Kamis</option>
                        <option value="Jumat">Jumat</option>
                    </select>
                    <button type="submit" class="ui blue button" style="margin-left: 25px">Filter</button>
                </form>
            </div>
            <table id="table" class="ui celled table">
                <thead>
                    <tr>
                        <th>Nama Mata Kuliah</th>
                        <th>Jenis Mata Kuliah</th>
                        <th>Nama Dosen</th>
                        <th>Jam Mulai</th>
                        <th>Jam Selesai</th>
                        <th>Ruangan</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${attriSu}" var="Subject" varStatus="loop">
                        <tr>
                          <td>${Subject.namaMatkul}</td>
                          <td>${Subject.jenisMatkul}</td>
                          <td>${Subject.namaDosen}</td>
                          <td>${Subject.jamMulai}</td>
                          <td>${Subject.jamSelesai}</td>
                          <td>${Subject.ruangan}</td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
        </div>
        <!--<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.16/fh-3.1.3/r-2.2.1/datatables.min.js"></script>
        <script>
            $(document).ready( function () {
                $('#table').DataTable({
                    responsive: true,
                    fixedHeader: true
                });
                
                $('.dropdown').dropdown();
                
                if(getUrlParameter('kelas') !== undefined || getUrlParameter('kelas') !== null) {
                    $('#kelas').dropdown('set selected', getUrlParameter('kelas'));
                }
                if(getUrlParameter('hari') !== undefined || getUrlParameter('hari') !== null) {
                    $('#hari').dropdown('set selected', getUrlParameter('hari'));
                }
            } );
            
            let getUrlParameter = function getUrlParameter(sParam) {
                let sPageURL = decodeURIComponent(window.location.search.substring(1)),
                    sURLVariables = sPageURL.split('&'),
                    sParameterName,
                    i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return sParameterName[1] === undefined ? true : sParameterName[1];
                    }
                }
            };
        </script>
    </body>
</html>
