package com.ecotrace.plastic.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Admin_Controller {
	
	//Process Admin Login
	@RequestMapping(path = "/admin_login", method = RequestMethod.POST)
	public String admin_login(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email.equals("admin@gmail.com") && password.equals("admin")) {

			return "admin_dashboard";
		}

		else {
			return "login";
		}

	}
	
	//Open Admin Dashboard
	
	@RequestMapping("/admin_dashboard")
	public String opendashboard() {
		System.out.println("Opening admin dashboard page..");
		return "admin_dashboard";
	}
	
	


}
