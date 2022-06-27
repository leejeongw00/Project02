package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.MemberDTO;
import com.member.MemberDAO;

import utils.JSFunction;

@WebServlet("/member/idcheck.do")
public class IdCheckController extends HttpServlet {


	//하나만 쓰이기때문에 service()메서드 사용
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DAO 생성 및 초기화
		MemberDAO dao = new MemberDAO();
		int result = 0;
		//넘긴 파라미터를 불러옴
		String id = req.getParameter("user_id"); 
		System.out.println(id);
		//아이디체크
		//데이터를 불러와야 하기때문에 dto객체에 결과를 저장합니다. 
		MemberDTO dto =  dao.memberSelect(id, "");
		dao.close(); //반납
		
		//id는 받아버려서 다른걸로 확인했습니다
		//위에서 데이터가 받아졌다면 이름도 받아졌을것이기에 조건을 걸어 result값을 지정합니다.
		if(dto.getUser_name() != null) {
			result =1;
		}
		
		//결과값을 받기위해 지정합니다.
		req.setAttribute("result", result);
		req.getRequestDispatcher("/member/idcheck.jsp").forward(req, resp);
	}
}