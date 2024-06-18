/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

/**
 *
 * @author nguyen
 */
import DB.DBConnection;
import Models.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author lhhuong
 */
public class CustomerDAO {
    
    /**
     * Lay toan bo danh sach khach hang
     * @return mot rs chua danh sach khach hang
     */
     public boolean login(Customer acc) {
        Connection conn = DBConnection.getConnection();
        try {
            String sql = "select * from account where username=? and password=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, acc.getUsername());
            pst.setString(2, acc.getPassword());
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                // Set the fullname into the account object
                acc.setFullname(rs.getString("fullname"));
                return true;
            }
        } catch (Exception ex) {
            return false;
        }
        return false;
    }
    public ResultSet getAll(){
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;
        if(conn != null){
            try{
                Statement st = conn.createStatement();
                rs = st.executeQuery("select * from account");
            }
            catch(Exception ex){
                rs = null;
            }
        }
        return rs;
    }
}
