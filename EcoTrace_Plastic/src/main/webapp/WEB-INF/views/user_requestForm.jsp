<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.ecotrace.plastic.Model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Collection Request - EcoTrack User</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-green: #2e7d32;
            --secondary-green: #81c784;
            --dark-green: #1b5e20;
            --light-green: #e8f5e9;
            --accent-teal: #26a69a;
            --white: #ffffff;
            --light-gray: #f5f5f5;
            --dark-gray: #333333;
            --vibrant-teal: #00BFA5;
            --warm-orange: #FF6D00;
            --form-bg: #f9fdfa;
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
            background: linear-gradient(135deg, #0a3a1e, #1B5E20);
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

        .sidebar-header h2 {
            font-size: 1.3rem;
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .sidebar-menu h3 {
            color: #FFEE58;
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
            color: #FFEE58;
        }

        .sidebar-menu li:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
        }

        .sidebar-menu li.active {
            background: #FFD700;
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

        /* Form Container */
        .request-container {
            background: var(--form-bg);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            max-width: 800px;
            margin: 0 auto;
        }

        .request-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--light-gray);
        }

        .request-header h1 {
            color: var(--dark-green);
            font-size: 1.8rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .back-btn {
            color: var(--dark-gray);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 5px;
            font-weight: 500;
        }

        .back-btn:hover {
            color: var(--warm-orange);
        }

        /* Form Grid Layout */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--dark-gray);
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--vibrant-teal);
            outline: none;
            box-shadow: 0 0 0 3px rgba(0, 191, 165, 0.1);
        }

        .form-full-width {
            grid-column: span 2;
        }

        /* Waste Type Selection */
        .waste-types {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
            gap: 15px;
            margin-top: 10px;
        }

        .waste-card {
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            padding: 15px 10px;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
            background-color: var(--white);
        }

        .waste-card:hover {
            border-color: var(--vibrant-teal);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 191, 165, 0.1);
        }

        .waste-card.selected {
            border-color: var(--vibrant-teal);
            background-color: rgba(0, 191, 165, 0.05);
        }

        .waste-icon {
            font-size: 1.8rem;
            color: var(--vibrant-teal);
            margin-bottom: 8px;
        }

        /* Form Actions */
        .form-actions {
            grid-column: span 2;
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 20px;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-cancel {
            background: var(--light-gray);
            color: var(--dark-gray);
        }

        .btn-cancel:hover {
            background: #e0e0e0;
        }

        .btn-submit {
            background: var(--vibrant-teal);
            color: white;
        }

        .btn-submit:hover {
            background: #00a992;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 191, 165, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            
            .main-content {
                margin-left: 0;
                width: 100%;
                padding: 20px;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .form-full-width {
                grid-column: span 1;
            }
            
            .form-actions {
                grid-column: span 1;
                justify-content: center;
            }
            
            .waste-types {
                grid-template-columns: repeat(2, 1fr);
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
                <li >
                    <a href="user_dashboard" class="nav-link">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="active">
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
                    <a href="user_ViewStatus" class="nav-link">
                        <i class="fas fa-history"></i>
                        <span>View Status</span>
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
            <h1>New Collection Request</h1>
            <div class="user-info">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User">
                <span>Welcome, User!</span>
            </div>
        </div>

        <!-- Request Form Container -->
        <div class="request-container">
            <div class="request-header">
                <h1><i class="fas fa-trash-alt"></i> Schedule Pickup</h1>
                <a href="user_ViewRecycler" class="back-btn">
                    <i class="fas fa-arrow-left"></i> Back to Recyclers
                </a>
            </div>

            <form id="collectionForm" action="SubmitCollectionRequest" method="post" class="form-grid">
               
               
             
             
               <div class="form-group">
                    <label for="recyclerName">Recycler Contact Id</label>
                    <input type="number" class="form-control" id="recyclerPhone" name="Phone" 
                           value="<%= request.getParameter("phone") %>" readonly>
                </div>

                <div class="form-group">
                    <label for="recyclerName">Recycler</label>
                    <input type="text" class="form-control" id="recyclerName" name="recyclerName" 
                           value="<%= request.getParameter("business_name") %>" readonly>
                </div>
                
                
                
                <div class="form-group">
                    <label for="pickupDate">Pickup Date</label>
                    <input type="date" class="form-control" id="pickupDate" name="pickupDate" required>
                </div>
                
                <div class="form-group">
                    <label for="pickupTime">Preferred Time</label>
                    <select class="form-control" id="pickupTime" name="pickupTime" required>
                        <option value="">Select Time Slot</option>
                        <option value="morning">Morning (8AM - 12PM)</option>
                        <option value="afternoon">Afternoon (12PM - 4PM)</option>
                        <option value="evening">Evening (4PM - 8PM)</option>
                    </select>
                </div>
                
                <div class="form-group form-full-width">
                    <label>Materials to Collect</label>
                    <div class="waste-types">
                        <div class="waste-card" onclick="selectWasteType(this, 'plastic')">
                            <div class="waste-icon">
                                <i class="fas fa-bottle-water"></i>
                            </div>
                            <h4>Plastic</h4>
                        </div>
                        <div class="waste-card" onclick="selectWasteType(this, 'paper')">
                            <div class="waste-icon">
                                <i class="fas fa-newspaper"></i>
                            </div>
                            <h4>Paper</h4>
                        </div>
                        <div class="waste-card" onclick="selectWasteType(this, 'glass')">
                            <div class="waste-icon">
                                <i class="fas fa-wine-glass"></i>
                            </div>
                            <h4>Glass</h4>
                        </div>
                        <div class="waste-card" onclick="selectWasteType(this, 'metal')">
                            <div class="waste-icon">
                                <i class="fas fa-cogs"></i>
                            </div>
                            <h4>Metal</h4>
                        </div>
                        <div class="waste-card" onclick="selectWasteType(this, 'ewaste')">
                            <div class="waste-icon">
                                <i class="fas fa-laptop"></i>
                            </div>
                            <h4>E-Waste</h4>
                        </div>
                        <div class="waste-card" onclick="selectWasteType(this, 'mixed')">
                            <div class="waste-icon">
                                <i class="fas fa-recycle"></i>
                            </div>
                            <h4>Mixed</h4>
                        </div>
                 
                    </div>
                </div>
                <div class="form-group form-full-width">
                    <label for="instructions">Materials</label>
                    <textarea class="form-control" id="instructions" name="materials1" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="quantity">Quantity (kg)</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                </div>
                
                <div class="form-group">
                    <label for="condition">Material Condition</label>
                    <select class="form-control" id="condition" name="condition">
                        <option value="clean">Clean and sorted</option>
                        <option value="mixed">Mixed but clean</option>
                        <option value="dirty">Needs cleaning</option>
                    </select>
                </div>
                
                <div class="form-group form-full-width">
                    <label for="address">Pickup Address</label>
                    <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                </div>
                
                <div class="form-group form-full-width">
                    <label for="instructions">Special Instructions</label>
                    <textarea class="form-control" id="instructions" name="instructions" rows="3"></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="button" class="btn btn-cancel" onclick="window.location.href='viewRecyclers'">
                        <i class="fas fa-times"></i> Cancel
                    </button>
                    <button type="submit" class="btn btn-submit">
                        <i class="fas fa-paper-plane"></i> Submit Request
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Set minimum date to today
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('pickupDate').min = today;
            
            // Set default time based on current time
            const now = new Date();
            const hours = now.getHours();
            let defaultTime = 'morning';
            
            if (hours >= 12) defaultTime = 'afternoon';
            if (hours >= 16) defaultTime = 'evening';
            
            document.getElementById('pickupTime').value = defaultTime;
            
            // Handle sidebar active state
            const currentPage = window.location.pathname.split('/').pop();
            const menuItems = document.querySelectorAll('.sidebar-menu li');
            
            menuItems.forEach(item => {
                const link = item.querySelector('a');
                if (link.getAttribute('href') === currentPage) {
                    item.classList.add('active');
                }
            });
        });

        // Waste type selection
        function selectWasteType(card, value) {
            // Remove selected class from all cards
            document.querySelectorAll('.waste-card').forEach(c => {
                c.classList.remove('selected');
                c.querySelector('input[type="radio"]').checked = false;
            });
            
            // Add selected class to clicked card
            card.classList.add('selected');
            card.querySelector('input[type="radio"]').checked = true;
        }
    </script>
</body>
</html>