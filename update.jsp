<%@page import="java.sql.*"%>
<title>修改学生信息</title>
<%
  request.setCharacterEncoding("UTF-8");
  String sno=request.getParameter("sno");
  if(sno==null) return;
  Class.forName("com.mysql.jdbc.Driver");
  String s = "jdbc:mysql://localhost:3306/info?user=root&password=shi7" ;
  Connection conn = DriverManager.getConnection( s );
  int r=-1;
  if(request.getMethod().equals("GET"));
      //out.print("GET");
      
  else{
	  //out.print("POST");
    request.setCharacterEncoding("UTF-8");
    String t1 = request.getParameter("T1");
    String t2 = request.getParameter("T2");
    String t3 = request.getParameter("T3");
    String r1 = request.getParameter("R1");
	
	  String sql="UPDATE  t_student SET s_name=?,s_class=?,s_gender=? WHERE s_no=?";
	  PreparedStatement stat = conn.prepareStatement(sql);
	  stat.setString(1,t2);
    stat.setString(2,t3);
    stat.setString(3,(r1.equals("1")?"男":"女"));
    stat.setString(4,t1);
    //stat.setString(5,t1);
    r = stat.executeUpdate();
  }
  String sql = "SELECT * FROM t_student WHERE s_no='"+sno+"';";
  PreparedStatement stat = conn.prepareStatement(sql);
  ResultSet rs=stat.executeQuery();
  if(!rs.next())  return;
 %>
<form method="POST">
<table border="1"><tr><td style="padding:18px 18px;">
<table>
<tr><td>学号&nbsp;<input type="text" value="<%=rs.getString(2) %>" name="T1" readonly/></td></tr>
<tr><td>姓名&nbsp;<input type="text" value='<%out.print(rs.getString(3)); %>'name="T2"/></td></tr>
<tr><td>性别&nbsp;<input type="radio" name="R1" value="1" <%= rs.getString(4).equals("男")?"checked":"" %> />男&nbsp;
                  <input type="radio" name="R1" value="0" <%= rs.getString(4).equals("女")?"checked":"" %> />女&nbsp;</td></tr>
<tr><td>班级&nbsp;
<!-- //<input type="text"value="<%=rs.getString(5) %>" name="T3"/> -->
<select  name="T3">
<option value="<%=rs.getString(5) %>" selected><%=rs.getString(5) %></option>
<option value="计算机161">计算机161</option>
<option value="计算机162">计算机162</option>
<option value="计算机163">计算机163</option>
<option value="计算机164">计算机164</option>
<option value="计算机165">计算机165</option>
<option value="计算机166">计算机166</option>
<option value="软件工程161">软件工程161</option>
<option value="软件工程162">软件工程162</option>
<option value="软件工程163">软件工程163</option>
<option value="软件工程164">软件工程164</option>
</select>
</td></tr>
<tr><td><hr/></td></tr>
<tr><td><input type="submit" value="修改" style="float:left"/>&nbsp;
        <input type="button" value="返回" style="float:right"
               onclick="self.location='student.jsp';"/></td></tr>
</table>
</td></tr></table>
</form>
<hr/>
<%
   if(request.getMethod().equals("GET"));
     //out.printf("GET");
   else
   {
      if(r==1) 
         out.print("修改成功");
      else
         out.print("无法修改");
    }
	  
%>


















