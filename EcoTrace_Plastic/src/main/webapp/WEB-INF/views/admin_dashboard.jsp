<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - EcoTrack</title>
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

        /* Quick Stats */
        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: var(--white);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            border-top: 4px solid transparent;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            margin: 0 auto 15px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .stat-card.users {
            border-top-color: var(--deep-blue);
        }
        .stat-card.users .stat-icon {
            background: var(--deep-blue);
        }

        .stat-card.recyclers {
            border-top-color: var(--warm-orange);
        }
        .stat-card.recyclers .stat-icon {
            background: var(--warm-orange);
        }

        .stat-card.collections {
            border-top-color: var(--vibrant-teal);
        }
        .stat-card.collections .stat-icon {
            background: var(--vibrant-teal);
        }

        .stat-card.impact {
            border-top-color: var(--sunflower-yellow);
        }
        .stat-card.impact .stat-icon {
            background: var(--sunflower-yellow);
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 600;
            color: var(--dark-gray);
            margin-bottom: 5px;
        }

        .stat-label {
            color: var(--dark-gray);
            font-size: 0.9rem;
            opacity: 0.8;
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

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .action-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: var(--deep-blue);
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

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* Responsive */
        @media (max-width: 992px) {
            .quick-stats,
            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
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
            
            .quick-stats,
            .quick-actions {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>EcoTrack Admin</h2>
        </div>
        
        <div class="sidebar-menu">
            <h3>Navigation</h3>
            <ul>
                <li class="active">
                    <a href="admin_dashboard" class="nav-link">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="admin_ViewUsers" class="nav-link">
                        <i class="fas fa-users"></i>
                        <span>View Users</span>
                    </a>
                </li>
                <li>
                    <a href="admin_ViewCollectionLogs" class="nav-link">
                        <i class="fas fa-recycle"></i>
                        <span>Collection Logs</span>
                    </a>
                </li>
                <li>
                    <a href="admin_addRecyclers" class="nav-link">
                        <i class="fas fa-user-plus"></i>
                        <span>Add Recyclers</span>
                    </a>
                </li>
                <li>
                    <a href="admin_ViewApprovedRecycler" class="nav-link">
                        <i class="fas fa-list"></i>
                        <span>View Recyclers</span>
                    </a>
                </li>
                <li>
                    <a href="admin_deleteRecycler" class="nav-link">
                        <i class="fas fa-user-minus"></i>
                        <span>Delete Recyclers</span>
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
            <h1>Admin Dashboard</h1>
            <div class="user-info">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Admin">
                <span>Welcome, Admin!</span>
            </div>
        </div>

        <!-- Welcome Section -->
        <div class="welcome-section">
            <div class="welcome-content">
                <h2>Welcome Back, Administrator!</h2>
                <p>Track and manage your waste management system efficiently. View real-time statistics, manage users and recyclers, and monitor collection activities all from one place.</p>
            </div>
        </div>

        <!-- Quick Stats -->
        <div class="quick-stats">
            <div class="stat-card users">
                <div class="stat-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-value">1,254</div>
                <div class="stat-label">Total Users</div>
            </div>
            
            <div class="stat-card recyclers">
                <div class="stat-icon">
                    <i class="fas fa-recycle"></i>
                </div>
                <div class="stat-value">86</div>
                <div class="stat-label">Active Recyclers</div>
            </div>
            
            <div class="stat-card collections">
                <div class="stat-icon">
                    <i class="fas fa-trash-alt"></i>
                </div>
                <div class="stat-value">542</div>
                <div class="stat-label">Collections Today</div>
            </div>
            
            <div class="stat-card impact">
                <div class="stat-icon">
                    <i class="fas fa-leaf"></i>
                </div>
                <div class="stat-value">3.2T</div>
                <div class="stat-label">Waste Diverted</div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="quick-actions">
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3>Manage Users</h3>
                <p>View, add, or remove users from the system</p>
                <button class="action-btn" onclick="window.location.href='viewUsers.jsp'">Manage Users</button>
            </div>
            
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-recycle"></i>
                </div>
                <h3>Recycler Management</h3>
                <p>Add or remove recyclers from the network</p>
                <button class="action-btn" onclick="window.location.href='viewRecyclers.jsp'">Manage Recyclers</button>
            </div>
            
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>View Reports</h3>
                <p>Generate system reports and analytics</p>
                <button class="action-btn" onclick="window.location.href='reports.jsp'">View Reports</button>
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
        });
    </script>
</body>
</html>