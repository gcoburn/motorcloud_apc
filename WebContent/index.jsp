<%
String ua=request.getHeader("User-Agent").toLowerCase();
if(ua.matches("(?i).*((android|bb\\d+|meego).+mobile|avantgo|bada\\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\\.(browser|link)|vodafone|wap|windows ce|xda|xiino).*")||ua.substring(0,4).matches("(?i)1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\\-|your|zeto|zte\\-")) {
  response.sendRedirect("http://b.motorcloudmusic.com/index_m.jsp");
  return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Go</title>
<link href="styles/styles.css" rel="stylesheet" type="text/css" />


    <!-- Bootstrap core CSS -->
    <link href="./vscripts/bootstrap.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="./vscripts/docs.css" rel="stylesheet"/>

    <link href="./vscripts/github.min.css" rel="stylesheet"/>

    <link href="./vscripts/parsley.css" rel="stylesheet"/>
    <style>
      body {
        color: #111111;
      }
      .row {
        margin-top: 10px;
      }
      .code-block {
        margin-top: 20px;
      }
      .hidden {
        display: none;
      }
      .row h2 {
        color: #FF851B;
      }
      .row p {
        text-align: justify;
      }
      .first {
        padding-left: 15px;
        border-left: 2px solid #FF851B;
      }
      .second {
        padding-left: 15px;
        border-left: 2px solid #5bc0de;
      }
      .validate {
        margin-top: 10px;
      }
      h4 {
        margin-bottom: 10px;
      }
      .invalid-form-error-message {
        margin-top: 10px;
        padding: 5px;
      }
      .invalid-form-error-message.filled {
        border-left: 2px solid red;
      }
    </style>
    
    
    
</head>

<body background="images/form_BG.jpg" style="background-repeat:no-repeat; background-color:#000000; background-position:center top;">

<div id="container"><!--FORMS CONTAINER-->
   
<form id="myform"  action="enter" class="cssform" method="post">
      
	 	<!--FORM LEFT-->
		<div class="forms" id="left">
				<p>
				<label for="firstname">FIRST NAME: </label> 
				<input type="text" id="user" value="" name="firstname" maxlength="100" data-parsley-group="block1" data-parsley-trigger="change" required="" data-parsley-id="6293"/>
				</p>
				<p>
				<label for="lastname">LAST NAME: </label> 
				<input type="text" id="emailaddress" value="" name="lastname" maxlength="100" data-parsley-group="block1" data-parsley-trigger="change" required="" data-parsley-id="6293"/>
				</p>
        		<p>
				<label for="email">EMAIL: </label>
				<input type="email" id="emailaddress" value="" name="emailaddress" maxlength="100" data-parsley-group="block1" data-parsley-trigger="change" required="" data-parsley-id="8265"/>
				</p>
        		<p>
				<label for="twitterid">TWITTER ID:</label>
				<input type="text" id="emailaddress" value="" name="twitterid"  maxlength="100"/>
				</p>
        		<p>
				<label for="twitterid">SEND DOCS:</label>
				<input type="checkbox" id="contactMe" value="" name="contactMe"/>
				</p>

					
		  <div style="color:#ffffff; width:400px; margin-top:20px; text-align:center; font-family:Arial, Helvetica, sans-serif; margin: 33px 50px;"><strong>This is how we get a hold of you.</strong><br />
          		<br />We <strong>guarantee</strong> that your information <strong>will not</strong> be shared with any third party for any reason. Your information will <strong>only</strong> be used in relation to this demonstration.</div>
		</div><!--FORM LEFT END-->
		
    	
		
      	<div class="forms" id="right"><!--FORM RIGHT-->
		
        	<div id="myform" class="cssform">
          			<p>
					<label for="stagename" style="color:#FFFFFF; text-shadow: -1px -1px 1px #000000;">STAGE NAME:</label>
					<input type="text" id="user" value="" name="sname" maxlength="100" data-parsley-group="block1" data-parsley-trigger="change" required="" data-parsley-id="6293"/>
					</p>
          			<p>
					<label for="catchphrase" style="color:#FFFFFF; text-shadow: -1px -1px 1px #000000;">CATCH PHRASE:</label>
          			<input type="text" id="emailaddress" value="" name="cphrase" maxlength="100" data-parsley-group="block1" data-parsley-trigger="change" required="" data-parsley-id="6293"/>
					</p>
					<p>
					<label for="minibio" style="color:#FFFFFF; text-shadow: -1px -1px 1px #000000;">MINI BIO:</label> 
        	  		<textarea id="comments" rows="5" cols="25" name="minibio" maxlength="500" data-parsley-group="block1" data-parsley-trigger="keyup" required=""  data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! If you wanna rock the cloud with us you gotta give us more than 10 characters!!!" data-parsley-validation-threshold="10" data-parsley-id="2026"></textarea></p>

					
				 <div style="color:#ffffff; width:400px; margin-top:20px; text-align:left; font-family:Arial, Helvetica, sans-serif; margin: 35px 0 33px;">
					<strong>This is how you could win. :)</strong></div>
			
				
				
				<div style="color:#ffffff; width:450px; margin-top:20px; text-align:left; font-family:Arial, Helvetica, sans-serif; margin: 50px 0 33px;"><input type="submit" class="btn btn-default validate" id="submitbutton" value="Submit" /></div>
					

      	</div>
			
		</div><!--FORM RIGHT-->
		
		</form>

</div><!--FORMS CONTAINER END-->

<p style="margin-bottom:200px;">&nbsp;</p>



    <script type="text/javascript" src="./vscripts/jquery.min.js"></script>
    <script type="text/javascript" src="./vscripts/affix.js"></script>
    <script type="text/javascript" src="./vscripts/highlight.min.js"></script>

    <script type="text/javascript" src="./vscripts/parsley.js"></script>
    <script type="text/javascript">

      $(document).ready(function () {
        $('#myform').parsley().subscribe('parsley:form:validate', function (formInstance) {
          if (formInstance.isValid('block1', true) || formInstance.isValid('block2', true)) {
            $('.invalid-form-error-message').html('');
            return;
          }

          formInstance.submitEvent.preventDefault();
          $('.invalid-form-error-message')
            .html("All fields required.")
            .addClass("filled");
          return;
        });
      });


    </script>
  
  
  
  
  
</body>
</html>
