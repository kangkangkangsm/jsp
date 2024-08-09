package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

//이 서블릿은 "/userList" URL로 접근했을 때 호출됨
@WebServlet("/userList")
public class UserController extends HttpServlet {
 // UserDAO 객체를 선언 (데이터베이스와의 상호작용을 담당)
 private UserDAO userDAO;

 // 서블릿이 초기화될 때 호출됨 (서블릿 인스턴스 생성 시 호출)
 public void init() {
     // UserDAO 객체를 생성하여 데이터베이스와의 연결을 준비
     userDAO = new UserDAO();
 }

 // HTTP GET 요청을 처리하는 메서드
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     try {
         // 콘솔에 "test"라는 메시지를 출력하여 요청 처리 시작을 확인
         System.out.println("test");
         
         // UserDAO 객체를 사용하여 데이터베이스에서 모든 사용자 정보를 가져옴
         List<User> userList = userDAO.listAllUsers();

         // 가져온 사용자 목록을 request 객체에 "userList"라는 이름으로 저장
         // 이 데이터는 JSP 페이지에서 접근할 수 있음
         request.setAttribute("userList", userList);

         // "day5/user-list.jsp" JSP 페이지로 요청을 포워딩
         // 포워딩된 JSP 페이지는 사용자 목록을 화면에 표시함
         RequestDispatcher dispatcher = request.getRequestDispatcher("day5/user-list.jsp");
         dispatcher.forward(request, response);
     } catch (SQLException e) {
         // SQL 예외가 발생하면 ServletException으로 감싸서 전달
         // ServletException은 JSP 페이지나 다른 서블릿으로 전달됨
         throw new ServletException(e);
     }
 }
}