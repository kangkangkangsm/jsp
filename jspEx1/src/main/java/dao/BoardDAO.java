package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Board;
import model.User;

public class BoardDAO {
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
    public List<Board> listAllUsers() throws SQLException {
        List<Board> boardList = new ArrayList<>();

        String sql = "SELECT * FROM tbl_board";

        connect();

        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
        	String boardNo = rs.getString("boardNo");
            String title = rs.getString("title");
            String contents = rs.getString("contents");
            String userId = rs.getString("userId");
            
            Board board = new Board(boardNo, title, contents, userId);
            boardList.add(board);
        }
       
        rs.close();
        statement.close();
        disconnect();

        return boardList;
    }
}