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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;
import model.Publisher;

/**
 *
 * @author Minh
 */
@WebServlet(name="AddServlet", urlPatterns={"/add"})
public class AddServlet extends HttpServlet {
   
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
            this.doGet(request, response);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddServlet at " + request.getContextPath () + "</h1>");
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
        DAO da=new DAO();
        List <Publisher> list=da.getAllPub();
        request.setAttribute("pub", list);
        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
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
       String title=request.getParameter("title");
       String  pidraw=request.getParameter("pub");
       String priceraw=request.getParameter("price");
       String desc=request.getParameter("desc");
       String icon=request.getParameter("icon");
       String gen=request.getParameter("gen");
       int  pid, price;
       List<Product>  listp=da.getAllProduct();
       for(int i=0;i<listp.size();i++){
           if(listp.get(i).getTitle().equalsIgnoreCase(title)){
               request.setAttribute("err", "Product already exist");
               request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
           }
       }
       if(title.isEmpty()||pidraw.isEmpty()||priceraw.isEmpty()||desc.isEmpty()||desc.isEmpty()||icon.isEmpty()||gen.isEmpty()){
           request.setAttribute("err", "Please fill all the information");
           List <Publisher> list=da.getAllPub();
        request.setAttribute("pub", list);
           request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
       }
       else
        try {
            pid=Integer.parseInt(pidraw);
            price=Integer.parseInt(priceraw);
          
            da.AddP(title, pid, price, icon, desc, gen);
            List <Publisher> list=da.getAllPub();
        request.setAttribute("pub", list);
          request.setAttribute("err", "Add Successfully");
           request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
        } catch (Exception e) {
        }
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
