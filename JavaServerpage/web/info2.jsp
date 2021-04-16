<%@ page import="connect.Dao" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2021/4/16
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提示页</title>
</head>
<body>
<%
    String id=request.getParameter("id");
    String Name=request.getParameter("name");
    String Email=request.getParameter("email");
    String age=request.getParameter("age");
    int ID=Integer.parseInt(id);
    int Age=Integer.parseInt(age);
    out.print(ID);
    Dao dao=new Dao();
    Connection connection=dao.getConnection();
    if (connection!=null){
       int i=dao.update(Name,Email,Age,ID);
       out.print("成功修改了"+i+"条数据");
        out.print("修改成功"+"<a href=index.jsp?id=>返回首页" + "</a>");
    }else{
        out.print("数据库连接失败");
        out.print("修改失败"+"<a href=index.jsp?id=>返回首页" + "</a>");
    }
%>
</body>
</html>
