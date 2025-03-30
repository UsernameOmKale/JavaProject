
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Food Waste Management System</title>
    
    <!-- SweetAlert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style type="text/css">
        body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background-image: url('https://www.dbbnwa.com/content/images/size/w1304/format/webp/2024/06/152.jpeg'); /* Replace with actual background */
    color: #333;
    background-size: cover;
    background-repeat: no-repeat;
}

/* Header Section */
header {
    background-size: cover;
    background-position: center;
    color: white;
    text-align: center;
    padding: 80px 20px;
    background-attachment: fixed;
}

header h1 {
    font-family: 'Playfair Display', serif;
    font-size: 4.5rem;
    letter-spacing: 2px;
    margin: 0;
    font-weight: 700;
    text-transform: uppercase;
    animation: fadeInUp 1.5s ease-out forwards;
}

header p {
    font-size: 1.4rem;
    margin-top: 15px;
    font-weight: 300;
    font-family: 'Poppins', sans-serif;
}

/* Navigation Menu */
nav {
    margin-top: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Style for each button container (Admin, User, Partner) */
.toggle-btns {
    margin: 0 20px; /* Space between each button */
    position: relative;
}

/* Style for the toggle buttons */
.toggle-btns a.cta-btn {
    text-decoration: none;
    color: #39f740; /* Text color */
    padding: 12px 20px;
    margin: 0;
    font-size: 1.2rem;
    font-weight: 600;
    border-radius: 50px;
    border: 3px solid #39f740; /* Border color */
    background-color: transparent; /* Transparent background */
    transition: all 0.4s ease;
    text-transform: uppercase;
}

.toggle-btns a.cta-btn:hover {
    color: #fff; /* Text color change on hover */
    background-color: rgba(57, 247, 64, 0.2); /* Slight green background on hover */
    box-shadow: 0 4px 20px rgba(57, 247, 64, 0.4); /* Glowing effect */
    transform: scale(1.1); /* Scale-up effect */
    border-color: #388E3C; /* Darker green border */
}

/* Initially hide the options div */
.toggle-options {
    display: none;
    position: absolute;
    top: 100%; /* Position below the button */
    left: 0;
    background-color: transparent;
    border-radius: 5px;
    width: 100%;
    z-index: 1;
    padding: 10px 0;
}

.toggle-btns:hover .toggle-options {
    display: block; /* Show options on hover */
}

.toggle-options a {
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    display: block;
    text-transform: uppercase;
    transition: background-color 0.4s ease;
}

.toggle-options a:hover {
    background-color: #388E3C;
}

/* Main Content Section */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 60px 20px;
    text-align: center;
    margin-top: -45px; /* This will shift the container upwards */
}

.container h2 {
    font-family: 'Playfair Display', serif;
    font-size: 3rem;
    color: #eee9e9;
    margin-bottom: 20px;
    animation: fadeInUp 1.5s ease-out forwards;
}

.intro-text {
    font-size: 1.2rem;
    color: #fffcfc;
    max-width: 800px;
    margin: 0 auto 30px;
    line-height: 1.6;
    font-family: 'Poppins', sans-serif;
}

/* Global Button Styles */
.cta-btn, .else-out-btn {
    padding: 15px 40px;
    font-size: 1.2rem;
    color: #39f740; /* Text color */
    background-color: transparent; /* Transparent background */
    border: 3px solid #39f740; /* Border color */
    border-radius: 50px;
    text-decoration: none;
    margin-top: 30px;
    transition: all 0.4s ease;
    font-family: 'Poppins', sans-serif;
    position: relative;
    overflow: hidden;
}

/* Hover Effect (same for both buttons) */
.cta-btn:hover, .else-out-btn:hover {
    color: #fff; /* Text color change on hover */
    background-color: rgba(57, 247, 64, 0.2); /* Slight green background on hover */
    box-shadow: 0 4px 20px rgba(57, 247, 64, 0.4); /* Glowing effect */
    transform: scale(1.1); /* Scale-up effect */
    border-color: #388E3C; /* Darker green border */
}

/* Animation for Headings (Fade In + Slide Up Effect) */
@keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Hover Effect for Headings */
header h1:hover, .container h2:hover, .else-out-container h3:hover {
    color: #39f740; /* Change color on hover */
    text-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); /* Add text-shadow on hover */
    transform: scale(1.05); /* Slight scale-up effect */
    transition: all 0.3s ease;
}

/* Else-Out Hover Effect Section */
.else-out-container {
    position: relative;
    margin-top: 50px;
    padding: 40px;
    border-radius: 10px;
    background-color: transparent;
    width: 90%;
    max-width: 400px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease, background-color 0.3s ease;
    font-family: 'Poppins', sans-serif;
}

.else-out-container:hover {
    transform: translateY(-10px);
    background-color: rgba(57, 247, 64, 0.1); /* Light green background on hover */
}

.else-out-container h3 {
    font-size: 2rem;
    color: #fff8f8;
    font-family: 'Playfair Display', serif; /* Font for subheadings */
}

.else-out-container p {
    font-size: 1.1rem;
    color: #fff4f4;
    line-height: 1.5;
    margin-bottom: 30px;
}

/* Footer Section */
footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 20px 0;
    font-size: 0.9rem;
}

footer a {
    color: #bbb;
    text-decoration: none;
}

footer a:hover {
    color: #fff;
}

/* Form Styles */
.form {
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 8px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
    margin-top: -45px; /* Shift the form upward */
}

.form input, .form textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    font-size: 1.1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.form textarea {
    height: 50px; /* Set the height for the address field */
    resize: vertical; /* Allow resizing vertically */
}

.form button {
    width: 100%;
    padding: 12px;
    font-size: 1.2rem;
    color: white;
    background-color: #4CAF50;
    border-radius: 30px;
    text-decoration: none;
    margin-top: 15px;
    transition: background-color 0.4s ease, transform 0.4s ease, box-shadow 0.3s ease;
}

/* Hover Effect for Button */
.form button:hover {
    background-color: #45a049;
    transform: translateY(-5px);
}

/* Text Link Styling */
.text-center {
    margin-top: 20px;
    font-size: 1rem;
    color: white;
}

.text-center a {
    color: #4CAF50;
    text-decoration: none;
}

.text-center a:hover {
    text-decoration: underline;
}
    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Admin Login</h1>
        <p>Please enter your credentials to log in.</p>
    </header>

    <!-- Login Form Section -->
    <div class="container">
        <form action="CheckLogin" method="get" class="form">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="cta-btn">Login</button>
        </form>
        <p class="text-center">Don't have an account? <a href="AdminReg">Register here</a></p>
    </div>

    <!-- Check if there's an error message and show SweetAlert -->
    <script>
        // Check if the 'error' attribute is present in the page
        var errorMessage = '${error}';
        if (errorMessage) {
            Swal.fire({
                icon: 'error',
                title: 'Login Failed',
                text: errorMessage,
                confirmButtonColor: '#4CAF50'
            });
        }
    </script>


</body>
</html>
