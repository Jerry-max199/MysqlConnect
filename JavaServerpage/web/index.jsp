<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2021/4/15
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="connect.Dao" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.Student" %>
<html>
  <head>
    <title>查询学生</title>
  </head>
  <body>
  <form action="selectNameStudent.jsp" method="post">
  输入姓名：
  <input type="text" name="name">
  <input type="submit" value="查询">
  </form>
  <form action="insert.jsp" method="post">
  <input type="submit" value="插入数据">
  </form>
  <br>
<%
    Dao dao=new Dao();
    Connection connection=dao.getConnection();
    if (connection!=null){
     //out.println("数据库连接成功");
      List<Student> list= dao.selectAll();
        out.print("<table border='1' cellspacing='1'><tr>");
        out.print("<caption>人员信息表</caption>");
        out.print("<tr><th width='60'>序号</th>"
                + "<th width='100'>id</th>"
                + "<th width='100'>姓名</th>"
                + "<th width='120'>邮箱</th>"
                + "<th width='100'>年龄</th>"
                + "<th width='100'>操作</th>");
        int count = 0;
        for (Student student:list){
            out.print("<tr>");
            out.print("<td>" + (++count) + "</td>");
            out.print("<td>" + student.getId()+ "</td>");
            out.print("<td>" + student.getName() + "</td>");
            out.print("<td>" + student.getEmail() + "</td>");
            out.print("<td>" + student.getAge()+ "</td>");
            out.print("<td>" + "<a href=delete.jsp?id=" + student.getId() + ">删除" + "</a>"
                    + " / <a href=update.jsp?id=" + student.getId() + ">修改" + "</a>"+ "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        connection.close();
        connection.close();
    }else {
        out.println("数据库连接失败");
    }
%>
  </body>
</html>
