<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>

	<sql:query var ="rs" dataSource="jdbc/PlayerList">
		select twitter_id,stage_name, catch_phrase, mini_bio from Players
	</sql:query>
	

	
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

	<title>M&ouml;t&ouml;rcl&ouml;&uuml;d Bass Player Search</title>
	<link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css">
	<link rel="stylesheet" type="text/css" href="resources/demo.css">
    <link href="styles/styles.css" rel="stylesheet" type="text/css" />

	<style type="text/css" class="init">
	</style>
	<script type="text/javascript" src="media/js/jquery.js"></script>
	<script type="text/javascript" src="media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="resources/syntax/shCore.js"></script>
	<script type="text/javascript" src="resources/demo.js"></script>
	<script type="text/javascript" class="init">


$(document).ready(function() {
	$('#example').dataTable();
} );


	</script>
</head>

<body class="dt-example" background="images/bg_resultsPage.jpg" style="background-color:#000000; background-position:top center;">
	<div style="margin-top:15px;" align="center"><img src="images/logo.png" width="980" height="153"></div>
	<div class="container">
		<section>
			<div class="info">
			<div>
			  <h1 align="center"><strong>Bass Player Search official entry page</strong></h1>
			</div>
			<p align="center">Search, sort, or vote!!!!  Help us find our next bass player!  This is an interactive form that you can use to browse through your audience-mates to see who deserves to rock the cloud with Mack, Reggie, and Javier!</p>
		  </div>

			<table id="example" class="display" cellspacing="0" width="100%">
				<thead style="margin-top:10px;">
					<tr>
						<th>Twitter ID</th>
						<th>Stage Name</th>
						<th>Catch Phrase</th>
						<th>Mini Bio</th>
					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>Twitter ID</th>
						<th>Stage Name</th>
						<th>Catch Phrase</th>
						<th>Mini Bio</th>
					</tr>
				</tfoot>

				<tbody>


		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td>
					${row.twitter_id}<br/>
				</td>
				<td>
					${row.stage_name}<br/>
				</td>
		    	<td>
		    	 	${row.catch_phrase}<br/>
		    	</td>
		    	<td>
		    		${row.mini_bio}<br/>
				</td>
			</tr>
		</c:forEach>		



				</tbody>
			</table>
		</section>
</div>



</body>
</html>