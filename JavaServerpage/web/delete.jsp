<%@ page import="connect.Dao" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2021/4/16
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除数据</title>
</head>
<body>
<%
    String id=request.getParameter("id");
    int ID=Integer.parseInt(id);
    out.print(ID);
    Dao dao=new Dao();
    Connection connection=dao.getConnection();
    if(connection!=null){

        int i=dao.deleteStudent(ID);
        out.print("成功删除"+i+"条数据");
        out.print("删除成功"+"<a href=index.jsp?id=>返回首页" + "</a>");
    }else {
        out.print("数据库连接失败");
        out.print("删除失败"+"<a href=index.jsp?id=>返回首页" + "</a>");
    }
%>
</body>
</html>
