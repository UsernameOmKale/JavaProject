package com.example.FoodWestManagement.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.FoodWestManagement.Dao.AdminDao;
import com.example.FoodWestManagement.Entity.AdminEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;





@Controller
public class AdminController {
	
	@Autowired
	AdminDao adminDao;
	
	@RequestMapping("/AdminDashbord")
	public String AdminDashbord() {
		return "Admin/AdminDashbord";
	}
	
	@RequestMapping("/DonerList")
	public String DonerList() {
		return "Admin/DonerList";
	}
	
	@RequestMapping("/FoodRequest")
	public String FoodRequest() {
		return "Admin/FoodRequest";
	}
	
	@RequestMapping("/PartnerList")
	public String PartnerList() {
		return "Admin/PartnerList";
	}
	
	@RequestMapping("/RequestApprove")
	public String RequestApprove() {
		return "Admin/RequestApprove";
	}

	
	
	@PostMapping("/AdminSaveData")
	public String AdminSaveData(@ModelAttribute  AdminEntity adminEntity,Model model) {
	adminDao.AdminSaveData(adminEntity);	
	return "AdminReg";
	}
	
	
	@GetMapping("/CheckLogin")
	public String CheckLogin(@RequestParam String username, @RequestParam String password, Model model) {
	    AdminEntity admin = adminDao.CheckLogin(username, password);

		    if (admin != null) {
		       model.addAttribute("Admin_model",admin);
		        return "Admin/AdminDashbord"; // Redirect or show the Admin Dashboard page
		        //views/Admin/AdminDashboard.jsp
		    } else {
		        model.addAttribute("error", "Invalid username or password");
		        return "AdminLogin"; // Redirect back to the login page with error message
	    }
	}
	
	
	
	/*
	 * @PostMapping("/UpdateAdminData") public String
	 * UpdateAdminData(@ModelAttribute AdminEntity adminEntity, @RequestParam int
	 * id,Model model) { AdminEntity adminEntity2 =
	 * adminDao.UpdateAdminData(id,adminEntity); model.addAttribute("Admin_model",
	 * adminEntity2); model.addAttribute("updatesuc",
	 * "Your Data has been Updated Successfully..!!"); return "Admin/AdminProfile";
	 * }
	 */
	
	
}
