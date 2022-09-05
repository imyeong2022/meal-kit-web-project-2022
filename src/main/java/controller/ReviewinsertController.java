package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.OrderListDao;
import dao.ReviewDao;
import dto.Member;
import dto.OrderList;
import dto.Review;

@Controller
@RequestMapping("/reviewinsert")
public class ReviewinsertController {

	
	private ReviewDao reviewDao;
	private OrderListDao orderListDao;
	
	public ReviewinsertController setreviewdao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
		return this;
	}
	
	public ReviewinsertController setorderlistdao(OrderListDao orderListDao) {
		this.orderListDao = orderListDao;
		return this;
	}	
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(HttpSession session,Model model)throws Exception {
		
		Member member=(Member)session.getAttribute("authInfo");
		
		if(member == null || member.getEmail() == null) {
			
			///model.addAttribute("page", 1);
			return "redirect:login";
		}
		else {
			
			System.out.println("이메일"+member.getEmail());
			
			
			List<OrderList> odrck = new ArrayList<OrderList>();
			if(orderListDao.selectOrder2(member.getEmail()).isEmpty()) {
				return "redirect:index";
			}else {
				
				int max = orderListDao.selectcntMax(member.getEmail());
				
				
				List<OrderList> order = orderListDao.selectitemlist(member.getEmail(),max);
				
				
				model.addAttribute("name", member.getName());
				model.addAttribute("order", order);
				return "Reviewinsert";	
			}
					
			
		
				
								
			
			
			
		}
		
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String insert(HttpServletRequest request,HttpSession session,RedirectAttributes red)throws ServletException, IOException {
		
		Member member=(Member)session.getAttribute("authInfo");
		Review review = new Review();
		String itembns = null;
		String[] file_name = new String[6];
		int i = 1;
		
		
		String path="images/review";

		ServletContext context= request.getSession().getServletContext();

		String realPath=context.getRealPath(path);
		
		int uploadFileSizeLimit = 10 * 1024 * 1024; // 최대 업로드 파일 크기 5MB로 제한.
		String encType = "UTF-8";
		
		//System.out.println("왔어?11111");
		try {
			MultipartRequest multi = new MultipartRequest(request,realPath,
					uploadFileSizeLimit,encType,new DefaultFileRenamePolicy());
			
			// 사진 부분
			file_name[0] = multi.getFilesystemName("uploadFile1");
			file_name[1] = multi.getFilesystemName("uploadFile2");
			file_name[2] = multi.getFilesystemName("uploadFile3");
			file_name[3] = multi.getFilesystemName("uploadFile4");
			file_name[4] = multi.getFilesystemName("uploadFile5");
			file_name[5] = multi.getFilesystemName("uploadFile6");
			
			// 제품 등록 부분.
			review.setEmail(member.getEmail());
			review.setName(multi.getParameter("user"));
			review.setSubject(multi.getParameter("title"));
			review.setContent(multi.getParameter("t_content"));
			//System.out.println("왔어?");
			
			review.setProd_cd(Integer.parseInt(multi.getParameter("item")));

			System.out.println(review.getProd_cd());
			
			
//			// 제품 등록.
			int buf = reviewDao.insertpd(review);
//			
			if(buf != -1) {
				// 이미지 등록
				int pdmax = reviewDao.selectmax();
				if(pdmax == 0) pdmax = 1;
				
				System.out.println("max값"+pdmax);
	
				for(int j = 0; j < file_name.length; j++) {
					if(file_name[j] != null) {
						int buf2 = reviewDao.insertimage(pdmax,i, file_name[j]);
						if(buf2 == -1) System.out.println("이미지저장 실패"+i);
						i++;						
					}
				}
//				
				System.out.println("저장완료");
			}
			else {
				System.out.println("저장실패");
			}

			
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
		
		
		red.addAttribute("page", 1);
		
		return "redirect:/reviewlist";
		
	}
	
	
	
}
