package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ProductQnaDao;
import dto.Member;
import dto.ProductQna;

@Controller
@RequestMapping("/itemqnainsert")
public class ItemqnainsertController {

	
	private ProductQnaDao productQnaDao;
	
	
	public ItemqnainsertController setproductqnadao(ProductQnaDao productQnaDao) {
		this.productQnaDao = productQnaDao;
		return this;
	}
	
	
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(HttpServletRequest request,HttpSession session,Model model) {
		
		Member member=(Member)session.getAttribute("authInfo");

		int prodcd = Integer.parseInt(request.getParameter("prod_cd"));
		int imagenum = Integer.parseInt(request.getParameter("image"));
		int page = Integer.parseInt(request.getParameter("page"));
		
	//	System.out.println("이미지 숫자는"+imagenum);
		
		model.addAttribute("page",page);
		model.addAttribute("prodcd",prodcd);
		model.addAttribute("imagecd",imagenum);
		model.addAttribute("name", member.getName());
		
		return "itemqanform";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public void iteminsert(HttpServletResponse response, HttpServletRequest request,HttpSession session)throws ServletException, IOException ,Exception{
		
		int buf = 0;
		Member member=(Member)session.getAttribute("authInfo");
		
		response.setContentType("application/x-json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		ProductQna productqna = new ProductQna();
		String username = request.getParameter("username");
		String qnatitle = request.getParameter("qnatitle");
		String qnacontent = request.getParameter("qnacontent");
		String qnacheck = request.getParameter("qnacheck");
		int prodcd = Integer.parseInt(request.getParameter("prodcode"));
		
		//System.out.println("받아오는 코드 값");
		//System.out.println(prodcd);
		
		// 비밀글
		if(qnacheck.equals("true")) {
			String qnapwd = request.getParameter("qnapwd");
			productqna.setProd_cd(prodcd);
			productqna.setName(username);
			productqna.setSubject(qnatitle);
			productqna.setContent(qnacontent);
			productqna.setSecret("y");
			productqna.setPwd(qnapwd);
			productqna.setEmail(member.getEmail());
			
		}// 비밀글 아닐 경우
		else {
			productqna.setProd_cd(prodcd);
			productqna.setName(username);
			productqna.setSubject(qnatitle);
			productqna.setContent(qnacontent);
			productqna.setSecret("n");
			productqna.setPwd("");
			productqna.setEmail(member.getEmail());
			
		}
		
	//	System.out.println(productqna.getName());
	//	System.out.println(productqna.getEmail());
	//	System.out.println(productqna.getProd_cd());
	//	System.out.println(productqna.getSecret());
		
		int result = productQnaDao.insert(productqna);
		
		if(result != -1)buf = 0;
		else buf = 1;
		
		//System.out.println(username);
		//System.out.println(qnatitle);
		//System.out.println(qnacontent);
		//System.out.println(qnacheck);
		//Member member=(Member)session.getAttribute("authInfo");
		
	//	System.out.println("여기 포스트야");
		

		out.print(buf);
	}	
	
}
