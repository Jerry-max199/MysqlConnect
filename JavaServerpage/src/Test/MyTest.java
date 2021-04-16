package Test;

import connect.Dao;
import domain.Student;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MyTest {

    public static void main(String args[]) throws SQLException {
        Dao dao=new Dao();
        Connection connection=dao.getConnection();
        if (connection!=null){
            System.out.println("数据库连接成功");
        }else {
            System.out.println("数据库连接失败");
        }
       // dao.selectAll();
        //String Name="凯";
       // dao.selectName(Name);
        int id=111;
       /* String name="盾山";
        String email="2324@163.com";
        int age=19;
        dao.insert(id,name,email,age);*/
       dao.deleteStudent(id);
    }
}
