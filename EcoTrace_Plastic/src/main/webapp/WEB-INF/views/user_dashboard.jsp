<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - EcoTrack</title>
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
            
            /* New vibrant color palette */
            --sunflower-yellow: #FFD700;
            --vibrant-teal: #00BFA5;
            --deep-blue: #2962FF;
            --warm-orange: #FF6D00;
            --soft-yellow: #FFEE58;
            --leaf-green: #4CAF50;
            --navy-blue: #0D47A1;
            --sidebar-gradient: linear-gradient(135deg, #0a3a1e, #1B5E20);
            --welcome-gradient: linear-gradient(135deg, #00BFA5, #2962FF);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f5f7fa;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Navigation */
        .sidebar {
            width: 250px;
            background: var(--sidebar-gradient);
            color: var(--white);
            padding: 20px 0;
            height: 100vh;
            position: fixed;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
        }

        .sidebar-header img {
            width: 60px;
            margin-bottom: 10px;
            filter: brightness(0) invert(1);
        }

        .sidebar-header h2 {
            font-size: 1.3rem;
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .sidebar-menu h3 {
            color: var(--soft-yellow);
            padding: 0 20px;
            margin-bottom: 10px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .sidebar-menu ul {
            list-style: none;
        }

        .sidebar-menu li {
            margin: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s;
            background: rgba(255, 255, 255, 0.05);
        }

        .sidebar-menu li a {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            color: var(--white);
            text-decoration: none;
            width: 100%;
            height: 100%;
        }

        .sidebar-menu li i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
            color: var(--soft-yellow);
        }

        .sidebar-menu li:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
        }

        .sidebar-menu li.active {
            background: var(--sunflower-yellow);
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .sidebar-menu li.active a {
            color: var(--dark-gray);
        }

        .sidebar-menu li.active i {
            color: var(--dark-gray);
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 30px;
            background-color: var(--white);
            min-height: 100vh;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--light-gray);
        }

        .header h1 {
            color: var(--dark-green);
            font-size: 2rem;
            font-weight: 600;
        }

        .user-info {
            display: flex;
            align-items: center;
            background: var(--light-green);
            padding: 8px 15px;
            border-radius: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }

        .user-info:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .user-info img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            margin-right: 10px;
            border: 2px solid var(--vibrant-teal);
        }

        /* Welcome Section */
        .welcome-section {
            background: var(--welcome-gradient);
            color: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .welcome-content h2 {
            font-size: 2rem;
            margin-bottom: 15px;
        }

        .welcome-content p {
            font-size: 1rem;
            opacity: 0.9;
            max-width: 600px;
            margin-bottom: 20px;
        }

        .recycle-process {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            flex-wrap: nowrap;
            overflow-x: auto;
            padding-bottom: 10px;
            -webkit-overflow-scrolling: touch;
            scrollbar-width: thin;
            scrollbar-color: rgba(255,255,255,0.3) rgba(255,255,255,0.1);
        }

        .recycle-process::-webkit-scrollbar {
            height: 6px;
        }

        .recycle-process::-webkit-scrollbar-track {
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
        }

        .recycle-process::-webkit-scrollbar-thumb {
            background: rgba(255,255,255,0.3);
            border-radius: 10px;
        }

        .recycle-process::-webkit-scrollbar-thumb:hover {
            background: rgba(255,255,255,0.5);
        }

        .process-step {
            flex: 0 0 23%;
            min-width: 220px;
            text-align: center;
            padding: 20px;
            margin: 0 10px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 10px;
            transition: all 0.3s;
        }

        .process-step:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .process-icon {
            width: 60px;
            height: 60px;
            background: var(--white);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            color: var(--vibrant-teal);
            font-size: 1.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .process-step h4 {
            margin-bottom: 8px;
            font-size: 1.1rem;
        }

        .process-step p {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .action-card {
            background: var(--white);
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            border-top: 4px solid var(--deep-blue);
            text-align: center;
        }

        .action-card.request {
            border-top-color: var(--warm-orange);
        }

        .action-card.recyclers {
            border-top-color: var(--vibrant-teal);
        }

        .action-card.status {
            border-top-color: var(--sunflower-yellow);
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .action-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: var(--deep-blue);
        }

        .action-card.request .action-icon {
            color: var(--warm-orange);
        }

        .action-card.recyclers .action-icon {
            color: var(--vibrant-teal);
        }

        .action-card.status .action-icon {
            color: var(--sunflower-yellow);
        }

        .action-card h3 {
            margin-bottom: 10px;
            color: var(--dark-gray);
        }

        .action-card p {
            color: var(--dark-gray);
            margin-bottom: 20px;
            font-size: 0.9rem;
        }

        .action-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            background: var(--deep-blue);
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .action-card.request .action-btn {
            background: var(--warm-orange);
        }

        .action-card.recyclers .action-btn {
            background: var(--vibrant-teal);
        }

        .action-card.status .action-btn {
            background: var(--sunflower-yellow);
            color: #5D4037;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .process-step {
                flex: 0 0 23%;
                min-width: 200px;
            }
        }

        @media (max-width: 992px) {
            .recycle-process {
                justify-content: flex-start;
            }
            
            .welcome-section {
                text-align: center;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            
            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>EcoTrack User</h2>
        </div>
        
        <div class="sidebar-menu">
            <h3>Navigation</h3>
            <ul>
                <li class="active">
                    <a href="user_dashboard" class="nav-link">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="user_requestForm" class="nav-link">
                        <i class="fas fa-plus-circle"></i>
                        <span>Submit Collection Request</span>
                    </a>
                </li>
                <li>
                    <a href="user_ViewRecycler" class="nav-link">
                        <i class="fas fa-recycle"></i>
                        <span>View Recyclers</span>
                    </a>
                </li>
                
                <li>
                    <a href="user_profile" class="nav-link">
                        <i class="fas fa-chart-line"></i>
                        <span>User Profile</span>
                    </a>
                </li>
                <li>
                    <a href="login" class="nav-link">
                        <i class="fas fa-user"></i>
                        <span>Back to Login</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <div class="header">
            <h1>User Dashboard</h1>
            <div class="user-info">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User">
                <span>Welcome, User!</span>
            </div>
        </div>

        <!-- Welcome Section with Recycle Process -->
        <div class="welcome-section">
            <div class="welcome-content">
                <h2>Your Sustainable Journey Starts Here</h2>
                <p>Join thousands of eco-conscious users making a difference through responsible waste management. See how your contributions help our planet.</p>
                
                <div class="recycle-process">
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-box-open"></i>
                        </div>
                        <h4>1. Collect Waste</h4>
                        <p>Separate your recyclable materials at home</p>
                    </div>
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <h4>2. Submit Request</h4>
                        <p>Schedule a pickup through our platform</p>
                    </div>
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <h4>3. Professional Pickup</h4>
                        <p>Our certified recyclers collect your materials</p>
                    </div>
                    <div class="process-step">
                        <div class="process-icon">
                            <i class="fas fa-leaf"></i>
                        </div>
                        <h4>4. Track Impact</h4>
                        <p>See how your waste gets transformed</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="quick-actions">
            <div class="action-card request">
                <div class="action-icon">
                    <i class="fas fa-plus-circle"></i>
                </div>
                <h3>Submit Collection Request</h3>
                <p>Schedule a pickup for your recyclable materials</p>
                <button class="action-btn">Request Now</button>
            </div>
            
            <div class="action-card recyclers">
                <div class="action-icon">
                    <i class="fas fa-recycle"></i>
                </div>
                <h3>Find Recyclers</h3>
                <p>Discover certified recycling partners near you</p>
                <button class="action-btn">View Recyclers</button>
            </div>
            
            <div class="action-card status">
                <div class="action-icon">
                    <i class="fas fa-history"></i>
                </div>
                <h3>Check Status</h3>
                <p>Track your current and past collection requests</p>
                <button class="action-btn">View Status</button>
            </div>
        </div>
    </div>

    <script>
        // Handle sidebar menu active state
        document.addEventListener('DOMContentLoaded', function() {
            const menuItems = document.querySelectorAll('.sidebar-menu li');
            const currentPage = window.location.pathname.split('/').pop();
            
            menuItems.forEach(item => {
                const link = item.querySelector('a');
                if (link && link.getAttribute('href') === currentPage) {
                    item.classList.add('active');
                }
                
                item.addEventListener('click', function() {
                    if (!this.classList.contains('active')) {
                        menuItems.forEach(i => i.classList.remove('active'));
                        this.classList.add('active');
                    }
                });
            });
            
            // Make action buttons clickable
            document.querySelector('.action-card.request .action-btn').addEventListener('click', function() {
                window.location.href = 'submitRequest.jsp';
            });
            
            document.querySelector('.action-card.recyclers .action-btn').addEventListener('click', function() {
                window.location.href = 'viewRecyclers.jsp';
            });
            
            document.querySelector('.action-card.status .action-btn').addEventListener('click', function() {
                window.location.href = 'viewStatus.jsp';
            });
        });
    </script>
</body>
</html>