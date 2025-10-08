<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - EcoTrack</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-green: #2e7d32;
            --secondary-green: #81c784;
            --dark-green: #1b5e20;
            --light-green: #e8f5e9;
            --accent-teal: #26a69a;
            --accent-brown: #8d6e63;
            --white: #ffffff;
            --light-gray: #f5f5f5;
            --dark-gray: #333333;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--light-green);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-image: linear-gradient(rgba(46, 125, 50, 0.1), rgba(46, 125, 50, 0.1)), 
                              url('https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
        }

        .registration-container {
            width: 100%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            display: grid;
            grid-template-columns: 1fr 1.5fr;
        }

        .registration-hero {
            background: linear-gradient(135deg, var(--primary-green), var(--accent-teal));
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: var(--white);
            text-align: center;
        }

        .registration-hero img {
            width: 80px;
            margin: 0 auto 20px;
        }

        .registration-hero h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .registration-hero p {
            font-size: 0.9rem;
            opacity: 0.9;
            margin-bottom: 30px;
        }

        .benefits-list {
            text-align: left;
            margin-top: 20px;
        }

        .benefits-list li {
            list-style-type: none;
            margin-bottom: 15px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
        }

        .benefits-list i {
            margin-right: 10px;
            color: var(--secondary-green);
        }

        .registration-form {
            padding: 40px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h2 {
            color: var(--dark-green);
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .form-header p {
            color: var(--dark-gray);
            font-size: 0.9rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--dark-gray);
            font-weight: 500;
            font-size: 0.9rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px 12px 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary-green);
            outline: none;
            box-shadow: 0 0 0 3px rgba(46, 125, 50, 0.2);
        }

        .form-icon {
            position: absolute;
            left: 15px;
            top: 38px;
            color: var(--primary-green);
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: var(--primary-green);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: var(--dark-green);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .login-prompt {
            text-align: center;
            margin-top: 20px;
            color: var(--dark-gray);
            font-size: 0.9rem;
        }

        .login-prompt a {
            color: var(--primary-green);
            text-decoration: none;
            font-weight: 500;
        }

        .login-prompt a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .registration-container {
                grid-template-columns: 1fr;
            }
            
            .registration-hero {
                padding: 30px 20px;
            }
            
            .registration-form {
                padding: 30px 20px;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .form-group.full-width {
                grid-column: span 1;
            }
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="registration-hero">
            
            <h1>Join Our Eco Community</h1>
            <p>Register now to start your sustainable journey</p>
            
            <ul class="benefits-list">
                <li><i class="fas fa-leaf"></i> Track your environmental impact</li>
                <li><i class="fas fa-recycle"></i> Connect with local recyclers</li>
                <li><i class="fas fa-award"></i> Earn rewards for eco-friendly actions</li>
                <li><i class="fas fa-chart-line"></i> Monitor your waste reduction progress</li>
            </ul>
        </div>
        
        <div class="registration-form">
            <div class="form-header">
                <h2>Create Your Account</h2>
                <p>Fill in your details to get started</p>
            </div>
            
            <form id="user-register-form" action="user_Register" method="post">
                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label" for="name">Full Name</label>
                        <i class="fas fa-user form-icon"></i>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="email">Email</label>
                        <i class="fas fa-envelope form-icon"></i>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="password">Password</label>
                        <i class="fas fa-lock form-icon"></i>
                        <input type="password" class="form-control" id="password" name="password" placeholder="password" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="confirm_password">Confirm Password</label>
                        <i class="fas fa-lock form-icon"></i>
                        <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="password" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="contact">Phone Number</label>
                        <i class="fas fa-phone form-icon"></i>
                        <input type="text" class="form-control" id="contact" name="contact" placeholder="Contact number" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="location">City</label>
                        <i class="fas fa-map-marker-alt form-icon"></i>
                        <input type="text" class="form-control" id="city" name="city" placeholder="Your City" required>
                    </div>
                    
                    <div class="form-group full-width">
                        <label class="form-label" for="address">Full Address</label>
                        <i class="fas fa-home form-icon"></i>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Street, Building, Apartment" required>
                    </div>
                </div>
                
                <button type="submit" class="submit-btn">Register Now</button>
                
                <p class="login-prompt">Already have an account? <a href="login">Log in here</a></p>

            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('user-register-form');
            
            form.addEventListener('submit', function(e) {
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirm_password').value;
                
                if (password !== confirmPassword) {
                    e.preventDefault();
                    alert('Passwords do not match!');
                    return false;
                }
                
                if (password.length < 6) {
                    e.preventDefault();
                    alert('Password must be at least 6 characters');
                    return false;
                }
                
                // Additional validation can be added here
                return true;
            });
        });
    </script>
</body>
</html>