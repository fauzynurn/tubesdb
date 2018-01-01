<%-- 
    Document   : showAllLecturer
    Created on : Dec 30, 2017, 4:05:08 PM
    Author     : fauzy
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAODosen"%>
<%@page import="Model.Dosen"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Daftar Dosen  |  Rooster Web App</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/se/dt-1.10.16/fh-3.1.3/r-2.2.1/datatables.min.css"/>
        
    </head>
    <body>
        <%
            DAODosen daoDosen = new DAODosen();
            String query = request.getParameter("q");
            daoDosen.takeData();
            request.setAttribute("attriDosen",daoDosen.listDsn);
        %>
        <div class="ui container">
            <div class="ui menu">
                <div class="item">
                    <form action="http://localhost:8080/TubesDB/SearchResult.jsp" method="GET">
                        <div class="ui input">
                            <input type="text" placeholder="Cari Dosen" name="q">
                         </div>
                        <button type="submit" class="ui icon basic button">
                            <i class="search icon"></i>
                        </button>
                    </form>
                </div>
            </div>
            <p>Berikut adalah daftar dosen Jurusan Teknik Komputer dan Informatika Politeknik Negeri Bandung</p>
            <table id="table" class="ui celled table">
                <thead>
                    <tr>
                        <th>Kode Dosen</th>
                        <th>Nama Dosen</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${attriDosen}" var="Dosen" varStatus="loop">
                        <tr>
                          <td>${Dosen.kodeDosen}</td>
                          <td>${Dosen.namaDosen}</td>
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
