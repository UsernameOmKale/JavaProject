package com.example.FoodWestManagement.Dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.FoodWestManagement.Entity.AdminEntity;
import com.example.FoodWestManagement.Repo.AdminRepo;

@Repository
public class AdminDao {
	
	@Autowired 
	AdminRepo adminRepo;

	public AdminEntity AdminSaveData(AdminEntity adminEntity) {
		return adminRepo.save(adminEntity);

		
	}

	public AdminEntity CheckLogin(String username, String password) {
		return adminRepo.findByUsernameAndPassword(username,password);
		
	}

	public AdminEntity UpdateAdminData(@RequestParam int id,AdminEntity adminEntity) {
	    // Assuming you have a repository or data source to fetch AdminEntity.
	    Optional<AdminEntity> existingAdmin = adminRepo.findById(adminEntity.getId());
	    
	    // Check if the AdminEntity with the given ID exists
	    if(existingAdmin.isPresent()) {
	        // AdminEntity exists, now we update it
	        AdminEntity adminToUpdate = existingAdmin.get();
	        
	        // Update the fields that you want
	        if (adminEntity.getName() != null) {
	            adminToUpdate.setName(adminEntity.getName());
	        }
	        if (adminEntity.getEmail() != null) {
	            adminToUpdate.setEmail(adminEntity.getEmail());
	        }
	        if (adminEntity.getMobileno() != null) {
	            adminToUpdate.setMobileno(adminEntity.getMobileno());
	        }
	        if (adminEntity.getAddress() != null) {
	            adminToUpdate.setAddress(adminEntity.getAddress());
	        }
	        if (adminEntity.getPhoto() != null) {
	            adminToUpdate.setPhoto(adminEntity.getPhoto());
	        }
	        
	        // Save the updated AdminEntity back to the repository or database
	        adminRepo.save(adminToUpdate);
	    } else {
	        // Handle case where AdminEntity doesn't exist
	        System.out.println("AdminEntity not found with ID: " + adminEntity.getId());
	    }
		return adminEntity;
	}


}
