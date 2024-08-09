package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;


@WebServlet("/qwer")
public class TestController extends HttpServlet {

    // HTTP GET 요청이 들어왔을 때 호출되는 메서드
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 콘솔에 "test 클래스 호출!"이라는 메시지를 출력하여 테스트 호출을 알림
        System.out.println("test 클래스 호출!");
        
        // 요청 파라미터에서 'userName'이라는 이름의 값을 가져옴
        // 예를 들어, URL에 '?userName=홍길동'이 포함되어 있으면 '홍길동'을 가져옴
        String userName = request.getParameter("userName");
        
        // 가져온 사용자 이름을 이용하여 User 객체를 생성
        // User 클래스는 사용자 정보를 저장하는 모델 클래스
        User user = new User(userName);
        
        // 생성한 User 객체를 request 객체에 'user'라는 이름으로 저장
        // 이는 JSP 페이지에서 'user' 속성으로 접근 가능하게 해줌
        request.setAttribute("user", user);
        
        // JSP 페이지로 요청을 포워딩하여 사용자 데이터를 표시
        // '/day5/test.jsp' 경로의 JSP 페이지로 요청을 전달함
        request.getRequestDispatcher("/day5/test.jsp").forward(request, response);
    }
}