package g;
import java.sql.*;

import g.GetCon;
import g.SessionIdentifierGenerator;
public class RegisterUser1 {
static int status=0;

//int accountno=1;
public static int register(String username,String password,String ctype,String name,int age,String add,int phone, String mail){
	
	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		
		ps = con.prepareStatement("Insert into customer values(?,?,?,?,?,?,?,?,?)");
		String	nextvalue1=SessionIdentifierGenerator.genNextValue();
		ps.setString(1,username);
		ps.setString(2,password);
		ps.setString(3,ctype);
		ps.setString(4,name);
		ps.setString(5,nextvalue1);
		ps.setInt(6,age);
		ps.setString(7,add);
		ps.setInt(8,phone);
		ps.setString(9,mail);
		
		status=ps.executeUpdate();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return status;
	
}
}
