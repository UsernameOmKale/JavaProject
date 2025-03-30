package com.example.FoodWestManagement.Dao;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.example.FoodWestManagement.Entity.FoodEntity;
import com.example.FoodWestManagement.Repo.FoodRepo;

@Repository
public class FoodDao {
	
	@Autowired
	FoodRepo foodRepo;

	public FoodEntity SaveFoodData(FoodEntity foodEntity, MultipartFile file1) throws IOException {

	    // Define the upload directory with an absolute path (on the server)
	    String uploadDir = System.getProperty("user.dir") + "/uploads/FoodPicture/";

	    // Create the directory if it doesn't exist
	    Path path = Paths.get(uploadDir);
	    createDirectoriesIfNotExists(path);

	    // Check if the file is not empty
	    if (file1 != null && !file1.isEmpty()) {
	        // Save the file and set the path in the entity
	        foodEntity.setPhoto(saveFile(file1, path));  // Assuming 'setPhoto' saves the path in the entity
	    } else {
	        // Handle the case when no file is uploaded (optional)
	        System.out.println("No file received!");
	    }

	    // Save the foodEntity to the database
	    return foodRepo.save(foodEntity);
	}
	
	
	private String saveFile(MultipartFile file1, Path path) throws IOException {
		String fileName = file1.getOriginalFilename();
		String sanitizedFileName = fileName != null ? fileName.replaceAll("\\s+", "_") : "default_filename";

		// Resolve the file path
		Path filePath = path.resolve(sanitizedFileName);

		// Write the file to the directory
		Files.write(filePath, file1.getBytes());

		// Return the relative path of the file
		return "/uploads/profilePicture/" + sanitizedFileName;
	}

	private void createDirectoriesIfNotExists(Path path) throws IOException {
	    // Check if the directory exists; if not, create it
	    if (!Files.exists(path)) {
	        try {
	            Files.createDirectories(path);  // This will create the directory if it doesn't exist
	            System.out.println("Directory created: " + path.toString());
	        } catch (IOException e) {
	            // Log the error or rethrow an exception to handle failures
	            System.out.println("Error creating directory: " + path.toString());
	            throw new IOException("Failed to create directory: " + path.toString(), e);
	        }
	    }
	}

}
