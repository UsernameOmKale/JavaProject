package com.example.FoodWestManagement.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.FoodWestManagement.Dao.FoodDao;
import com.example.FoodWestManagement.Entity.FoodEntity;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class FoodController {
	
	@Autowired
	FoodDao foodDao;
	
	
	
	@PostMapping("/SaveFoodData")
	public String SaveFoodData(@ModelAttribute FoodEntity foodEntity, MultipartFile file1) throws IOException {
	   foodDao.SaveFoodData(foodEntity,file1);
		
		return "Doner/PlacedRequest";
	}
	

	@GetMapping("/GetAll")
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	
}
