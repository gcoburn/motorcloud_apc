<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
<title>The Official Motorcloud Bass Player Search</title>

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
  <h1><font color="#000000">Enter to win! </font></h1>
  </div>
  <div data-role="main" class="ui-content">
<form id="myform"  action="/entermobile" class="cssform" method="post">
	 <font color="#c32330"> ${message}</font>
      <div class="ui-field-contain">
	
        <input type="text" name="firstname" id="fname" maxlength="100"  placeholder="First Name">
      
        <input type="text" name="lastname" id="lname" maxlength="100"  placeholder="Last Name">
	
        <input type="text" name="emailaddress" id="email" maxlength="100"  placeholder="Email">
	
        <input type="text" name="twitterid" id="twitterid" maxlength="100"  placeholder="Twitter ID">
		
		<label for="sdocs">Send Docs</label><input type="checkbox" name="contactMe" id="sdocs" value=""> 
		
		<input type="text" name="sname" id="sname" maxlength="100"  placeholder="Stage Name">
		
		<input type="text" name="cphrase" id="cphrase" maxlength="100"  placeholder="Catch Phrase">
		
        <textarea name="minibio" id="mbio" maxlength="500" placeholder="Mini Bio"></textarea>
     
		
      </div>
	  
      <div align="center">
        <input type="submit" value="Submit">
        </div>
    </form>
  </div>
</div>

</body>
</html>
