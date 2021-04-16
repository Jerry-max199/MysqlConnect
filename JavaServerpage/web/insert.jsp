<%@ page import="connect.Dao" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2021/4/16
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入数据</title>
</head>
<body>
<form action="info.jsp" method="post">
<h4 align="center">插入数据</h4>
<table align="center" border="1" cellspacing="2">
    <tr>
        <td width="80" align="center">id：</td>
        <td width="120"><input type="text" name="id"></td>
    </tr>
    <tr>
        <td width="80" align="center">姓名：</td>
        <td width="120"><input type="text" name="name"></td>
    </tr>
    <tr>
        <td width="80" align="center">邮箱：</td>
        <td width="120"><input type="text" name="email"></td>
    </tr>
    <tr>
        <td width="80" align="center">年龄：</td>
        <td width="120"><input type="text" name="age"></td>
    </tr>
    <tr>
        <th width="120" colspan="2"><input type="submit" value="提交"></th>
    </tr>
</table>
</form>

</body>
</html>
