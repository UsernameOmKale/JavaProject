<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <style type="text/css">
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: black;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: yellow;
            padding: 20px;
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
        }

        .sidebar h2 {
            color: black;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            color: black;
            text-decoration: none;
            padding: 10px;
            margin: 10px;
            background-color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-size: 1.1rem;
        }

        .sidebar a:hover {
            background-color: #f0c500;
        }

        .sidebar a.active {
            background-color: #f0c500;
            color: white;
        }

        /* Main content styles */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }

        /* Profile Section */
        .profile-container {
            display: flex;
            flex-direction: row;
            gap: 20px;
            align-items: flex-start;
        }

        .profile-details {
            flex: 1;
        }

        .profile-details h2 {
            margin-bottom: 10px;
        }

        .profile-details label {
            font-weight: bold;
            margin-top: 10px;
        }

        .profile-details input, .profile-details textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Profile Picture Section */
        .profile-photo-container {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .profile-photo-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-photo-container input[type="file"] {
            display: none;
        }

        .file-upload-btn {
            margin-top: 10px;
            cursor: pointer;
            color: #007bff;
            text-decoration: underline;
        }

        /* Update Button */
        .update-btn {
            padding: 10px 20px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            margin-top: 20px;
        }

        .update-btn:hover {
            background-color: #45a049;
        }

        /* Style for readonly input fields */
        .readonly-input {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }

        /* Header */
        .admin-header {
            font-size: 2rem;
            color: black;
            background-color: yellow;
            padding: 15px;
            text-align: center;
            border-radius: 5px;
            margin-bottom: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="AdminDashbord">Home</a>
        <a href="DonerList">👤 Manage Users</a>
        <a href="PartnerList">👨‍💼 Manage Delivery Partners</a>
        <a href="FoodRequest">📦 Receives Pickup Requests</a>
        <a href="RequestApprove">✅ Validates & Approves Request</a>
        <a href="#">🚚 Assigns Delivery Partner</a>
        <a href="#">📊 Monitors Ongoing Requests</a>
        <a href="#">♻ Ensures Proper Waste Handling</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <header>
            <h1 class="admin-header">Welcome ${Admin_model.name} on the Admin Dashboard</h1>
        </header>

        <div class="profile-container">
            <!-- Profile Details -->
            <div class="profile-details">
                <h2>Admin Profile</h2>
                <form>
                    <!-- Name Field -->
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="${Admin_model.name}" class="readonly-input">

                    <!-- Email Field -->
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${Admin_model.email}" class="readonly-input">

                    <!-- Address Field -->
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="2" class="readonly-input">${Admin_model.address}</textarea>

                    <!-- Mobile No Field -->
                    <label for="mobile">Mobile No</label>
                    <input type="tel" id="mobile" name="mobile" value="${Admin_model.mobile}" class="readonly-input">

                    <!-- Username Field -->
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${Admin_model.username}" readonly class="readonly-input">

                    <!-- Password Field -->
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" value="${Admin_model.password}" readonly class="readonly-input">
                </form>
            </div>

            <!-- Profile Photo Section -->
            <div class="profile-photo-container">
                <img id="profile-photo" src="${Admin_model.photoUrl || ''}" alt="Profile Photo">
                <input type="file" id="file-upload" accept="image/*">
                <label for="file-upload" class="file-upload-btn">Browse Photo</label>
            </div>
        </div>

        <!-- Update Button -->
        <button class="update-btn" onclick="enableEditing()">Update Profile</button>
    </div>

    <script>
        // Enable the profile inputs for editing
        function enableEditing() {
            const inputs = document.querySelectorAll('.profile-details input, .profile-details textarea');
            inputs.forEach(input => {
                input.removeAttribute('readonly');
                input.style.backgroundColor = '#fff'; // Enable background color for editing
            });
            document.getElementById('file-upload').style.display = 'block'; // Show the file input
        }
    </script>
</body>
</html>
