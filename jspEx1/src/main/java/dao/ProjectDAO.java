package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Project;


public class ProjectDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/sample";
    private String jdbcUsername = "root";
    private String jdbcPassword = "test1234";
    private Connection conn;

    // 데이터베이스 연결
    protected void connect() throws SQLException {
        if (conn == null || conn.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    // 데이터베이스 연결 해제
    protected void disconnect() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    // tbl_user 테이블의 모든 사용자 가져오기
    public List<Project> listAllUsers() throws SQLException {
        List<Project> ProjectList = new ArrayList<>();

        String sql = "SELECT * FROM users";

        connect();

        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            String name = rs.getString("name");
    		String user_id = rs.getString("user_id");	
    		String password = rs.getString("password");
    		String resident_registration_number = rs.getString("resident_registration_number");
    		String address = rs.getString("address");
    		String email = rs.getString("email");
    		String phone_number = rs.getString("phone_number");
    		String gender = rs.getString("gender");
    		String volunteer_region = rs.getString("volunteer_region");
    		String desired_activity = rs.getString("desired_activity");
    		String special_skills = rs.getString("special_skills");
            String created_at = rs.getString("created_at");
            String user_grade = rs.getString("user_grade");
            
            Project project = new Project(name, user_id, password, resident_registration_number,address,email,
            		phone_number,gender,volunteer_region,desired_activity,special_skills,created_at,user_grade);
            ProjectList.add(project);
        }
       
        rs.close();
        statement.close();
        disconnect();

        return ProjectList;
    }
}