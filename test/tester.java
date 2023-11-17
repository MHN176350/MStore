
import dal.DAO;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.Product;
import model.Publisher;
import model.TopSell;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Minh
 */
public class tester {
    public static void main(String[] args) {
        DAO da=new DAO();
        da.deleteU("2");
    }
}
