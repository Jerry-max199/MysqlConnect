<%@ page import="connect.Dao" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2021/4/16
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改数据</title>
</head>
<body>
<%
    String id;
    id=request.getParameter("id");
    int ID=Integer.parseInt(id);
%>
<form action="info2.jsp">
    学号：<input type="text" value="<%=ID%>" name="id">
    姓名：<input type="text" name="name">
    邮箱：<input type="text" name="email">
    年龄：<input type="text" name="age" >
    <input type="submit" value="修改">
</form>
</body>
</html>
