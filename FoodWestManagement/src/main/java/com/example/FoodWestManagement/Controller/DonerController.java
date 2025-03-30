package com.example.FoodWestManagement.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.FoodWestManagement.Dao.DonerDao;
import com.example.FoodWestManagement.Entity.DonerEntity;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;




@Controller
public class DonerController {
	
	@Autowired
	DonerDao donerDao;
	
	@RequestMapping("/DonerDashbord")
	public String DonerDashbord(@RequestParam int id,Model model) {
		DonerEntity donerEntity =  donerDao.findById(id);
		model.addAttribute("Doner_model",donerEntity);
		return "Doner/DonerDashbord";
	}
	
	@RequestMapping("/MyOrders")
	public String MyOrders(@RequestParam int id,Model model) {
		DonerEntity donerEntity =  donerDao.findById(id);
		model.addAttribute("Doner_model",donerEntity);
		return "Doner/MyOrders";
	}
	
	@RequestMapping("/PlacedRequest")
	public String PlacedRequest(@RequestParam int id,Model model) {
		DonerEntity donerEntity =  donerDao.findById(id);
		model.addAttribute("Doner_model",donerEntity);
		return "Doner/PlacedRequest";
	}
	
	@RequestMapping("/ReceiveConfirmation")
	public String ReciveConfirmation(@RequestParam int id,Model model) {
		DonerEntity donerEntity =  donerDao.findById(id);
		model.addAttribute("Doner_model",donerEntity);
		return "Doner/ReciveConfirmation";
	}
	
	@RequestMapping("/TrackOrderStatus")
	public String TrackOrderStatus(@RequestParam int id,Model model) {
		DonerEntity donerEntity =  donerDao.findById(id);
		model.addAttribute("Doner_model",donerEntity);
		return "Doner/TrackOrderStatus";
	}
	

	@PostMapping("/DonerDataSave")
	public String DonerDataSave(@ModelAttribute DonerEntity donerEntity,MultipartFile file1) throws IOException {
	donerDao.DonerDataSave(donerEntity,file1);
	return "DonerReg";
	}
	
	
	@GetMapping("/CheckDonerLogin")
	public String CheckDonerLogin(@RequestParam String username,@RequestParam String password,Model model) {
		DonerEntity donerEntity = donerDao.CheckDonerLogin(username,password);
		
		if (donerEntity != null) {
			model.addAttribute("Doner_model",donerEntity);
		   return "Doner/DonerDashbord";
	        }
		else {
			model.addAttribute("error", "Invalid Username And Password");
			return"DonerLogin";
		}
		}
	
	
	
	
}
