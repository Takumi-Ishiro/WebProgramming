package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class User_dataDao {
		//データベースのデータ全取得
	    public List<User> findAll() {
	        Connection conn = null;
	        List<User> userList = new ArrayList<User>();

	        try {
	            // データベースへ接続
	            conn = DBManager.getConnection();

	            // SELECT文を準備
	            String sql = "SELECT id, login_id, name, birth_date, password, create_date, update_date FROM user_data";

	             // SELECTを実行し、結果表を取得
	            Statement stmt = conn.createStatement();
	            ResultSet rs = stmt.executeQuery(sql);

	            // 結果表に格納されたレコードの内容を
	            // Userインスタンスに設定し、ArrayListインスタンスに追加
	            while (rs.next()) {
	                String id = rs.getString("id");
	                String login_id = rs.getString("login_id");
	                String name= rs.getString("name");
	                String birth_date = rs.getString("birth_date");
	                String password = rs.getString("password");
	                String create_date = rs.getString("create_date");
	                String update_date = rs.getString("update_date");
	                User user = new User(id, login_id, name, birth_date, password, create_date, update_date);
	                userList.add(user);
	            }
	        } catch (SQLException e) {
	          e.printStackTrace();
	          return null;
	        } finally {
	            // データベース切断
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    return null;
	                }
	            }
	        }
	        return userList;
	    }

	    public User loginProcess(String targetLogin_Id, String targetPassword) {
	        Connection conn = null;
	        try {
	            // データベースへ接続
	            conn = DBManager.getConnection();

	            // SELECT文を準備
	            String sql = "SELECT id, login_id, name, birth_date, password, create_date, update_date FROM user_data WHERE login_id = ? AND password = ?";

	             // SELECTを実行し、結果表を取得
	            PreparedStatement pStmt = conn.prepareStatement(sql);
	            pStmt.setString(1, targetLogin_Id);
	            pStmt.setString(2, targetPassword);
	            ResultSet rs = pStmt.executeQuery();

	             // 主キーに紐づくレコードは1件のみなので、rs.next()は1回だけ行う
	            if (!rs.next()) {
	                return null;
	            }
	            String id = rs.getString("id");
                String login_id = rs.getString("login_id");
                String name= rs.getString("name");
                String birth_date = rs.getString("birth_date");
                String password = rs.getString("password");
                String create_date = rs.getString("create_date");
                String update_date = rs.getString("update_date");
	            return new User(id, login_id, name, birth_date, password, create_date, update_date);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return null;
	        } finally {
	            // データベース切断
	        	 if (conn != null) {
		                try {
		                    conn.close();
		                } catch (SQLException e) {
		                	e.printStackTrace();
		                    return null;
		                }
		        }
		    }
	    }

}