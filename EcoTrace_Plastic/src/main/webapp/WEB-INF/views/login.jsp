<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoTrack Dashboard</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
        }

        .login-container {
            display: flex;
            max-width: 1000px;
            width: 90%;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            backdrop-filter: blur(5px);
        }

        .logo-container {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-green), var(--accent-teal));
            color: var(--white);
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .logo {
            width: 100px;
            margin-bottom: 20px;
        }

        .logo-container h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .logo-container p {
            font-size: 1rem;
            opacity: 0.9;
        }

        .login-options {
            flex: 1;
            padding: 40px;
            background-color: transparent;
        }

        .option-tabs {
            display: flex;
            margin-bottom: 30px;
            border-bottom: 2px solid var(--light-gray);
        }

        .tab-btn {
            flex: 1;
            padding: 12px;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            color: var(--dark-gray);
            position: relative;
            transition: all 0.3s ease;
        }

        .tab-btn.active {
            color: var(--primary-green);
            font-weight: 600;
        }

        .tab-btn.active::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: var(--primary-green);
        }

        .login-form {
            display: none;
            animation: fadeIn 0.5s ease;
        }

        .login-form.active {
            display: block;
        }

        .login-form h2 {
            color: var(--dark-green);
            margin-bottom: 25px;
            font-size: 1.8rem;
            text-align: center;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-green);
        }

        .input-group input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .input-group input:focus {
            border-color: var(--primary-green);
            outline: none;
            box-shadow: 0 0 0 2px rgba(46, 125, 50, 0.2);
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-bottom: 20px;
        }

        .user-btn {
            background-color: var(--primary-green);
            color: white;
        }

        .recycler-btn {
            background-color: var(--primary-green);
            color: white;
        }

        .admin-btn {
            background-color: var(--dark-green);
            color: white;
        }

        .login-btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        .register-link {
            text-align: center;
            color: var(--dark-gray);
            font-size: 0.9rem;
        }

        .register-link a {
            color: var(--primary-green);
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .security-note {
            text-align: center;
            color: var(--dark-gray);
            font-size: 0.8rem;
            margin-top: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .security-note i {
            margin-right: 5px;
            color: var(--dark-green);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            
            .logo-container {
                padding: 30px 20px;
            }
            
            .login-options {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <h1>EcoTrack</h1>
            <p>Sustainable Waste Management System</p>
        </div>
        
        <div class="login-options">
            <div class="option-tabs">
                <button class="tab-btn active" data-tab="user">User</button>
                <button class="tab-btn" data-tab="recycler">Recycler</button>
                <button class="tab-btn" data-tab="admin">Admin</button>
            </div>
            
            <!-- User Login -->
            <div class="login-form active" id="user-form">
                <h2>User Login</h2>
                <form action="user_login" method="post">
                    <div class="input-group">
                        <i class="fas fa-user"></i>
                        <input type="text" name="phone" placeholder="Enter Contact id " required>
                    </div>
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <button type="submit" class="login-btn user-btn">Login</button>
                    <p class="register-link">Don't have an account? <a href="user_register">Register here</a></p>
                </form>
            </div>
            
            <!-- Recycler Login -->
            <div class="login-form" id="recycler-form">
                <h2>Recycler Login</h2>
                <form action="recycler_login" method="post">
                    <div class="input-group">
                        <i class="fas fa-id-card"></i>
                        <input type="text" name="phone" placeholder="Enter Contact Id" required>
                    </div>
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <button type="submit" class="login-btn recycler-btn">Login</button>
                    <p class="register-link">Want to join our recycler network? <a href="recycler_register">Apply now</a></p>
                </form>
            </div>
            
            <!-- Admin Login -->
            <div class="login-form" id="admin-form">
                <h2>Admin Login</h2>
                <form action="admin_login" method="POST">
                    <div class="input-group">
                        <i class="fas fa-user-shield"></i>
                        <input type="text" name="email" placeholder="Admin Email" required>
                    </div>
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <button type="submit" class="login-btn admin-btn">Login</button>
                    <p class="security-note"><i class="fas fa-shield-alt"></i> Secure admin access only</p>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Tab switching functionality
            const tabButtons = document.querySelectorAll('.tab-btn');
            const loginForms = document.querySelectorAll('.login-form');
            
            tabButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const tabId = this.getAttribute('data-tab');
                    
                    // Remove active class from all buttons and forms
                    tabButtons.forEach(btn => btn.classList.remove('active'));
                    loginForms.forEach(form => form.classList.remove('active'));
                    
                    // Add active class to clicked button and corresponding form
                    this.classList.add('active');
                    document.getElementById(`${tabId}-form`).classList.add('active');
                });
            });
            
            // Input field focus effects
            const inputs = document.querySelectorAll('.input-group input');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.querySelector('i').style.color = 'var(--primary-green)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.querySelector('i').style.color = 'var(--primary-green)';
                });
            });
            
           
            
        });
    </script>
</body>
</html>