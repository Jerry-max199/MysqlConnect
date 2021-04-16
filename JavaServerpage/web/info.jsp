<%@ page import="connect.Dao" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2021/4/16
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提示页</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id");
    String Name=request.getParameter("name");
    String Email=request.getParameter("email");
    String age=request.getParameter("age");
    int ID=Integer.parseInt(id);
    int Age=Integer.parseInt(age);
    Dao dao=new Dao();
    Connection connection=dao.getConnection();
    if (connection!=null){
         int i=dao.insert(ID,Name,Email,Age);
          out.print("成功添加"+i+"条数据");
        out.print("添加成功"+"<a href=index.jsp?id=>返回首页" + "</a>");
    }else {
        out.print("数据库连接数据失败");
        out.print("添加失败"+"<a href=index.jsp?id=>返回首页" + "</a>");
    }
%>
</body>
</html>
