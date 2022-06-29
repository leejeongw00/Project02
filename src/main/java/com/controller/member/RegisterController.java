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

@WebServlet("/member/register.do")
public class RegisterController extends HttpServlet {

	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/member/Register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.getRequestDispatcher("/member/Register.jsp").forward(req, resp);
		
		/*
		회원가입 전송 부분 
		*/
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw1");
		String user_name = req.getParameter("user_name");
		String user_email = req.getParameter("user_email1")+"@"+req.getParameter("user_email2");
		String user_phone = req.getParameter("user_phone1")+"-"+req.getParameter("user_phone2")+"-"+req.getParameter("user_phone3");
		/*
		checkBox의 같은 name이 여러개이기 때문에 배열을 이용하며 getParameterValues 사용
		*/
		String memberLevel = "user";
		
		//megister_date은 기본으로 sysdate를 지정하였으므로 할필요없습니다
		
		//DAO, DTO 생성 및 초기화
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = new MemberDTO();
		
		mDto.setUser_id(user_id);
		mDto.setUser_pw(user_pw);
		mDto.setUser_name(user_name);
		mDto.setUser_email(user_email);
		mDto.setUser_phone(user_phone);
		
		//결과값을 저장합니다.
		int joinResult = mDao.memberInsert(mDto);
		mDao.close(); //반납 (중요)(실무) 안하면 서버터짐
		
		if (joinResult == 1) {

			JSFunction.alertLocation(resp, "회원가입성공", "../member/login.do");
		} else {
			
			JSFunction.alertBack(resp, "회원가입실패");

		}
	}
}