package com.example.FoodWestManagement.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.FoodWestManagement.Entity.AdminEntity;

public interface AdminRepo extends JpaRepository<AdminEntity, Integer>
{

	public AdminEntity findByUsernameAndPassword(String username, String password);

	
}
