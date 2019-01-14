<%@page import="java.sql.*"%>
<title>删除学生信息</title>

<%
    String sno=request.getParameter("id");
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    String s = "jdbc:mysql://localhost:3306/info?user=root&password=shi7" ;
    Connection conn = DriverManager.getConnection( s );
    String sql = "delete from t_student where s_no="+sno;
    PreparedStatement stat = conn.prepareStatement(sql);
    //out.print(sno);

               int n = stat.executeUpdate();
               //conn.commit();
	if(n==1)
	    out.print("<span style=\"color:green\">删除操作成功</span>");
	else
		out.print("<span style=\"color:red\">删除操作失败</span>");
%>
<script language="javascript" type="text/javascript">
    setTimeout(function () { this.location.href = "student.jsp" }, 7000);
</script>
<input type="button" value="返回" onclick="self.location='student.jsp';"/>