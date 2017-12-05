package dao;

import java.util.List;

import model.User;;


public class SelectUser_dataSample {

    public static void main(String[] args) {
        // user_dataテーブルの全レコードを取得
        User_dataDao empDao = new User_dataDao();
        List<User> empList = empDao.findAll();

        // 取得したレコードの内容を出力
        for (User emp : empList) {
            System.out.println("ID:" + emp.getId());
            System.out.println("ログインID:" + emp.getLogin_id());
            System.out.println("ユーザー名:" + emp.getName());
            System.out.println("生年月日:" + emp.getBirth_date());
            System.out.println("パスワード:" + emp.getPassword());
            System.out.println("作成日時:" + emp.getCreate_date());
            System.out.println("更新日時:" + emp.getUpdate_date());
        }
    }
}
