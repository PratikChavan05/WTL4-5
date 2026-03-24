package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/ebookshop?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "pict123";

    // -------------------- DO GET --------------------
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>eBookShop Books</title>");
        out.println("<style>");
        out.println("body { font-family: Arial; background:#f4f4f9; padding:20px; }");
        out.println("table { border-collapse: collapse; width:80%; margin:auto; background:white; }");
        out.println("th, td { padding:10px; border:1px solid #ddd; }");
        out.println("th { background:#4CAF50; color:white; }");
        out.println("</style>");
        out.println("</head><body>");
        out.println("<h2 style='text-align:center;'>Available Books</h2>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "SELECT * FROM books";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            out.println("<table>");
            out.println("<tr><th>ID</th><th>Title</th><th>Author</th><th>Price</th><th>Quantity</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("book_id") + "</td>");
                out.println("<td>" + rs.getString("book_title") + "</td>");
                out.println("<td>" + rs.getString("book_author") + "</td>");
                out.println("<td>" + rs.getDouble("book_price") + "</td>");
                out.println("<td>" + rs.getInt("quantity") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }

        out.println("<br><div style='text-align:center;'>");
        out.println("<a href='index.jsp'>Add New Book</a>");
        out.println("</div>");

        out.println("</body></html>");
    }

    // -------------------- DO POST --------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String title = request.getParameter("book_title");
        String author = request.getParameter("book_author");
        double price = Double.parseDouble(request.getParameter("book_price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "INSERT INTO books (book_title, book_author, book_price, quantity) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, author);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);

            int rows = ps.executeUpdate();

            out.println("<html><body style='text-align:center;'>");

            if (rows > 0) {
                out.println("<h2 style='color:green;'>Book Added Successfully!</h2>");
            } else {
                out.println("<h2 style='color:red;'>Failed to Add Book</h2>");
            }

            out.println("<a href='BookListServlet'>View Books</a><br>");
            out.println("<a href='index.jsp'>Add Another Book</a>");
            out.println("</body></html>");

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
}

// mvn tomcat7:run
// mysql -u root -p < /home/pict/Documents/wtl2_assign5/db_setup.sql

// git config --global user.email"pratikpchavan75@gmail.com"
// git config --global user.name "PratikChavan05"