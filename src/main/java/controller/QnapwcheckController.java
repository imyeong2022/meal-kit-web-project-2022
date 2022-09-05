package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.ProductQnaDao;
import dto.Member;
import dto.ProductQna;

@Controller
public class QnapwcheckController {

	private ProductQnaDao productQnaDao;
	
	
	public QnapwcheckController setproductqnadao(ProductQnaDao productQnaDao) {
		this.productQnaDao = productQnaDao;
		return this;
	}
	
	
	@RequestMapping(value="qanpwckform")
	public String pwcheckform(HttpServletRequest request,Model model) throws Exception{
		
		int prodqcd = Integer.parseInt(request.getParameter("prodqcd"));
		int image = Integer.parseInt(request.getParameter("image"));
		
		//System.out.println("����"+prodqcd);
		
		ProductQna producqna = productQnaDao.selectOne(prodqcd);
		
		
		model.addAttribute("image",image);
		model.addAttribute("producqna",producqna);
		
		return "qnapwckform";
		
	}
	
	
	// ��й�ȣ 
	@RequestMapping(value="qnaview", method = RequestMethod.GET)
	public String pwcheck(HttpServletRequest request,Model model) throws Exception{
		
		//Member member=(Member)session.getAttribute("authInfo");
		int prodqcd = Integer.parseInt(request.getParameter("prodqcd"));
		int image = Integer.parseInt(request.getParameter("image"));
		//System.out.println("����"+prodqcd);
		
		ProductQna producqna = productQnaDao.selectOne(prodqcd);
		
		model.addAttribute("producqna",producqna);
		model.addAttribute("image",image);
		
		return "itemqnaviewform";
	}
	
}
