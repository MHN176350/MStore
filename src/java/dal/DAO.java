/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Item;
import model.OShow;
import model.Order;
import model.Product;
import model.Publisher;
import model.Review;
import model.TopBuy;
import model.TopP;
import model.TopSell;
import model.Topup;
import model.UDetail;
import model.User;

/**
 *
 * @author Minh
 */
public class DAO extends DBContext {

    public User check(String mail, String pass) {
        try {

            String com = "SELECT * FROM web_user where c_mail=? and c_password=?";

            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, mail);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void Insert(String un, String pass, String mail, int role) {
        String comm = "INSERT INTO [dbo].[web_user]\n"
                + "           ([c_username]"
                + "           ,[c_password]"
                + "           ,[c_mail]"
                + "           ,[c_role])"
                + "     VALUES"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(comm);
            st.setString(1, un);
            st.setString(2, pass);
            st.setString(3, mail);
            st.setInt(4, role);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public User check2(String mail) {
        try {

            String com = "SELECT * FROM web_user where c_mail=?";

            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void AddP(String title, int pid, int price, String icon, String describe, String genre) {
        String com = "INSERT INTO [dbo].[Product]\n"
                + "           ([p_title]\n"
                + "           ,[p_pid]\n"
                + "           ,[p_price]\n"
                + "           ,[p_icon]\n"
                + "           ,[p_describe]\n"
                + "           ,[p_genre])\n"
                + "     VALUES(?,?,?,?,?,?)";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(com);
            st.setString(1, title);
            st.setInt(2, pid);
            st.setInt(3, price);
            st.setString(4, icon);
            st.setString(5, describe);
            st.setString(6, genre);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Publisher> getAllPub() {
        List<Publisher> list = new ArrayList<>();
        String com = "Select * from publisher";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Publisher p = new Publisher(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getAllProduct() {
        String com = "SELECT [p_id]\n"
                + "      ,[p_title]\n"
                + "      ,[p_pid]\n"
                + "      ,[p_price]\n"
                + "      ,[p_icon]\n"
                + "      ,[p_describe]\n"
                + "      ,[p_genre]\n"
                + "  FROM [dbo].[Product]";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductbyID(int id) {
        String com = "SELECT [p_id]\n"
                + "      ,[p_title]\n"
                + "      ,[p_pid]\n"
                + "      ,[p_price]\n"
                + "      ,[p_icon]\n"
                + "      ,[p_describe]\n"
                + "      ,[p_genre]\n"
                + "  FROM [dbo].[Product] where [p_id]=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Publisher getPubbyID(int id) {
        String com = "Select * from publisher where id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Publisher p = new Publisher(rs.getInt(1), rs.getString(2), rs.getString(3));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getProductbyGen(String gen) {
        String com = "SELECT [p_id]\n"
                + "      ,[p_title]\n"
                + "      ,[p_pid]\n"
                + "      ,[p_price]\n"
                + "      ,[p_icon]\n"
                + "      ,[p_describe]\n"
                + "      ,[p_genre]\n"
                + "  FROM [dbo].[Product] where p_genre=?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, gen);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public List<Product> getLatest() {
        String com = "SELECT top 3 [p_id]\n"
                + "      ,[p_title]\n"
                + "      ,[p_pid]\n"
                + "      ,[p_price]\n"
                + "      ,[p_icon]\n"
                + "      ,[p_describe]\n"
                + "      ,[p_genre]\n"
                + "  FROM [eShop].[dbo].[Product] order by p_id desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> search(String s) {
        List<Product> list = new ArrayList<>();
        s = s.toLowerCase();
        String com = "Select * from  dbo.Product  where LOWER([p_title]) like '%" + s + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addOrder(User c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add order
            String sql = "insert into [Order] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, c.getId());
            st.setInt(3, cart.getTotalMoney());
            st.executeUpdate();

            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [OrderDetail] values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setInt(4, i.getPrice());
                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {

        }
    }

    public List<Product> getPd(int pid, String gen) {

        String com = "Select * from Product  where";

        List<Product> list = new ArrayList<>();
        if (pid != 0 && "".equals(gen)) {
            com = com + " p_pid=?";
        } else if (pid == 0 && !"".equals(gen)) {
            com = com + " p_genre=?";
        } else {
            com = com + " p_pid=? and p_genre=?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(com);
            if (pid != 0 && "".equals(gen)) {
                st.setInt(1, pid);
            } else if (pid == 0 && !"".equals(gen)) {
                st.setString(1, gen);
            } else {
                st.setInt(1, pid);
                st.setString(2, gen);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int pCount() {
        String com = "Select count(*) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> getPProduct(String s) {
        int i = Integer.parseInt(s);
        String com = "Select * from Product order by p_id OFFSET " + (i - 1) * 8 + "  Row Fetch next 8 ROWS ONLY";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public List<String> getGenre() {
        String com = "Select p_genre from Product group by p_genre";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String s = rs.getString(1);
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void EditP(int id, String title, int pid, int price, String icon, String describe, String genre) {
        String com = "UPDATE [dbo].[Product]\n"
                + "   SET [p_title] = ?\n"
                + "      ,[p_pid] = ?\n"
                + "      ,[p_price] = ?\n"
                + "      ,[p_icon] = ?\n"
                + "      ,[p_describe] = ?\n"
                + "      ,[p_genre] = ?\n"
                + " WHERE p_id=?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(com);
            st.setString(1, title);
            st.setInt(2, pid);
            st.setInt(3, price);
            st.setString(4, icon);
            st.setString(5, describe);
            st.setString(6, genre);
            st.setInt(7, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void del(int id) {
        String com = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE p_id=?";
        String com1 = "DELETE FROM [dbo].[Review]\n"
                + "      WHERE p_id=?";
        String com2 = "DELETE FROM [dbo].[OrderDetail]\n"
                + "      WHERE p_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            PreparedStatement st1 = connection.prepareStatement(com1);
            PreparedStatement st2 = connection.prepareStatement(com2);
            st.setInt(1, id);
            st1.setInt(1, id);
            st2.setInt(1, id);
            st1.executeUpdate();
            st2.executeUpdate();
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertUD(int id, String phone, String address, int gender) {
        String com = "INSERT INTO [dbo].[User_detail]\n"
                + "           ([id]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[gender])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setInt(1, id);
            st.setString(2, phone);
            st.setString(3, address);
            st.setInt(4, gender);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void editUD(String id, String phone, String address, int gender) {
        String com = "UPDATE [dbo].[User_detail]\n"
                + "   SET "
                + "       [phone] =?\n"
                + "      ,[address] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, phone);
            st.setString(2, address);
            st.setInt(3, gender);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public UDetail getUD(int id) {
        String com = "SELECT *  FROM [dbo].[User_detail] where id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UDetail u = new UDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUbyID(int id) {
        try {

            String com = "SELECT * FROM web_user where c_id=" + id;

            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editAcc(String id, String name, String pass) {
        String com = "UPDATE [dbo].[web_user]\n"
                + "   SET [c_username] = ?\n"
                + "      ,[c_password] = ?\n"
                + " WHERE c_id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, name);
            st.setString(2, pass);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<User> getAllU() {
        List<User> list = new ArrayList<>();
        String com = "Select * from dbo.web_user where c_id!=1";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                list.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteU(String id) {
        String com = "DELETE FROM [dbo].[web_user]\n"
                + "      WHERE c_id=" + id;
        String com1 = "DELETE FROM [dbo].[User_detail]\n"
                + "      WHERE id=" + id;
        String com2 = "DELETE FROM [dbo].[queque]\n"
                + "      WHERE c_id=" + id;
        List<Order> list = this.getObyID(id);
        for (int i = 0; i < list.size(); i++) {
            String com4 = "DELETE FROM [dbo].[OrderDetail]\n"
                    + "      WHERE o_id=" + list.get(i).getId();
            try {
                PreparedStatement st = connection.prepareStatement(com4);
                st.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        String com3 = "DELETE FROM [dbo].[Order]\n"
                + "      WHERE u_id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            PreparedStatement st1 = connection.prepareStatement(com1);
            PreparedStatement st2 = connection.prepareStatement(com2);
            PreparedStatement st3 = connection.prepareStatement(com3);
            st3.executeUpdate();
            st2.executeUpdate();
            st1.executeUpdate();
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editRole(String id, String role) {
        String com = "UPDATE [dbo].[web_user]\n"
                + "   SET [c_role] = ?"
                + " WHERE c_id=" + id;
        int r = Integer.parseInt(role);
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setInt(1, r);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Product> getRandP(String num) {
        int i = Integer.parseInt(num);
        String com = "SELECT TOP " + i + " * from dbo.Product\n"
                + "ORDER BY NEWID()";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public void addReview(String pid, String uid, String uname, String content) {
        String com = "INSERT INTO [dbo].[Review]\n"
                + "           ([p_id]\n"
                + "           ,[u_id]\n"
                + "           ,[u_name]\n"
                + "           ,[content])\n"
                + "     VALUES\n"
                + "           (" + pid + "\n"
                + "           ," + uid + "\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, uname);
            st.setString(2, content);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Review> getReviewByID(String id) {
        List<Review> list = new ArrayList<>();
        String com = "Select * from Review where p_id=? order by id asc";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setInt(1, Integer.parseInt(id));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Review r = new Review(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                list.add(r);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateBalance(int id, int bal) {
        String com = "UPDATE [dbo].[web_user]\n"
                + "   SET \n"
                + "      [c_balance] = ?\n"
                + " WHERE c_id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setInt(1, bal);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Order> getObyID(String id) {
        String com;
        if (!id.equals("0")) {
            com = "Select o.id,o.p_date,o.u_id,o.total, w.c_username from dbo.[Order] o left join dbo.web_user w\n"
                    + "on w.c_id=o.u_id where o.u_id=" + id;
        } else {
            com = "Select o.id,o.p_date,o.u_id,o.total, w.c_username from dbo.[Order] o left join dbo.web_user w\n"
                    + "on w.c_id=o.u_id";
        }
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<OShow> getODetail(String id) {
        String com = "SELECT p.p_title,p_icon, price, quantity from dbo.OrderDetail o left join dbo.Product p\n"
                + "on o.p_id=p.p_id where o.o_id=" + id;
        List<OShow> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OShow o = new OShow(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getPbyOrder(String s) {
        String com = "SELECT [p_id]\n"
                + "      ,[p_title]\n"
                + "      ,[p_pid]\n"
                + "      ,[p_price]\n"
                + "      ,[p_icon]\n"
                + "      ,[p_describe]\n"
                + "      ,[p_genre]\n"
                + "  FROM [dbo].[Product] order by " + s;
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<TopSell> getTSeller() {
        String com = "Select top 5 o.p_id,p.p_title ,Sum(quantity)*100/MAX(Sum(quantity)) over() as percentage from dbo.OrderDetail o  left join dbo.Product p on p.p_id=o.p_id\n"
                + "group by o.p_id,p.p_title order by percentage desc   ";
        List<TopSell> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TopSell t = new TopSell(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<TopBuy> getTBuy() {
        String com = "select TOP 5 w.c_username,SUM(o.total)*100/MAX(SUM(o.total)) over() as Total from dbo.[Order] o left join dbo.web_user w on o.u_id=w.c_id group by w.c_username order by Total desc";
        List<TopBuy> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TopBuy t = new TopBuy(rs.getString(1), rs.getInt(2));
                list.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getIncome(int m) {
        String com = "select sum(o.total) from dbo.[Order] o\n"
                + "where MONTH(o.p_date)=" + m;

        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void addPub(String name, String desc) {
        String com = "INSERT INTO [dbo].[publisher]\n"
                + "           ([p_name]\n"
                + "           ,[p_desc])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, name);
            st.setString(2, desc);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<TopP> TopSell() {
        String com = "Select top 3 o.p_id,p_title,p.p_icon,p.p_price,Sum(quantity)*100/MAX(Sum(quantity)) over() as percentage from dbo.OrderDetail o  left join dbo.Product p on p.p_id=o.p_id\n"
                + "    group by o.p_id,p.p_title,p.p_icon,p.p_price order by percentage desc";
        List<TopP> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TopP t = new TopP(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(t);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public User FPass(String mail, String name) {
        try {

            String com = "SELECT * FROM web_user where c_mail=? and c_username=?";

            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, mail);
            st.setString(2, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void delPub(String id) {
        String com = "Select p_id from dbo.Product where p_pid=" + id;
        List<Integer> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (int i = 0; i < list.size(); i++) {
            this.del(list.get(i));
        }
        String com1 = "DELETE FROM [dbo].[publisher]\n"
                + "      WHERE id=" + id;
        try {
            PreparedStatement st1 = connection.prepareStatement(com1);
            st1.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void newQueque(int id, int amt) {
        String com = "INSERT INTO [dbo].[queque]\n"
                + "           ([c_id]\n"
                + "           ,[amount])\n"
                + "     VALUES(?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.setInt(1, id);
            st.setInt(2, amt);
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Topup> getTop() {
        List<Topup> list = new ArrayList<>();
        String com = "select q.id, q.c_id, w.c_username, q.amount, q.[date] from dbo.queque q left join dbo.web_user w on w.c_id=q.c_id ";
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Topup t = new Topup(rs.getInt(1), rs.getInt(2), rs.getInt(4), rs.getString(3), rs.getString(5));
                list.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deltop(String id) {
        String com = "DELETE FROM [dbo].[queque]\n"
                + "      WHERE id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(com);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Product> getPbyPrice(String s) {
        String com = "select * from Product p\n"
                + "where p.p_price<="+s+" order by p_price desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }
}
