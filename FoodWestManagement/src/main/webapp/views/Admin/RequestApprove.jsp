<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
    min-height: 100vh;
    flex-direction: column; /* Ensure content is stacked vertically */
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

/* Active state for sidebar links */
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

/* Header styling - attached with sidebar */
.admin-header {
    font-size: 2rem;
    color: black; /* Make header text black */
    background-color: yellow; /* Make header background yellow */
    padding: 15px; /* Add some padding around the header */
    text-align: center;
    border-radius: 5px; /* Round the corners of the header */
    margin-bottom: 20px; /* Some space below the header */
    width: 100%;
}

/* Button styling for Update and Delete */
button {
    padding: 3px 8px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    margin-right: 5px; /* Space between the buttons */
}

.update-btn {
    background-color: #4CAF50; /* Green for update */
    color: white;
}

.update-btn:hover {
    background-color: #45a049;
}

.delete-btn {
    background-color: #f44336; /* Red for delete */
    color: white;
}
.delete-btn:hover {
    background-color: #d32f2f;
}

.approve-btn {
    background-color: #46f436; /* Red for delete */
    color: white;
}
.approve-btn:hover {
    background-color: rgb(162, 250, 29);
}




/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: yellow;
    color: rgb(3, 1, 1);
}

tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

tbody tr:hover {
    background-color: #f1f1f1;
}


/* Stats Box Styles (3D effect) */
.stats-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-top: 20px;
}

.stat-box {
    background-color: yellow;
    padding: 30px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.15);
    transition: box-shadow 0.3s ease-in-out;
}

.stat-box:hover {
    box-shadow: 0 25px 35px rgba(0, 0, 0, 0.274);
}

.stat-box h3 {
    font-size: 1.3rem;
    margin-bottom: 10px;
}

.stat-box p {
    font-size: 2rem;
    font-weight: bold;
    color: #333;
}

</style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
         <!-- New options added -->
         <a href="AdminDashbord">Home</a>
         <a href="DonerList">👤 Manage Users</a>
         <a href="PartnerList">👨‍💼 Manage Delivery Partners</a> <!-- Changed the symbol here -->
        <a href="FoodRequest">📦 Receives Pickup Requests</a>
        <a href="RequestApprove">✅ Validates & Approves Request</a>
        <a href="#">🚚 Assigns Delivery Partner</a>
        <a href="#">📊 Monitors Ongoing Requests</a>
        <a href="#">♻ Ensures Proper Waste Handling</a>
    </div>
    

    <header>
        <h1 class="admin-header">Welcome to the Admin Dashboard</h1>
    </header>

    <!-- Main Content Area -->
    <div class="main-content">
        <h2>All Approved List Table</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile No</th>
                    <th>Address</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <!-- Example of a row -->
                <tr>
                    <td>John Doe</td>
                    <td>johndoe@example.com</td>
                    <td>123-456-7890</td>
                    <td>123 Main St, Cityville</td>
                    <td>Pending</td>
                </tr>
                <tr>
                    <td>Jane Smith</td>
                    <td>janesmith@example.com</td>
                    <td>987-654-3210</td>
                    <td>456 Elm St, Townsville</td>
                    <td>Approved</td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>

</body>
</html>
