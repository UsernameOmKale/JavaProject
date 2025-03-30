<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
<style type="text/css">
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #F5F5F5;
    color: black;
}

/* Sidebar Styles */
.sidebar {
    width: 250px;
    height: 100vh;
    background: linear-gradient(135deg, #FFEB3B, #FF9800); /* Gradient background */
    padding: 20px;
    position: fixed;
    top: 0;
    left: 0;
    box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
}

/* Profile styling */
.profile {
    text-align: center;
    margin-bottom: 20px;
    display: flex;
    align-items: center;  /* Vertically aligns the profile image and name */
    justify-content: start; /* Aligns them to the left */
    gap: 15px; /* Adds space between the image and the name */
}

/* Profile image styling */
.profile-img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #fff;
    margin-bottom: 0;  /* Removes the bottom margin */
}

/* Profile Name styling */
.profile h2 {
    font-size: 20px;
    color: white;
    font-weight: bold;
}

/* Sidebar Link Styles */
.sidebar a {
    display: flex;
    align-items: center;
    color: black;
    text-decoration: none;
    margin: 15px 0;
    padding: 12px;
    border-radius: 10px;
    font-size: 18px;
    font-weight: bold;
    transition: all 0.3s ease;
}

/* Sidebar link hover effect */
.sidebar a:hover {
    background-color: #FF7043; /* Change background color on hover */
    color: white; /* White text on hover */
    transform: translateX(10px); /* Slide effect */
}

/* Header Styles */
header {
    margin-left: 250px; /* To make room for the sidebar */
    padding: 20px;
    background-color: #FFEB3B;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

header h1 {
    font-size: 36px;
    color: black;
}

/* Main Content Styles */
.main-content {
    margin-left: 250px; /* To make room for the sidebar */
    padding: 30px;
    background-color: white;
}

/* Add Food Form Styles */
.food-form {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 800px;
    margin: 0 auto;
}

.food-form label {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    display: block;
    color: black;
}

.food-item-input {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
}

.food-item-input:focus {
    outline: none;
    border-color: #FF9800; /* Orange color to match the theme */
}

/* Reduced size and aligned the "Add Another Food Item" button to the right */
.add-food-btn {
    font-size: 14px; /* Smaller font size */
    padding: 8px 16px; /* Reduced padding */
    margin-bottom: 20px;
    display: block;
    background-color: #FF9800; /* Button matches the theme */
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: auto;
    margin-left: auto; /* Aligns the button to the right */
}

.add-food-btn:hover {
    background-color: #FF7043;
}

/* Adjusted the position of the cross button */
.remove-food-field {
    width: 80px;
    background-color: transparent; /* Remove background */
    border: none; /* Remove border */
    color: #FF7043; /* Cross button color */
    font-size: 20px; /* Adjust size of the cross button */
    cursor: pointer;
    transition: color 0.3s ease;
    position: relative;
    top: -10px; /* Move it slightly upwards */
}

/* Submit Button */
.submit-btn {
    background-color: #FF9800; /* Button matches the sidebar color */
    color: white;
    border: none;
    padding: 12px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    width: 100%;
}

.submit-btn:hover {
    background-color: #FF7043;
}

#food-items {
    margin-bottom: 20px;
}

.food-item {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}

.food-item-field {
    display: flex; /* Use flexbox */
    align-items: center; /* Vertically center the items */
    justify-content: space-between; /* Push the button to the right */
}

/* Responsive Design */
@media (max-width: 768px) {
    .sidebar {
        width: 200px;
    }

    .main-content {
        margin-left: 200px;
    }
}

@media (max-width: 480px) {
    .sidebar {
        width: 100%;
        position: relative;
        height: auto;
    }

    .main-content {
        margin-left: 0;
    }

    .food-form {
        padding: 20px;
    }

    .food-item-input {
        padding: 8px;
    }

    .add-food-btn {
        font-size: 12px;
        padding: 6px 12px;
    }

    .submit-btn {
        padding: 10px 15px;
        font-size: 14px;
    }
}


