package com.ecotrace.plastic.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecotrace.plastic.Dao.Recycler_Dao;
import com.ecotrace.plastic.Model.Recycler;

@Controller
public class Recycler_Controller {

	ApplicationContext context = new ClassPathXmlApplicationContext("Config.xml");
	Recycler_Dao recyclerDao = context.getBean("recyclerDao", Recycler_Dao.class);
	Recycler recycler = context.getBean("recycler", Recycler.class);

	// Open Recycler Register Page
	@RequestMapping("/recycler_register")
	public String recyclerRegister() {
		System.out.println("Opening Account  page..");
		return "recycler_register";
	}

	// process recycler login
	@RequestMapping(path = "/recycler_login", method = RequestMethod.POST)
	public String recycler_login(HttpServletRequest request, Model model) {

		long phone = Long.parseLong(request.getParameter("phone"));
		String password = request.getParameter("password");

		Recycler recycler = recyclerDao.getrecycler(phone); // Get by phone
															// (Primary Key)

		if (recycler != null && recycler.getPassword().equals(password)) {
			return "recycler_dashboard"; // Success
		} else {
			model.addAttribute("error", "Invalid phone number or password");
			return "login"; // Failure
		}
	}

	// process recycler register
	@RequestMapping(path = "/recycler_Register", method = RequestMethod.POST)
	public String recycler_Register(HttpServletRequest request) {

		recycler.setPhone(Long.parseLong(request.getParameter("phone")));
		recycler.setName(request.getParameter("name"));
		recycler.setEmail(request.getParameter("email"));
		recycler.setBusiness_name(request.getParameter("business_name"));
		recycler.setReg_number(request.getParameter("reg_number"));
		recycler.setPassword(request.getParameter("password"));
		recycler.setCity(request.getParameter("city"));
		recycler.setAddress(request.getParameter("address"));
		recycler.setMaterials(request.getParameter("materials"));
		recycler.setService_area(request.getParameter("service_area"));
		recycler.setYears_in_business(Integer.parseInt(request.getParameter("years_in_business")));
		recycler.setStatus("pending");

		int i = recyclerDao.insert(recycler);

		if (i > 0) {
			return "login";
		}

		else {
			return "login";
		}

	}

	// Show Admin_addRecycler
	@RequestMapping("/admin_addRecyclers")
	public String viewall(Model m) {
		List<Recycler> recyclers = recyclerDao.getAllrecyclers();
		m.addAttribute("recyclers", recyclers);
		return "admin_addRecyclers";

	}

	// Approve Recycler
	@RequestMapping(path = "/ApproveRecycler", method = RequestMethod.POST)
	public String approveRecycler(@RequestParam("phone") long phone, HttpServletRequest request) {
		int result = recyclerDao.updateRecyclerStatus(phone, "approved");
		return "redirect:/admin_addRecyclers"; // JSP reload
	}

	// Reject Recycler
	@RequestMapping(path = "/RejectRecycler", method = RequestMethod.POST)
	public String rejectRecycler(@RequestParam("phone") long phone, HttpServletRequest request) {
		int result = recyclerDao.updateRecyclerStatus(phone, "rejected");
		return "redirect:/admin_addRecyclers";
	}
	
	// Display page with approved recyclers
	@RequestMapping("/admin_deleteRecycler")
	public String showDeleteRecyclersPage(Model model) {
	    List<Recycler> allRecyclers = recyclerDao.getAllrecyclers();

	    List<Recycler> approvedRecyclers = new ArrayList<Recycler>();
	    for (Recycler recycler : allRecyclers) {
	        if ("approved".equalsIgnoreCase(recycler.getStatus())) {
	            approvedRecyclers.add(recycler);
	        }
	    }

	    model.addAttribute("recyclers", approvedRecyclers);
	    return "admin_deleteRecycler";
	}
     
	
	// Handle delete request
	@RequestMapping(path = "/deleteRecycler", method = RequestMethod.POST)
	public String deleteRecycler(@RequestParam("phone") long phone) {
	    recyclerDao.deleterecycler(phone);
	    return "redirect:/admin_deleteRecycler";
	}
	
	// Display page with approved recyclers
		@RequestMapping("/admin_ViewApprovedRecycler")
		public String Show_Approvedrecycler(Model model) {
		    List<Recycler> allRecyclers = recyclerDao.getAllrecyclers();

		    List<Recycler> approvedRecyclers = new ArrayList<Recycler>();
		    for (Recycler recycler : allRecyclers) {
		        if ("approved".equalsIgnoreCase(recycler.getStatus())) {
		            approvedRecyclers.add(recycler);
		        }
		    }

		    model.addAttribute("recyclers", approvedRecyclers);
		    return "admin_ViewApprovedRecycler";
		}
		
		//Open user_View recycler  page 
				@RequestMapping("/user_ViewRecycler")
				public String open_user_submitCollection(Model model){
					
					 List<Recycler> allRecyclers = recyclerDao.getAllrecyclers();

					    List<Recycler> approvedRecyclers = new ArrayList<Recycler>();
					    for (Recycler recycler : allRecyclers) {
					        if ("approved".equalsIgnoreCase(recycler.getStatus())) {
					            approvedRecyclers.add(recycler);
					        }
					    }

					    model.addAttribute("recyclers", approvedRecyclers);
					    return "user_ViewRecycler";
					
				}
				
		
		
				

}
