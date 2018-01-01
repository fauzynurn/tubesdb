<%-- 
    Document   : Home
    Created on : Dec 29, 2017, 6:25:58 AM
    Author     : fauzy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home  |  Rooster Web App</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/se/dt-1.10.16/fh-3.1.3/r-2.2.1/datatables.min.css"/>       
        <style>
            .centered {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-basis: 1;
                flex-flow: row;
                min-height: 30vh;
            }
            .align-center {
                text-align: center;
            }
        </style>
    </head>
    <body>
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
                    <a href="http://localhost:8080/TubesDB/showAllLecturer.jsp"
                    <button class="ui orange button" style="margin-left: 25px">Lihat Daftar Dosen</button>
                    </a>
                    <a href="http://localhost:8080/TubesDB/showAllSubjects.jsp"
                    <button class="ui green button" style="margin-left: 25px">Lihat Jadwal</button>
                    </a>
                </div>
            </div>
            <div class="centered">
                <div class="align-center">
                    <h1 class="ui header"><strong>Tugas Besar Basis Data</strong></h1>
                    <p class="ui medium header">Politeknik Negeri Bandung 2017</p>
                </div>
            </div>
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
