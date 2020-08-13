<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>

<body>
<h1>JDBC Connection example</h1>

<%
  //String db = request.getParameter("db");
  String db = "test";
  String user = "root"; // assumes database name is the same as username
  Class.forName("com.mysql.jdbc.Driver");
  try {
    java.sql.Connection con;
    //Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, "password");
    out.println (db+ "database successfully opened.");
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }

%>

<!DOCTYPE html>
<table border="1">

<%
  try{

    java.sql.Connection con;
    java.sql.Statement statement;
    java.sql.ResultSet resultSet;
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, "password");
    statement=con.createStatement();
    String sql ="select * from Mydata";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
    %>
   <tr>
   <td><%=resultSet.getString("name") %></td>
   </tr> 
   <%      
     }
con.close();
} catch (Exception e) {
e.printStackTrace();
}


%>

</body>
</html>
