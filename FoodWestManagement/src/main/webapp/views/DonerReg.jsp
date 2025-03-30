<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Register - Food Waste Management System</title>
    
    <!-- Include SweetAlert2 CSS and JS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
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

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 60px 20px;
            text-align: center;
            margin-top: -45px;
        }

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
            margin-top: -45px;
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
            height: 50px;
            resize: vertical;
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

        .form img {
            display: none;
            max-width: 100px;
            margin-top: 10px;
            border-radius: 8px;
        }

        .cta-btn:hover {
            background-color: #45a049;
            transform: translateY(-5px);
        }

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
    </style>
    
    <script type="text/javascript">
 // Validation function
    function validateForm(event) {
        let valid = true;
        let errorMessage = "";

        // Get the form elements
        const name = document.getElementsByName('name')[0];
        const email = document.getElementsByName('email')[0];
        const mobileno = document.getElementsByName('mobileno')[0];
        const address = document.getElementsByName('address')[0];
        const username = document.getElementsByName('username')[0];
        const password = document.getElementsByName('password')[0];
        const photo = document.getElementsByName('file1')[0]; // Photo field reference

        // Validate Name (Only letters and spaces)
        const namePattern = /^[a-zA-Z\s]+$/;
        if (!name.value.match(namePattern)) {
            errorMessage += "Full Name should only contain letters and spaces.\n";
            valid = false;
        }

        // Validate Email
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!email.value.match(emailPattern)) {
            errorMessage += "Please enter a valid email address.\n";
            valid = false;
        }

        // Validate Mobile No. (Only digits, 10 digits)
        const mobilePattern = /^[0-9]{10}$/;
        if (!mobileno.value.match(mobilePattern)) {
            errorMessage += "Mobile No. should be 10 digits.\n";
            valid = false;
        }

        // Validate Address (Cannot be empty)
        if (address.value.trim() === "") {
            errorMessage += "Address cannot be empty.\n";
            valid = false;
        }

        // Validate Username (Cannot be empty)
        if (username.value.trim() === "") {
            errorMessage += "Username cannot be empty.\n";
            valid = false;
        }

        // Validate Password (At least 6 characters long)
        if (password.value.length < 6) {
            errorMessage += "Password must be at least 6 characters long.\n";
            valid = false;
        }

        // Validate Photo (File is selected)
        if (!photo.files.length) {
            errorMessage += "Please upload a photo.\n";
            valid = false;
        }

        // If validation fails, prevent form submission and show errors
        if (!valid) {
            alert(errorMessage);
            event.preventDefault(); // Prevent form submission
        } else {
            // Show SweetAlert2 popup for success if data passes validation
            event.preventDefault(); // Prevent default form submission temporarily

            Swal.fire({
                icon: 'success',
                title: 'Registration Successful!',
                text: 'Your Account Has been Created successfully.',
                showConfirmButton: true
            }).then((result) => {
                if (result.isConfirmed) {
                    // After the popup is confirmed, submit the form
                    document.querySelector("form").submit(); // Submit the form after SweetAlert confirmation
                }
            });
        }
    }

    // Add event listener on form submit
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.querySelector("form");
        form.addEventListener("submit", validateForm);

        // Show image preview when user selects a photo
        const photoInput = document.querySelector('input[name="file1"]');
        const imgPreview = document.querySelector('.form img');

        photoInput.addEventListener('change', function() {
            const file = photoInput.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imgPreview.src = e.target.result;
                    imgPreview.style.display = 'block'; // Show the image preview
                }
                reader.readAsDataURL(file);
            } else {
                imgPreview.style.display = 'none'; // Hide image if no file selected
            }
        });
    });

    </script>

</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Doner Registration</h1>
        <p>Fill out the form below to create a Doner account.</p>
    </header>

    <!-- Registration Form Section -->
    <div class="container">
        <form action="DonerDataSave" method="post" class="form" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="mobileno" placeholder="Mobile No." required>
            <textarea name="address" placeholder="Address" required></textarea>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>

            <!-- Photo Input Field -->
            <input type="file" name="file1" id="photo" accept="image/*" required>
            <img src="" alt="Image Preview">

            <button type="submit" class="cta-btn">Register</button>
        </form>
        <p class="text-center">Already have an account? <a href="AdminLogin">Login here</a></p>
    </div>

</body>
</html>
