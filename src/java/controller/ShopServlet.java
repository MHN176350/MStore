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
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.Publisher;

/**
 *
 * @author Minh
 */
@WebServlet(name = "ShopServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

  

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            this.doGet(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          List<Product> listpro = new ArrayList<>();
        DAO da = new DAO();
        request.setAttribute("pubs", da.getAllPub());
        request.setAttribute("genre", da.getGenre());
        String pub=request.getParameter("pub");
        String gen=request.getParameter("gen");
        if(pub==null){
            pub="";
        }
        if(gen==null){
            gen="";
        }
        if (gen.equals("") && pub.equals("")) {
            String index = request.getParameter("in");
            if (index == null) {
                index = "1";
            }
            int page = (da.pCount()) / 8;
            if (da.pCount() % 8 != 0) {
                page++;
            }
            listpro=da.getPProduct(index);
            request.setAttribute("pros", listpro);
            request.setAttribute("page", page);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else if (!pub.equals("") && gen.equals("")) {
         
          
                
                listpro = da.getPd(Integer.parseInt(pub), "");
                request.setAttribute("publish", da.getPubbyID(Integer.parseInt(pub)));
                request.setAttribute("pros", listpro);
                request.setAttribute("re", listpro.size());
                request.getRequestDispatcher("shop.jsp").forward(request, response);
         
        } else if (!gen.equals("")&&pub.equals("")) {
            listpro = da.getPd(0, gen);
            request.setAttribute("pros", listpro);
           
            request.setAttribute("re",listpro.size());
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else {
        
             
                listpro = da.getPd(Integer.parseInt(pub), gen);
                request.setAttribute("publish", da.getPubbyID(Integer.parseInt(pub)));
                request.setAttribute("pros", listpro);
                request.setAttribute("re", listpro.size());
                request.getRequestDispatcher("shop.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO da = new DAO();
        String s = request.getParameter("s");
        List<Product> list = new ArrayList<>();
        String pri = request.getParameter("pri");
        String sort=request.getParameter("sort");
        if(pri==null){
            pri="";
        }
        if (s != null) {
            list = da.search(s);
        }
        if(sort==null){
            sort="";
        }
       if(!sort.equals("")){
             
            switch (sort) {
                case "o":
                    list = da.getPbyOrder("p_id");
                    break;
                case "up":
                     list = da.getPbyOrder("p_price");
                    break;
                case "dp":
                    list = da.getPbyOrder("p_price desc");
                    break;
                case "n":
                   list = da.getPbyOrder("p_id desc");
                    break;
                default:
                  list = da.getPbyOrder("p_title");
                    break;
        }
            
        }
       if(!pri.equals("")){
           list=da.getPbyPrice(pri);
                   }
        if (list.isEmpty()) {
            request.setAttribute("er", "Nothing found");
            request.setAttribute("mes", "The product you are looking for may not in our shop");
        }

        request.setAttribute("pros", list);
        List<Publisher> listpub = da.getAllPub();
        request.setAttribute("re", list.size());
        request.setAttribute("genre", da.getGenre());
        request.setAttribute("pubs", listpub);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
