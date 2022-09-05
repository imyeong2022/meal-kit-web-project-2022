package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDao;

@Controller
public class MemberListController {
		private MemberDao memberDao;

		public MemberListController setMemberDao(MemberDao memberDao) {
			System.out.println("1");
			this.memberDao = memberDao;
			return this;
		}
		

		@RequestMapping(value = "/list")
		public String list(Model model) throws Exception {
			model.addAttribute("members", memberDao.selectList());
			System.out.println("2");
			return "/MemberList";
		}
	}


