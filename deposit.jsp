<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Internet Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>OInternet Banking System<span class="style1"></span></h1>
	<h1>For vino Bank Co.Ltd<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>
   
</div>

<div id="navigation">
    <ul>
    <li><a href="createacc.jsp">NEW ACCOUNT</a></li>
    <li><a href="balance1.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="logout.jsp">LOGOUT</a></li>
    </ul>
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		     <ul>
        	<li><a href="#">www.internetbanking.com</a></li>
            <li><a href="#">www.onlineservices.com </a></li>
            <li><a href="#">www.onlinemoneytransfer.com/forum.jsp</a></li>
            </ul>
			
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    	<% 
%>
<table><%
  boolean status=false;
String cno=request.getParameter("cno");
		int cno1=Integer.parseInt(cno);
     

     String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);

	    String ssn=(String)session.getAttribute("ssn");
		Connection con1=GetCon.getCon();
	   PreparedStatement ps1=con1.prepareStatement("Select *  from customer where userid='"+username+"' and password='"+password+"' and ssn='"+ssn+"'");
       ResultSet rs1=ps1.executeQuery();
		Connection con2=GetCon.getCon();
	   PreparedStatement ps2=con2.prepareStatement("Select *  from new_account where account_no="+accountno+"");
       ResultSet rs2=ps2.executeQuery();
		if(rs1.next()&&rs2.next()){
		status=true;
		}
		try {
		if(status==true){
			out.print("Welcome    " + username);
		
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEW_ACCOUNT where account_no=?");
			
            ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=accoun+rs.getInt(3); 
			
			}
			Connection con4=GetCon.getCon();
			
			PreparedStatement ps4=con4.prepareStatement("update NEW_ACCOUNT set NEW_DEPOSITS=? where account_no='"+accountno+"'");
			ps4.setInt(1,dataamount);
			ps4.executeUpdate();
			ResultSet rs4=ps4.executeQuery();
			
			Random r=new Random();
			int tid=r.nextInt(123456789);
			Connection con5=GetCon.getCon();
			PreparedStatement ps5=con5.prepareStatement("insert into transaction values(?)");
            ps5.setInt(1,tid);
			int status5=ps5.executeUpdate();
			System.out.println(status5);

			Connection con6=GetCon.getCon();
			PreparedStatement ps6=con6.prepareStatement("insert into deposit values(?,?,?,?)");
            ps6.setInt(1,cno1);
			ps6.setInt(2,accountno);
			ps6.setInt(3,accoun);
			ps6.setInt(4,tid);
			
			int status6=ps6.executeUpdate();
			System.out.println(status6);


			if(rs4.next()){
			out.print("YOUR BALANCE HAS INCREASED");
			request.setAttribute("totaldataamount",dataamount);
			request.setAttribute("balance","YOUR BALANCE HAS INCREASED");	


			%>
			<jsp:forward page="Totalbalance.jsp"></jsp:forward> 
			<% 
			}
			
					
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="deposit1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
			%></table><%
%>
    	
    	
		 </table>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>
  <%@ page import="java.util.*"%>





   
