<%-- 
    Document   : index
    Created on : Dec 29, 2017, 6:25:58 AM
    Author     : fauzy
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.mainJDBC"%>
<%@page import="Model.JadwalKuliah"%>
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
            mainJDBC me = new mainJDBC();
            String query = request.getParameter("q");
            me.takeData(query);
            String name = query;
            request.setAttribute("attriList",me.listJdw);
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
                    <div class="ui violet buttons" style="margin-left: 25px">
                        <div class="ui button">Lihat Daftar</div>
                        <div class="ui floating dropdown icon button">
                          <i class="dropdown icon"></i>
                          <div class="menu">
                            <div class="item">
                                <a href="http://localhost:8080/TubesDB/showAllLecturer.jsp" style="color: #000">
                                    Dosen</a></div>
                            <div class="item">Mata Kuliah</div>
                          </div>
                        </div>
                    </div>
                    <a href="http://www.google.com"
                    <button class="ui green button" style="margin-left: 25px">Lihat Jadwal</button>
                    </a>
                </div>
            </div>
            <p>Berikut adalah mata kuliah yang diampu oleh <%=name%></p>
            <table id="table" class="ui celled table">
                <thead>
                    <tr>
                        <th>Nama Mata Kuliah</th>
                        <th>Jenis Mata Kuliah</th>
                        <th>Kelas</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${attriList}" var="JadwalKuliah" varStatus="loop">
                        <tr>
                          <td>${JadwalKuliah.namaMatkul}</td>
                          <td>${JadwalKuliah.jenisMatkul}</td>
                          <td>${JadwalKuliah.namaKelas}</td>
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
            } );
        </script>
    </body>
</html>
