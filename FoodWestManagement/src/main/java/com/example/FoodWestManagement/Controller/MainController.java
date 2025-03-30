package com.example.FoodWestManagement.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.FoodWestManagement.Dao.AdminDao;
import com.example.FoodWestManagement.Entity.AdminEntity;



@Controller
public class MainController {
	
	@Autowired
	AdminDao adminDao;
	
	@RequestMapping("/index")
	public String Index() {
		return "Index";
	}
	
	@RequestMapping("/AdminLogin")
	public String AdminLogin() {
		return "AdminLogin";
	}
	
	@RequestMapping("/AdminReg")
	public String AdminReg() {
		return "AdminReg";
	}
	
	@RequestMapping("/DonerLogin")
	public String DonerLogin() {
		return "DonerLogin";
	}
	
	@RequestMapping("/DonerReg")
	public String DonerReg() {
		return "DonerReg";
	}
	
	@RequestMapping("/PartnerLogin")
	public String PartnerLogin() {
		return "PartnerLogin";
	}
	
	@RequestMapping("/PartnerReg")
	public String PartnerReg() {
		return "PartnerReg";
	}
	
	
	

}
