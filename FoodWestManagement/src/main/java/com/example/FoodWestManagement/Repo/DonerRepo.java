package com.example.FoodWestManagement.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.FoodWestManagement.Entity.DonerEntity;

public interface DonerRepo extends JpaRepository<DonerEntity, Integer>
{

	public DonerEntity findByUsernameAndPassword(String username, String password);

}
