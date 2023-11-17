/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Product;
import model.Publisher;

/**
 *
 * @author Minh
 */
@WebServlet(name="SingleServlet", urlPatterns={"/single"})
public class SingleServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SingleServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SingleServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String idraw= request.getParameter("id");
       DAO da=new DAO();
       int id=Integer.parseInt(idraw);
       Product d=da.getProductbyID(id);
       Publisher p=da.getPubbyID(d.getPid());
       request.setAttribute("p", d);
       request.setAttribute("pub", p);
       List<Product> gen=da.getProductbyGen(d.getGenre());
       for(int i=0; i<gen.size();i++){
           if(gen.get(i).getId()==d.getId()){
               gen.remove(i);
           }
       }
        
       
       request.setAttribute("cmt", da.getReviewByID(idraw));
       request.setAttribute("oth", da.getRandP("4"));
       request.setAttribute("gen", gen);
       request.getRequestDispatcher("single.jsp").forward(request, response);
       
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO da=new DAO();
        String id=request.getParameter("id");
        String uid=request.getParameter("uid");
        String name=request.getParameter("uname");
        String cmt=request.getParameter("review");
        da.addReview(id, uid, name, cmt);
       response.sendRedirect("single?id="+id);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
