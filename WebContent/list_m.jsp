<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>


	<sql:query var ="rs" dataSource="jdbc/PlayerList">
		select stage_name, catch_phrase, mini_bio from Players
	</sql:query>
	

	
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
<style>
th
{
border-bottom: 1px solid #d6d6d6;
}
tr:nth-child(even)
{
background:#e9e9e9;
}

tr:nth-child(odd)
{
background:#ffffff;
}

 
</style>
</head>
<body>

<div data-role="page" style="background-color:#000000; background:url(images/bg.jpg); background-position:center top;">
  
  <div data-role="header" style="color:#000000; background:url(images/bg_header.jpg); background-position:center top;">
    <h3>Player Results!    </h3><a href="list_m.jsp" class="ui-btn ui-btn-inline">Refresh</a> 
  </div>
  
  <div data-role="main" class="ui-content">
    <table data-role="table"  class="ui-responsive ui-shadow" id="mytable">
      <thead>
        <tr> 
          <th width="133" data-priority="6"><strong>Stage Name </strong></th>
          <th width="291"><em>Catch Phrase </em></th>
          <th width="1070" data-priority="1">MiniBio</th>
        </tr>
      </thead>
      <tbody>
 
		<c:forEach var="row" items="${rs.rows}">

        <tr>
          <td><strong>${row.stage_name} </strong></td>
          <td><em>${row.catch_phrase} </em></td>
          <td><font size="2"> ${row.mini_bio}</font></td>
        </tr>
		
		</c:forEach>	

        
 


      </tbody>
    </table>
  </div>

</div>
</body>
</html>
