package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;


import beans.Validations;

/**
 * Servlet implementation class servlet
 */
@WebServlet("/servlet")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String customername=request.getParameter("customername");
		String ssn=request.getParameter("ssn");
		String zipcode=request.getParameter("zipcode");
		String streetaddress=request.getParameter("streetaddress");
		streetaddress=streetaddress.replace(" ", "");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		Validations v=new Validations();
		List<String> list=new ArrayList<String>();
		Set<ConstraintViolation<Validations>> vl=v.validateZipandEmail(zipcode, address, v);
		for (ConstraintViolation<Validations> val : vl) {  
			if(val!=null) {
            list.add(val.getMessage());
            }
            
        }  
		String emailmessage = "";
		String zipcodemessage=null;
		for(int i=0;i<list.size();i++) {
			if(list.get(i).contains("Zip")) {
				zipcodemessage=list.get(i);
			}
			if(list.get(i).contains("length")) {
				emailmessage+=list.get(i);
			}
			if(list.get(i).contains("style")) {
				emailmessage+=list.get(i);
			}
		}
		
		
			Map<String,String> m=v.getLatitude(streetaddress);
//			System.out.println(m.get("lng"));
//			System.out.println(m.get("lat"));
//			System.out.println(streetaddress);
//			System.out.println(m.get("worryinfo"));
//		
	    request.getSession().setAttribute("lng",m.get("lng"));
	    request.getSession().setAttribute("lat",m.get("lat"));
	    request.getSession().setAttribute("mapworryinfo",m.get("worryinfo"));
		request.getSession().setAttribute("customername",customername);
		request.getSession().setAttribute("ssn",ssn);
		request.getSession().setAttribute("zipcode",zipcode);
		request.getSession().setAttribute("emailmessage",emailmessage);
		request.getSession().setAttribute("zipcodemessage",zipcodemessage);
		request.getSession().setAttribute("streetaddress",streetaddress);
		request.getSession().setAttribute("address",address);
		request.getSession().setAttribute("city",city);
		request.getSession().setAttribute("state",state);
		response.sendRedirect("/assignment2/ValidateFormDate.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
