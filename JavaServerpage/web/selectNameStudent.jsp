<%@ page import="connect.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="domain.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2021/4/16
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询结果</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String Name=request.getParameter("name");
    Dao dao=new Dao();
    Connection connection=dao.getConnection();
    if (connection!=null){
        out.println("数据库连接成功");
        List<Student> list= dao.selectName(Name);
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
            out.print("<td>" + "<a href=deleteuser.jsp?id=" + student.getId() + ">删除" + "</a>"
                    + " / <a href=updateuser.jsp?id=" + student.getId() + ">修改" + "</a>"+ "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
    }else {
        out.println("数据库连接失败");
    }
%>
</body>
</html>
