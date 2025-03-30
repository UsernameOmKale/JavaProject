package com.example.FoodWestManagement.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.FoodWestManagement.Entity.FoodEntity;

public interface FoodRepo extends JpaRepository<FoodEntity, Integer> 
{

}
