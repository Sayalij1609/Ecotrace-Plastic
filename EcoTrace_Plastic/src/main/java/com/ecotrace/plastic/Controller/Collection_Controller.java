package com.ecotrace.plastic.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecotrace.plastic.Dao.CollectionDao;
import com.ecotrace.plastic.Dao.User_Dao;
import com.ecotrace.plastic.Model.Collection_Log;
import com.ecotrace.plastic.Model.Recycler;
import com.ecotrace.plastic.Model.User;

@Controller
public class Collection_Controller {

	ApplicationContext context = new ClassPathXmlApplicationContext("Config.xml");
	CollectionDao collectionDao = context.getBean("collectionDao", CollectionDao.class); // SubmitCollectionRequest
	Collection_Log col = context.getBean("col", Collection_Log.class);
	User_Dao userDao = context.getBean("userDao", User_Dao.class);
	User user = context.getBean("user", User.class);
	
	 // Process User Login Page 
	@RequestMapping(path = "/user_login", method = RequestMethod.POST)
	public String user_login(HttpServletRequest request) {
		long phone = Long.parseLong(request.getParameter("phone"));
		String password = request.getParameter("password");

	    // Check if this user exists in the DB
	   
	    
	    User user = userDao.getuser(phone);
	    
	    // Save user in session
	    request.getSession().setAttribute("user", user);
	    
	    if(user!=null && user.getUpassword().equals(password)){
	    	 return "user_dashboard";
	    }
        else {
	        
	        return "login";
	    }

	}
	
	@RequestMapping("/user_requestForm")
	public String showRequestForm(HttpSession session, Model model) {
	    // Get user from session (assuming you stored it during login)
	    
	    return "user_requestForm";
	}
	

		@RequestMapping(path = "/SubmitCollectionRequest", method = RequestMethod.POST)
		public String submit_collection(HttpServletRequest request) {
		    
		User user = (User) request.getSession().getAttribute("user");
		long uid = user.getUcontact();
		    
		    // Set the user contact as uid
		col.setUid(uid);
		
		col.setPhone(Long.parseLong(request.getParameter("Phone")));
		col.setRecyclerName(request.getParameter("recyclerName"));
		col.setPickupDate(request.getParameter("pickupDate"));
		col.setPickupTime(request.getParameter("pickupTime"));
		col.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		col.setMaterials(request.getParameter("materials1"));
		col.setAddress(request.getParameter("address"));
		col.setPickup_condition(request.getParameter("condition"));
		col.setInstructions(request.getParameter("instructions"));
		col.setStatus("Pending");

		int i = collectionDao.insert(col);

		return "user_ViewStatus";
	}

	// Show request
	@RequestMapping("/user_ViewStatus")
	public String viewall(Model m) {
		List<Collection_Log> cols = collectionDao.getAllcol();
		m.addAttribute("cols", cols);
		return "user_ViewStatus";

	}

	// Show request
	@RequestMapping("/recycler_viewCollection")
	public String view_all(Model m) {
		List<Collection_Log> cols = collectionDao.getAllcol();
		m.addAttribute("cols", cols);
		return "recycler_viewCollection";

	}
	
	// Show Admin_addRecycler
		@RequestMapping("/recycler_updateStatus")
		public String viewrequest(Model m) {
			List<Collection_Log> cols = collectionDao.getAllcol();
			m.addAttribute("cols", cols);
			return "recycler_updateStatus";

		}

		// Approve Recycler
		@RequestMapping(path = "/ApproveRequest", method = RequestMethod.POST)
		public String approveRequest(@RequestParam("uid") int uid, HttpServletRequest request) {
			int result = collectionDao.updateRequestStatus(uid, "Approved");
			return "redirect:/recycler_updateStatus"; // JSP reload
		}

		// Reject Recycler
		@RequestMapping(path = "/RejectRequest", method = RequestMethod.POST)
		public String rejectRequest(@RequestParam("uid") int uid, HttpServletRequest request) {
			int result = collectionDao.updateRequestStatus(uid, "Rejected");
			return "redirect:/recycler_updateStatus";
		}
		
		// Approve Recycler
				@RequestMapping(path = "/UpdateRequest", method = RequestMethod.POST)
				public String updateRequest(@RequestParam("uid") int uid, HttpServletRequest request) {
					
					int result = collectionDao.updateRequestStatus(uid, "Collected");
					return "redirect:/recycler_updateStatus"; // JSP reload}
				}
		
				@RequestMapping("/admin_ViewCollectionLogs")
				public String view_collection(Model m) {
					List<Collection_Log> cols = collectionDao.getAllcol();
					m.addAttribute("cols", cols);
					return "admin_ViewCollectionLogs";

				}

}