/* Stat Box Container (Stats Layout) */
.stats-container {
    display: flex;
    flex-wrap: wrap; /* Allows wrapping of items into multiple rows */
    justify-content: space-between; /* Distribute space between items */
    gap: 20px; /* Adds space between the boxes */
    margin-top: 20px;
}

/* Stat Box Styles */
.stat-box {
    background-color: white;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); /* Initial shadow for depth */
    width: 30%; /* Make each box take up 30% of the container width */
    text-align: center;
    transition: all 0.3s ease-in-out; /* Smooth transition for hover effect */
    transform: perspective(1200px) rotateX(5deg) rotateY(5deg); /* 3D transformation */
}

/* Hover effect for Stat Boxes */
.stat-box:hover {
    transform: perspective(1200px) rotateX(0deg) rotateY(0deg) scale(1.05); /* Remove rotation and slightly scale up */
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2); /* Deeper shadow for the hover effect */
    background-color: #FFEB3B; /* Change background on hover to match theme */
}

/* Stat Box Heading */
.stat-box h3 {
    font-size: 16px;
    font-weight: bold;
    color: #333;
}

/* Stat Box Value (the numbers) */
.stat-box p {
    font-size: 28px;
    font-weight: bold;
    color: #FF9800; /* Accent color for the numbers */
}

/* Responsive Design for Stat Boxes */
@media (max-width: 768px) {
    .stat-box {
        width: 48%; /* Two boxes per row on medium screens */
    }
}

@media (max-width: 480px) {
    .stat-box {
        width: 100%; /* Stat boxes take full width on very small screens */
        margin-bottom: 20px; /* Adds space between the stat boxes */
    }

    .stat-box h3 {
        font-size: 14px;
    }

    .stat-box p {
        font-size: 24px;
    }
}





/* Table Styles */
.orders-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.orders-table th,
.orders-table td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
}

.orders-table th {
    background-color: #FF9800; /* Orange background for header */
    color: white; /* White text */
    font-size: 18px;
}

.orders-table td {
    font-size: 16px;
}

.orders-table tr:nth-child(even) {
    background-color: #f2f2f2; /* Light gray for even rows */
}

/* Hover effect for rows */
.orders-table tr:hover {
    background-color: #FFEB3B; /* Light yellow on hover */
    cursor: pointer;
}

/* Responsive Design for Table */
@media (max-width: 768px) {
    .orders-table th,
    .orders-table td {
        font-size: 14px;
        padding: 10px;
    }
}

@media (max-width: 480px) {
    .orders-table th,
    .orders-table td {
        font-size: 12px;
        padding: 8px;
    }
}

</style>

</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="profile">
            <img src="profile.jpg" alt="User Profile" class="profile-img">
            <h2>OM KAlE</h2>
        </div>
        
         <!-- New options for user -->
        <a href="UserProfile.html?id=${Doner_model.id}">👤 My Profile</a>
        <a href="DonerDashbord?id=${Doner_model.id}">🏠 Home</a>
        <a href="PlacedRequest?id=${Doner_model.id}">📜 Placed Requests</a>
        <a href="MyOrders?id=${Doner_model.id}">🛒 My Orders</a>
        <a href="ReceiveConfirmation?id=${Doner_model.id}">✅ Receive Confirmation</a>
        <a href="TrackOrderStatus?id=${Doner_model.id}">📦 Track Order Status</a>
        <!-- Logout option -->
        <a href="index">🚪 Logout</a>
    </div>
    
    <header>
        <h1 class="user-header">Active Orders</h1>
    </header>

    <!-- Main Content Area (Table with orders) -->
    <div class="main-content">
        <table class="orders-table">
            <thead>
                <tr>
                    <th>Sr No.</th>
                    <th>Order ID</th>
                    <th>Food</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>#1234</td>
                    <td>Pizza</td>
                    <td>2025-02-13</td>
                    <td>Pending</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>#5678</td>
                    <td>Burger</td>
                    <td>2025-02-12</td>
                    <td>Completed</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>#9101</td>
                    <td>Pasta</td>
                    <td>2025-02-10</td>
                    <td>Active</td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>

</body>
</html>
