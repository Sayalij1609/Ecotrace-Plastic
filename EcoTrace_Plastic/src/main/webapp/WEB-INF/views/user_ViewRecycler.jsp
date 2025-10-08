<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.ecotrace.plastic.Model.Recycler"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Recyclers - EcoTrack User</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* ==================== THEME VARIABLES ==================== */
:root {
    /* Core Eco Colors */
    --primary-green: #2e7d32;
    --secondary-green: #81c784;
    --dark-green: #1b5e20;
    --light-green: #e8f5e9;
    
    /* Vibrant Accent Colors */
    --sunflower-yellow: #FFD700;
    --vibrant-teal: #00BFA5;
    --deep-blue: #2962FF;
    --warm-orange: #FF6D00;
    --soft-yellow: #FFEE58;
    --leaf-green: #4CAF50;
    
    /* Neutral Colors */
    --pure-white: #ffffff;
    --light-gray: #f5f5f5;
    --medium-gray: #e0e0e0;
    --dark-gray: #333333;
    --text-dark: #212121;
    
    /* Gradients */
    --sidebar-gradient: linear-gradient(135deg, #0a3a1e, #1B5E20);
    
    /* Shadows */
    --shadow-sm: 0 2px 8px rgba(0,0,0,0.1);
    --shadow-md: 0 4px 12px rgba(0,0,0,0.15);
}

/* ==================== BASE STYLES ==================== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background-color: var(--light-gray);
    color: var(--text-dark);
    display: flex;
    min-height: 100vh;
    line-height: 1.6;
}

/* ==================== SIDEBAR STYLES ==================== */
.sidebar {
    width: 280px;
    background: var(--sidebar-gradient);
    color: var(--pure-white);
    padding: 2rem 0;
    height: 100vh;
    position: fixed;
    box-shadow: var(--shadow-md);
    z-index: 100;
}

.sidebar-header {
    padding: 0 1.5rem 1.5rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    text-align: center;
}

.sidebar-header h2 {
    font-size: 1.5rem;
    font-weight: 600;
}

.sidebar-menu {
    padding: 1.5rem 0;
}

.sidebar-menu h3 {
    color: var(--soft-yellow);
    padding: 0 1.5rem;
    margin-bottom: 1rem;
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.sidebar-menu ul {
    list-style: none;
}

.sidebar-menu li {
    margin: 0.5rem 1rem;
    border-radius: 8px;
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.05);
}

.sidebar-menu li a {
    padding: 0.875rem 1.5rem;
    display: flex;
    align-items: center;
    color: var(--pure-white);
    text-decoration: none;
    font-size: 0.95rem;
}

.sidebar-menu li i {
    margin-right: 1rem;
    width: 24px;
    text-align: center;
    color: var(--soft-yellow);
}

.sidebar-menu li:hover {
    background: rgba(255, 255, 255, 0.15);
    transform: translateX(5px);
}

.sidebar-menu li.active {
    background: var(--sunflower-yellow);
    font-weight: 600;
    box-shadow: var(--shadow-sm);
}

.sidebar-menu li.active a,
.sidebar-menu li.active i {
    color: var(--dark-gray);
}

/* ==================== MAIN CONTENT ==================== */
.main-content {
    margin-left: 280px;
    width: calc(100% - 280px);
    padding: 2.5rem;
    min-height: 100vh;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    padding-bottom: 1.5rem;
    border-bottom: 1px solid var(--medium-gray);
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
    padding: 0.75rem 1.5rem;
    border-radius: 50px;
    box-shadow: var(--shadow-sm);
    transition: all 0.3s ease;
}

.user-info:hover {
    transform: translateY(-3px);
    box-shadow: var(--shadow-md);
}

.user-info img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 0.75rem;
    border: 2px solid var(--vibrant-teal);
}

/* ==================== CONTENT CONTAINER ==================== */
.content-container {
    background: var(--pure-white);
    border-radius: 12px;
    padding: 1.5rem;
    box-shadow: var(--shadow-sm);
}

.search-box {
    position: relative;
    margin-bottom: 1.5rem;
    max-width: 300px;
}

.search-box input {
    width: 100%;
    padding: 0.75rem 1rem 0.75rem 2.5rem;
    border: 1px solid var(--medium-gray);
    border-radius: 8px;
    font-size: 0.95rem;
    transition: all 0.3s ease;
}

.search-box input:focus {
    border-color: var(--vibrant-teal);
    outline: none;
    box-shadow: 0 0 0 3px rgba(0, 191, 165, 0.1);
}

