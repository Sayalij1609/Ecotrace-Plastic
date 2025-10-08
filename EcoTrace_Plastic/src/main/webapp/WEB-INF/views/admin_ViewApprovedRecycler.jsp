<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.ecotrace.plastic.Model.Recycler" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Recyclers - EcoTrack Admin</title>
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
            --medium-gray: #e0e0e0;
            --dark-gray: #333333;
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

        /* Content Container */
        .content-container {
            background-color: var(--white);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        /* Search and Filter */
        .search-filter {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .search-box {
            flex: 1;
            max-width: 300px;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-size: 0.95rem;
        }

        .search-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--dark-gray);
            opacity: 0.7;
        }

        .filter-select {
            padding: 10px 15px;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-size: 0.95rem;
            margin-left: 15px;
        }

        /* Enhanced Table Styles with Outlines */
.recyclers-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 20px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    border-radius: 10px;
    overflow: hidden;
    font-size: 0.95rem;
    border: 1px solid var(--medium-gray); /* Added table outline */
}

.recyclers-table thead {
    background: var(--dark-green);
    color: white;
}

.recyclers-table th {
    padding: 15px;
    text-align: left;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-size: 0.85rem;
    border-right: 1px solid rgba(255, 255, 255, 0.2); /* Column divider for headers */
    position: relative;
}

.recyclers-table th:last-child {
    border-right: none; /* Remove right border for last column */
}

.recyclers-table td {
    padding: 12px 15px;
    border-bottom: 1px solid var(--medium-gray);
    border-right: 1px solid var(--medium-gray); /* Column divider for cells */
    vertical-align: middle;
    position: relative;
}

.recyclers-table td:last-child {
    border-right: none; /* Remove right border for last column */
}

.recyclers-table tbody tr {
    transition: all 0.2s ease;
    position: relative;
}

.recyclers-table tbody tr:not(:last-child) td {
    border-bottom: 1px solid var(--medium-gray);
}

.recyclers-table tbody tr:hover {
    background-color: rgba(0, 191, 165, 0.05);
    transform: translateY(-1px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

/* Optional: Add subtle highlight to the first column */
.recyclers-table td:first-child {
    border-left: 2px solid var(--accent-teal);
}

/* Optional: Add corner rounding to first and last cells in each row */
.recyclers-table tr:first-child th:first-child {
    border-top-left-radius: 10px;
}
.recyclers-table tr:first-child th:last-child {
    border-top-right-radius: 10px;
}
.recyclers-table tr:last-child td:first-child {
    border-bottom-left-radius: 10px;
}
.recyclers-table tr:last-child td:last-child {
    border-bottom-right-radius: 10px;
}
        /* Enhanced Status Badges */
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: inline-block;
            min-width: 80px;
            text-align: center;
        }

        .status-pending {
            background-color: #FFF3E0;
            color: #FF6D00;
            border: 1px solid #FFB74D;
        }

        .status-approved {
            background-color: #E8F5E9;
            color: #2E7D32;
            border: 1px solid #81C784;
        }

        .status-rejected {
            background-color: #FFEBEE;
            color: #C62828;
            border: 1px solid #EF9A9A;
        }

        /* Modern Action Buttons */
        .action-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-right: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .action-btn i {
            margin-right: 5px;
            font-size: 0.9rem;
        }

        .btn-view {
            background-color: var(--deep-blue);
            color: white;
        }

        .btn-view:hover {
            background-color: #1A56FF;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(41, 98, 255, 0.2);
        }

        .btn-delete {
            background-color: #EF5350;
            color: white;
        }

        .btn-delete:hover {
            background-color: #D32F2F;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(239, 83, 80, 0.2);
        }

        /* Action Button Group */
        .action-btns {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        /* Confirmation Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: var(--white);
            margin: 15% auto;
            padding: 25px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--light-gray);
        }

        .modal-header h2 {
            color: var(--dark-green);
            font-size: 1.5rem;
        }

        .close {
            color: var(--dark-gray);
            font-size: 1.5rem;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover {
            color: #EF5350;
        }

        .modal-body {
            margin-bottom: 20px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn-cancel {
            background-color: var(--medium-gray);
            color: var(--dark-gray);
        }

        .btn-cancel:hover {
            background-color: #d0d0d0;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .recyclers-table {
                display: block;
                overflow-x: auto;
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
            
            .search-filter {
                flex-direction: column;
            }
            
            .search-box {
                max-width: 100%;
                margin-bottom: 15px;
            }
            
            .filter-select {
                margin-left: 0;
                width: 100%;
            }
            
            .action-btns {
                flex-direction: column;
                gap: 5px;
            }
            
            .action-btn {
                width: 100%;
                margin-right: 0;
            }
            
            .modal-content {
                width: 90%;
                margin: 20% auto;
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
                <li>
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
                <li  class="active">
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
        <h1>Approved Recyclers</h1>
        <div class="user-info">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Admin">
            <span>Welcome, Admin!</span>
        </div>
    </div>

    <!-- Content Container -->
    <div class="content-container">
        <div class="search-filter">
            <!-- Optional search bar -->
        </div>

        <table class="recyclers-table">
            <thead>
                <tr>
                    <th>Contact ID</th>
                    <th>Business Name</th>
                    <th>Reg No</th>
                    <th>Email</th>
                    <th>Materials</th>
                    <th>City</th>
                    <th>Address</th>
                    <th>Service Area</th>
                    <th>Years in Business</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Recycler> recyclers = (List<Recycler>) request.getAttribute("recyclers"); 
                    if (recyclers != null && !recyclers.isEmpty()) {
                        for (Recycler recycler : recyclers) { 
                            if ("approved".equalsIgnoreCase(recycler.getStatus())) {
                %>
                <tr>
                    <td><%= recycler.getPhone() %></td>
                    <td><strong><%= recycler.getBusiness_name() %></strong></td>
                    <td><%= recycler.getReg_number() %></td>
                    <td><%= recycler.getEmail() %></td>
                    <td><%= recycler.getMaterials() %></td>
                    <td><%= recycler.getCity() %></td>
                    <td><%= recycler.getAddress() %></td>
                    <td><%= recycler.getService_area() %></td>
                    <td><%= recycler.getYears_in_business() %></td>
                </tr>
                <%
                            }
                        } 
                    } else { 
                %>
                <tr>
                    <td colspan="8" style="text-align:center; padding:20px;">No approved recyclers found</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const menuItems = document.querySelectorAll('.sidebar-menu li');
            const currentPage = window.location.pathname.split('/').pop();

            menuItems.forEach(item => {
                const link = item.querySelector('a');
                if (link && link.getAttribute('href') === currentPage) {
                    item.classList.add('active');
                }
            });

           
        });

        
        }
    </script>
</body>
</html>