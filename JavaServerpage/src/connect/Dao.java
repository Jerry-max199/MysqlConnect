package connect;

import domain.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Dao {
    final String URL = "jdbc:mysql://localhost:3306/mybatis?serverTimezone=UTC";
    final String USER = "root";
    final String PWD = "111111";
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;
    ResultSet resultSet;
    List<Student> list=new ArrayList<>();
    public Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(URL, USER, PWD);
            this.connection=connection;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }



    public List<Student> selectAll(){
        String selectAll="select * from student";
        try {
            statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            resultSet = statement.executeQuery(selectAll);
            while (resultSet.next()){
                Student student=new Student();
               student.setId(resultSet.getInt("id"));
               student.setName(resultSet.getString("name"));
                student.setEmail(resultSet.getString("email"));
                student.setAge(resultSet.getInt("age"));
                list.add(student);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                resultSet.close();
                statement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        return list;
    }
    public List<Student> selectName(String Name){
        String selectstudent="select * from student where name=?";
        try {
            String sql = "SELECT * FROM student where name=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1, Name);
            System.out.println(Name);
            resultSet=preparedStatement.executeQuery();
           while (resultSet.next()){
               Student student=new Student();
               student.setId(resultSet.getInt("id"));
               student.setName(resultSet.getString("name"));
               student.setEmail(resultSet.getString("email"));
               student.setAge(resultSet.getInt("age"));
               list.add(student);
           }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    public int insert(int Id,String Name,String Email,int Age){
        String sql="insert into student values(?,?,?,?) ";
        int i = 0;
        try {
            
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,Id);
            preparedStatement.setString(2,Name);
            preparedStatement.setString(3,Email);
            preparedStatement.setInt(4,Age);
            //System.out.println(id);
            i=preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return i;
    }
    public int deleteStudent(int ID){
        String sql="delete  FROM student where id=?";
        int i=0;
        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,ID);
            i=preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return i;
    }
    public int update(String name,String email,int age,int id){
        String sql="update Student set name =?,email=?,age=? where id=?";
        int i=0;
        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,email);
            preparedStatement.setInt(3,age);
            preparedStatement.setInt(4,id);
           i=preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
