package controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.EventDao;
import dto.Event;

@Controller
@RequestMapping("/eventde")
public class EventDetailController {

	private EventDao eventdao;
	

	public EventDetailController seteventdetail(EventDao eventdao) {
		this.eventdao = eventdao;
		return this;
	}
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(HttpServletRequest request,Model model,HttpServletResponse res) throws Exception {
		
		int code = Integer.parseInt(request.getParameter("event_cd"));
		int count = Integer.parseInt(request.getParameter("recom_num"));
		List<Event> eventdetail = null;
		// ��Ű ���� ����
		int buf = 0;
		
		// ��Ű �̸��� ��. (code+event_cd(�̺�Ʈ��)���� �̺�Ʈ ������ ���� ��ȸ�� Ȯ��)
		String ckcode= "code"+code;
		
		// ��Ű ��������.
		Cookie[] cookies = request.getCookies();
		
		// �ߺ� ��Ű �ִ��� Ȯ��.
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				if(name.equals(ckcode)) {
					buf = 1;
				}
			}
		}
		
		// ��Ű�� ������ ���� ����.
		if(buf == 0) {
		
			// ��Ű ����.
			Cookie cookie = new Cookie(ckcode,ckcode);
			// ��ȿ�Ⱓ �Ϸ� ����. (60��, 60��, 24�ð�) -> �׽�Ʈ�� ����
			cookie.setMaxAge(60*60*24);
			// ��� ��ο� ���� �����ϵ��� ����.
			cookie.setPath("/");
			// ��Ű �߰�
			res.addCookie(cookie);			

			int but = eventdao.eventyn_update(code,count);
				
			if(but != -1) {
				
				eventdetail = eventdao.selectone(code);
				// �̹��� ���� ã�� ����
				int image_num = eventdetail.size();
	
				//System.out.println("�̹��� ������" + image_num);
			
				model.addAttribute("eventdetail", eventdao.selectone(code));
				model.addAttribute("image_num",image_num);
				
				return "/eventDetail";
			}
			else {
				System.out.println("������Ʈ ���� ����!");
				return "/eventDetail";
			}
		
		}
		
		// ���� ��Ű�� �����ϸ� �����.
		eventdetail = eventdao.selectone(code);
		// �̹��� ���� ã�� ����
		int image_num = eventdetail.size();
	
		model.addAttribute("eventdetail", eventdao.selectone(code));
		model.addAttribute("image_num",image_num);
		
		return "/eventDetail";
		
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String submit(Model model) throws Exception {
		
		//model.addAttribute("eventlist",eventdao.selectList());
		
		return "/eventDetail";
		
	}
	
}
