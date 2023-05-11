package g;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.Naming;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CreateServlet1 extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 HttpSession session = request.getSession(true);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String  ctype=request.getParameter("ctype");
		String  name=request.getParameter("name");
		String  age=request.getParameter("age");
		String  add=request.getParameter("add");
		String  phone=request.getParameter("phone");
		String  mail=request.getParameter("mail");
		
		int age1=Integer.parseInt(age);
		int phone1=Integer.parseInt(phone);
		
		
	    int status=RegisterUser1.register(username, password, ctype, name, age1,add,phone1,mail);
	   
	    
		if(status>0){
			out.print("WELCOME! YOUR ARE SUCCEFULLY REGISTERED");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
			if (session.isNew()){
              
              session.setAttribute(name, name);
           } 
		}
		else{
			out.print("Sorry,Registration failed. please try later");
			RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
			rd.include(request, response);
		}
		
	out.close();	
	}

}
