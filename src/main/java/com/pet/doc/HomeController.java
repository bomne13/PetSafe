package com.pet.doc;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "header";
	}
	
	@RequestMapping(value="/header", method=RequestMethod.GET)
	public String getHeaderPage() {
		return "header";
	}
	
	@RequestMapping(value="/main5", method=RequestMethod.GET)
	public String getMain5Page() {
		return "main5";
	}
	
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public String gatCalenderPage() {
		return "calendar";
	}
	@RequestMapping(value="/exercise", method=RequestMethod.GET)
	public String getExercisePage() {
		return "exercise";
	}
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String getmyPage() {
		return "/user/mypage";
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin() {
		return "/user/login";
	}
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String getjoin() {
		return "/user/join";
	}
	@RequestMapping(value="/findid", method=RequestMethod.GET)
	public String getfindid() {
		return "/user/findid";
	}
	@RequestMapping(value="/findpasswd", method=RequestMethod.GET)
	public String getfindpw() {
		return "/user/findpasswd";
	}
	
	
	
}
