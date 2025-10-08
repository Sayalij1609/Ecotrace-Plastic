package com.ecotrace.plastic.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecotrace.plastic.Dao.User_Dao;
import com.ecotrace.plastic.Model.Recycler;
import com.ecotrace.plastic.Model.User;


@Controller
public class User_Controller {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("Config.xml");
	User_Dao userDao = context.getBean("userDao", User_Dao.class);
	User user = context.getBean("user", User.class);
	
    //Open Main page 
	@RequestMapping("/")
	public String welcome() {
		System.out.println("Opening index page..");
		return "login";
	}
 
	@RequestMapping("/login")
	public String loginopen() {
		System.out.println("Opening index page..");
		return "login";
	}


	// Open User Register page
		@RequestMapping("/user_register")
		public String userRegister() {
			System.out.println("Opening Account  page..");
			return "user_register";
		}
		
   
		
		// Process User Register Page 
		@RequestMapping(path = "/user_Register", method = RequestMethod.POST)
		public String user_Register(HttpServletRequest request) {

			user.setUcontact(Long.parseLong(request.getParameter("contact")));
			user.setUname(request.getParameter("name"));
			user.setUemail(request.getParameter("email"));
			user.setUpassword(request.getParameter("password"));
			user.setCity(request.getParameter("city"));
			user.setAddress(request.getParameter("address"));

			int i = userDao.insert(user);

			if (i > 0) {
				return "login";
			}

			else {
				return "login";
			}
			
	    }
		
		// Show Admin_addRecycler
		@RequestMapping("/admin_ViewUsers")
		public String viewall(Model m) {
			List<User> users = userDao.getAllusers();
			m.addAttribute("users", users);
			return "admin_ViewUsers";

		}
		
		@RequestMapping("/SubmitCollectionRequest")
		public String login_open() {
			System.out.println("Opening index page..");
			return "SubmitCollectionRequest";
		}
		
		// Show Admin_addRecycler
				@RequestMapping("/recycler_ViewUsers")
				public String view__all(Model m) {
					List<User> users = userDao.getAllusers();
					m.addAttribute("users", users);
					return "recycler_ViewUsers";

				}
				
				@RequestMapping(path = "/user_profile", method = RequestMethod.POST)
				public String updateProfile(HttpServletRequest request, Model model) {
				    // Get updated user data from form
				    long phone = Long.parseLong(request.getParameter("ucontact"));
				    User user = userDao.getuser(phone);
				    
				    // Update user object with new data
				    user.setUname(request.getParameter("uname"));
				    user.setUemail(request.getParameter("uemail"));
				    user.setCity(request.getParameter("city"));
				    user.setAddress(request.getParameter("address"));
				    
				    // Only update password if a new one was provided
				    String newPassword = request.getParameter("upassword");
				    if(newPassword != null && !newPassword.isEmpty()) {
				        user.setUpassword(newPassword);
				    }
				    
				    // Update user in database
				    userDao.updateuser(user);
				    
				    // Add updated user to model
				    model.addAttribute("user", user);
				    
				    return "userProfile";
				}
		
}
