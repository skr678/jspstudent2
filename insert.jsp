<%@page import="java.sql.*"%>
<title>添加学生信息</title>


<form method="POST">
<table border="1"><tr><td style="padding:18px 18px;">
<table>
<tr><td>学号&nbsp;<input type="text" name="T1"/></td></tr>
<tr><td>姓名&nbsp;<input type="text" name="T2"/></td></tr>
<tr><td>性别&nbsp;<input type="radio" name="R1" value="1"/>男&nbsp;
                  <input type="radio" name="R1" value="0"/>女&nbsp;</td></tr>
<tr><td>班级&nbsp;<input type="text" name="T3"/></td></tr>
<tr><td><hr/></td></tr>
<tr><td><input type="submit" value="添加" style="float:left"/>&nbsp;
        <input type="button" value="返回" style="float:right"
               onclick="self.location='student.jsp';"/></td></tr>
</table>
</td></tr></table>
</form>
<hr/>
<%
	request.setCharacterEncoding("UTF-8");
    String t1 = request.getParameter("T1");
    String t2 = request.getParameter("T2");
    String t3 = request.getParameter("T3");
    String r1 = request.getParameter("R1");
	if(t1==null || t2==null ||t3==null || r1==null || 
	   t1.equals("") || t2.equals("") || t3.equals("") || r1.equals("") )
	{
		if(request.getMethod().equals("POST"))
			out.print("<span style='color:red'>信息填写不完整</span>");
		return;
	} 
    /*out.print(t1); out.print("<br>");
      out.print(t2); out.print("<br>");
      out.print(t3); out.print("<br>");
      out.print(r1); out.print("<br>");*/
   Class.forName("com.mysql.jdbc.Driver");
    String s = "jdbc:mysql://localhost:3306/info?user=root&password=shi7" ;
    Connection conn = DriverManager.getConnection( s );
	String sql="INSERT INTO t_student(s_no,s_name,s_class,s_gender)" + "SELECT ?,?,?,? FROM t_student WHERE s_no=? HAVING count(*)=0";
	PreparedStatement stat = conn.prepareStatement(sql);
    stat.setString(1,t1);
    stat.setString(2,t2);
    stat.setString(3,t3);
    stat.setString(4,(r1.equals("1")?"男":"女"));
    stat.setString(5,t1);
	int n = stat.executeUpdate();
	if(n==1)
	    out.print("<span style=\"color:green\">添加成功</span>");
	else
		out.print("<span style=\"color:red\">学号'"+t1+"'已存在</span>");
%>