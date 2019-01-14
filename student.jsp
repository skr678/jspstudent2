<title>学生信息管理</title>
<table border="1">
<tr><th>序号</th><th>学号</th><th>姓名</th><th>性别</th>
    <th>班级</th><td style="text-align:center"><a href="insert.jsp">添加</a></td></tr>
 
 <%@page import="java.sql.*"%>
 <%

    Class.forName("com.mysql.jdbc.Driver");

    String s = "jdbc:mysql://localhost:3306/info?user=root&password=shi7" ;

    Connection conn = DriverManager.getConnection( s );

    Statement stat = conn.createStatement();

    ResultSet rs = stat.executeQuery("SELECT * FROM t_student  order by s_no ") ;

    //while(rs.next()) out.print(rs.getString("cname")+"<hr>");
    int i=0;
     while(rs.next())
  { 
    
    i++;
    out.print("<tr><td>"+i+"</td>");
    out.print("<td>"+rs.getString(2)+"</td>");
    out.print("<td>"+rs.getString(3)+"</td>");
    out.print("<td>"+rs.getString(4)+"</td>");
    out.print("<td>"+rs.getString(5)+"</td>");
    //out.print("</tr>");
    //String sno1 = rs.getString(2);
   %>
 <script type="text/javascript">
    function delcfm(sno1) { 
    
   if (!confirm("是否删除\'"+sno1+"\'?")) { 
      window.event.returnValue = false; 
       } 
      } 
</script>
<%
		out.print("<td><a href='update.jsp?sno=" +rs.getString(2)+"'>修改&nbsp</a><a href='delete.jsp?id=" +rs.getString(2)+"' onclick='return delcfm("+rs.getString(2)+")'>删除</a></td>");
		out.print("</tr>");
    }
%>
</table>