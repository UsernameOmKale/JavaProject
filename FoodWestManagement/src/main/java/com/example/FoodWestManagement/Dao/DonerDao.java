package com.example.FoodWestManagement.Dao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.example.FoodWestManagement.Entity.DonerEntity;
import com.example.FoodWestManagement.Repo.DonerRepo;

@Repository
public class DonerDao {

	@Autowired
	DonerRepo donerRepo;
//from here {

	public DonerEntity DonerDataSave(DonerEntity donerEntity, MultipartFile file1) throws IOException {

		/*
		 * // Define the upload directory based on a full path. String uploadDir =
		 * System.getProperty("user.dir") + File.separator + "uploads" + File.separator
		 * + "profilePicture";
		 * 
		 * // Get the path object and create directories if they do not exist Path path
		 * = Paths.get(uploadDir); createDirectoriesIfNotExists(path);
		 */

		
		 String uploadDir = System.getProperty("user.dir") + "/uploads/profilePicture/";
		 Path path = Paths.get(uploadDir);
		 createDirectoriesIfNotExists(path);
		 
		// Check if the file is not empty
		if (file1 != null && !file1.isEmpty()) {
			// Save the file and set the path in the entity
			donerEntity.setPhoto(saveFile(file1, path));
		}

		// Save and return the entity
		return donerRepo.save(donerEntity);
	}

	private String saveFile(MultipartFile file1, Path path) throws IOException {
		// Get original file name and sanitize it by replacing spaces with underscores
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
				Files.createDirectories(path);
			} catch (IOException e) {
				// Log the error or rethrow an exception to handle failures
				throw new IOException("Failed to create directories at path: " + path.toString(), e);
			}
		}
	}

	public DonerEntity CheckDonerLogin(String username, String password) {
		return donerRepo.findByUsernameAndPassword(username, password);
	}

	public DonerEntity findById(int id) {
		return donerRepo.findById(id).get();
	}

	// to here is a code of save data
	// }

}