.search-box i {
    position: absolute;
    left: 1rem;
    top: 50%;
    transform: translateY(-50%);
    color: var(--text-dark);
    opacity: 0.6;
}

/* ==================== RECYCLERS TABLE ==================== */
.recyclers-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 1.5rem;
    font-size: 0.95rem;
}

.recyclers-table thead {
    background: var(--primary-green);
    color: var(--pure-white);
}

.recyclers-table th {
    padding: 1rem;
    text-align: left;
    font-weight: 500;
    text-transform: uppercase;
    font-size: 0.85rem;
    letter-spacing: 0.5px;
}

.recyclers-table td {
    padding: 1rem;
    border-bottom: 1px solid var(--medium-gray);
    vertical-align: middle;
}

.recyclers-table tbody tr {
    transition: all 0.2s ease;
}

.recyclers-table tbody tr:hover {
    background-color: rgba(38, 166, 154, 0.05);
}

/* ==================== ACTION BUTTONS ==================== */
.action-btn {
    padding: 0.75rem 1.25rem;
    border-radius: 6px;
    font-size: 0.9rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    border: none;
}

.btn-request {
    background-color: var(--warm-orange);
    color: var(--pure-white);
}

.btn-request:hover {
    background-color: #e65100;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(255, 109, 0, 0.2);
}

.btn-request i {
    margin-right: 0.5rem;
}

/* ==================== EMPTY STATE ==================== */
.empty-state {
    text-align: center;
    padding: 2.5rem;
    color: var(--text-dark);
    opacity: 0.7;
}

/* ==================== RESPONSIVE DESIGN ==================== */
@media (max-width: 992px) {
    .sidebar {
        width: 240px;
    }
    
    .main-content {
        margin-left: 240px;
        width: calc(100% - 240px);
        padding: 1.5rem;
    }
    
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
    
    .header {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .user-info {
        margin-top: 1rem;
    }
}

@media (max-width: 576px) {
    .header h1 {
        font-size: 1.75rem;
    }
    
    .recyclers-table td, 
    .recyclers-table th {
        padding: 0.75rem 0.5rem;
    }
    
    .action-btn {
        padding: 0.5rem 0.75rem;
        font-size: 0.8rem;
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
                <li >
                    <a href="user_requestForm" class="nav-link">
                        <i class="fas fa-plus-circle"></i>
                        <span>Submit Collection Request</span>
                    </a>
                </li>
                <li class="active">
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
			<h1>Available Recyclers</h1>
			<div class="user-info">
				<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
					alt="User"> <span>Welcome, User!</span>
			</div>
		</div>

		<!-- Content Container -->
		<div class="content-container">
			<div class="search-box">
				<i class="fas fa-search"></i> <input type="text" id="searchInput"
					placeholder="Search recyclers...">
			</div>

			<table class="recyclers-table">
				<thead>
					<tr>
						<th>Business Name</th>
						<th>Materials Accepted</th>
						<th>Service Area</th>
						<th>City</th>
						<th>Address</th>
						<th>Contact</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Recycler> recyclers = (List<Recycler>) request.getAttribute("recyclers");
						if (recyclers != null && !recyclers.isEmpty()) {
							for (Recycler recycler : recyclers) {
					%>
					<tr>
						<td><strong><%=recycler.getBusiness_name()%></strong></td>
						<td><%=recycler.getMaterials()%></td>
						<td><%=recycler.getService_area()%></td>
						<td><%=recycler.getCity()%></td>
						<td><%=recycler.getAddress() %></td>
						<td><strong><%=recycler.getPhone()%></strong></td>
						<td>
						<td>
							<%
								String businessName = recycler.getBusiness_name() != null ? recycler.getBusiness_name() : "";
										long phone = recycler.getPhone(); // primitive long can't be null
										String encodedName = URLEncoder.encode(businessName, "UTF-8");
										String encodedPhone = URLEncoder.encode(String.valueOf(phone), "UTF-8");
							%> <a
							href="user_requestForm?business_name=<%=encodedName%>&phone=<%=encodedPhone%>"
							class="action-btn btn-request"> <i class="fas fa-plus-circle"></i>
								Request Pickup
						</a>
						</td>
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="6" style="text-align: center; padding: 20px;">No
							recyclers found in your area</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
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
            });

            // Search functionality
            document.getElementById('searchInput').addEventListener('keyup', function() {
                const input = this.value.toLowerCase();
                const rows = document.querySelectorAll('.recyclers-table tbody tr');
                
                rows.forEach(row => {
                    const text = row.textContent.toLowerCase();
                    row.style.display = text.includes(input) ? '' : 'none';
                });
            });
        });
    </script>
</body>
</html>