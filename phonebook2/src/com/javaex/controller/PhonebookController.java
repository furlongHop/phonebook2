package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;

@WebServlet("/pbc") //맨 마지막에 있는 주소값(소문자로만 구성하는 것을 추천)
public class PhonebookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("PhonebookController");
		
		String act = request.getParameter("action");
		//System.out.println(act);
		
		//if문 안쪽은 항상 forword나 redirect로 끝나야 한다. 빈 페이지 방지.
		if("list".equals(act)) {
			
			System.out.println("action=list");
			PhoneDao phoneDao = new PhoneDao();
			List<PersonVo> personList = phoneDao.getPersonList();
			
			//System.out.println(personList.toString());
			//println은 알아서 toString을 찾아가기 때문에 괄호 안에 personList만 넣어도 상관없다.
			
			//html과 list를 섞어서 표현해야 한다.
			//servlet으로는 표현이 복잡하므로 jsp를 이용한다.
			
			request.setAttribute("pList", personList);//첫 번째 파라미터: 두 번째 파라미터의 이름표, 두 번째 파라미터: 호출할 값
			
			//포워드 request와 response를 list.jsp로 밀어준다(일을 시킨다)
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/list.jsp");
			rd.forward(request, response);
			
		}else if("writeForm".equals(act)) {
			
			System.out.println("전화번호 등록폼");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/writeForm.jsp");
			rd.forward(request, response);
			
		}else if("write".equals(act)){
			System.out.println("action=write");
			
			//파라미터 3개를 꺼내온다.
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			//vo로 만든다.
			PersonVo personVo = new PersonVo(name, hp, company);
			System.out.println(personVo);
			
			//dao를 만든다.
			PhoneDao phoneDao = new PhoneDao();
			
			//dao.insert(vo);
			phoneDao.personInsert(personVo);
			
			//redirect(forward 사용X)
			response.sendRedirect("/phonebook2/pbc?action=list");
			
		}else if("delete".equals(act)){
			
			//PhoneDao 메모리 로딩
			PhoneDao phoneDao = new PhoneDao();
			
			//Request class에 있는 getParameter 메소드로 파라미터 값을 받아온다.(파라미터 값은 무조건 String이므로 자료형 변환 필요)
			int personId = Integer.parseInt(request.getParameter("id"));
			
			//삭제
			phoneDao.personDelete(personId);
			
			//redirect
			response.sendRedirect("/phonebook2/pbc?action=list");
			
			
		}else if("update".equals(act)){
			
		}else if("updateForm".equals(act)){
			
		}else {
			System.out.println("파라미터 값 없음");
		}
	
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
