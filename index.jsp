<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.test.CaptchaImage"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Captcha</title>
</head>
<body>

<%
 String result = "Invalid Entry.... :(";
 String color = "red";
    if(request.getParameter("captcha") != null && session.getAttribute("captchaStr") != null){
  if(session.getAttribute("captchaStr").equals(request.getParameter("captcha"))){
   result = "Valid Entry.... :)";
   color = "green";
  }
 }

 CaptchaImage obj = new CaptchaImage();
 BufferedImage ima = obj.getCaptchaImage();
 File outputfile = new File("c://image.jpg");
 ImageIO.write(ima, "jpg", outputfile);
 String captchaStr = obj.getCaptchaString();
 
 session.setAttribute("captchaStr", captchaStr);

%>


<form action="index.jsp" method="post">
 <table>
  <tr>
   <td><img alt="Captcha" src="c://image.jpg"/> </td>
  </tr>
  <tr>
   <td> <input type="text" value="" name="captcha"> </td>
  </tr>
  <tr>
   <td> <input type="submit" value="Submit"> </td>
  </tr>
  <tr>
   <td> <font color="<%=color%>">Value : <%= result %></font></td>
  </tr>
 </table>
</form>

</body>
</html>