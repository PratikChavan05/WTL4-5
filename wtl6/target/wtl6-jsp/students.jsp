<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Students Information</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            color: white;
            font-size: 32px;
            margin-bottom: 8px;
        }
        .header p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 16px;
        }
        .card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }
        .card-header {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 20px 30px;
            font-size: 18px;
            font-weight: 600;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            background: #f8f9ff;
            color: #333;
            padding: 14px 20px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #e8e8e8;
        }
        td {
            padding: 14px 20px;
            color: #555;
            font-size: 15px;
            border-bottom: 1px solid #f0f0f0;
        }
        tr:hover td {
            background-color: #f8f9ff;
        }
        tr:last-child td {
            border-bottom: none;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: white;
            text-decoration: none;
            font-size: 15px;
            opacity: 0.9;
        }
        .back-link:hover {
            opacity: 1;
            text-decoration: underline;
        }
        .error-box {
            background: #fff0f0;
            border: 1px solid #ffcccc;
            color: #cc0000;
            padding: 20px 30px;
            border-radius: 12px;
            margin-top: 10px;
        }
        .stud-id {
            font-weight: 600;
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Students Information</h1>
            <p>Records fetched from MySQL database using JSP</p>
        </div>

        <div class="card">
            <div class="card-header">students_info Table</div>

            <%
                // Database connection parameters
                String dbURL = "jdbc:mysql://localhost:3306/student_db";
                String dbUser = "root";
                String dbPassword = "root";

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // Execute query
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM students_info";
                    rs = stmt.executeQuery(sql);
            %>

            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Class</th>
                        <th>Division</th>
                        <th>City</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="stud-id"><%= rs.getInt("stud_id") %></td>
                        <td><%= rs.getString("stud_name") %></td>
                        <td><%= rs.getString("class") %></td>
                        <td><%= rs.getString("division") %></td>
                        <td><%= rs.getString("city") %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <%
                } catch (Exception e) {
            %>
                <div class="error-box">
                    <strong>Database Error:</strong> <%= e.getMessage() %>
                </div>
            <%
                } finally {
                    // Close resources
                    try { if (rs != null) rs.close(); } catch (SQLException e) {}
                    try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
                    try { if (conn != null) conn.close(); } catch (SQLException e) {}
                }
            %>
        </div>

        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>
</body>
</html>
