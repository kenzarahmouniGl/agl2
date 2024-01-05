package pack;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("role"); // Assuming "role" corresponds to user type

        // Check user credentials
        if (("gestionnaire".equals(username) && "gestionnaire".equals(password) && "gestionnaire".equals(userType))
                || ("bibliothecaire".equals(username) && "bibliothecaire".equals(password) && "bibliothecaire".equals(userType))) {
            // Set user information in session
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("userType", userType);

            // Redirect based on user type
            if ("gestionnaire".equals(userType)) {
                response.sendRedirect("gestion.jsp");
            } else if ("bibliothecaire".equals(userType)) {
                response.sendRedirect("gestionemprunt.jsp");
            } else {
                // Handle other user types or redirect to a default page
                response.sendRedirect("default.jsp");
            }
            return; // Add this line to exit the method after successful authentication
        }

        // Authentication failed, redirect back to login page with an error message
        response.sendRedirect("auth.jsp?error=true");
    }
}
