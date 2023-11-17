/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Minh
 */
public class UpdateDetail extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDetail at " + request.getContextPath () + "</h1>");
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
       String idraw=request.getParameter("id");
       request.setAttribute("det", da.getUD(Integer.parseInt(idraw)));
       request.getRequestDispatcher("editprofile.jsp").forward(request, response);
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
        String pass=request.getParameter("pass");
        String rep=request.getParameter("repass");
        String phone=request.getParameter("phone");
        String addr=request.getParameter("addr");
        String graw=request.getParameter("gender");
        String name=request.getParameter("un");
        User c=da.getUbyID(Integer.parseInt(id));
        if(id.isEmpty()||phone.isEmpty()||addr.isEmpty()||graw.isEmpty()||name.isEmpty()){
              request.setAttribute("det", da.getUD(Integer.parseInt(id)));
            request.setAttribute("err", "You must fill all the blanks");
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
        }else if(phone.length()!=10){
            request.setAttribute("det", da.getUD(Integer.parseInt(id)));
            request.setAttribute("err", "Phone number format mismatch");
                 request.getRequestDispatcher("editprofile.jsp").forward(request, response);}
            if(rep.isEmpty()&&!pass.isEmpty()){
                 request.setAttribute("det", da.getUD(Integer.parseInt(id)));
            request.setAttribute("err", "Please enter your new Password");
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            
            }else if(!c.getPassword().equals(pass)&&!rep.isEmpty()&&!pass.isEmpty()){
                 request.setAttribute("det", da.getUD(Integer.parseInt(id)));
            request.setAttribute("err", "Wrong password please retry");
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            }
            else if(pass.isEmpty()&&!rep.isEmpty()){
                 request.setAttribute("det", da.getUD(Integer.parseInt(id)));
            request.setAttribute("err", "Please validate your current password");
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            }
            else if(!rep.isEmpty()&&pass.equals(c.getPassword())){
                 da.editAcc(id, name, rep);
           da.editUD(id, phone, addr, Integer.parseInt(graw));
           request.setAttribute("err", "Successfully please login again");
           HttpSession ses=request.getSession();
           ses.invalidate();
                 request.getRequestDispatcher("login.jsp").forward(request, response);
            
        }
                else{
            da.editAcc(id, name, c.getPassword());
           da.editUD(id, phone, addr, Integer.parseInt(graw));
           request.setAttribute("err", "Successfully please login again");
           HttpSession ses=request.getSession();
           ses.invalidate();
                 request.getRequestDispatcher("login.jsp").forward(request, response);
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
