package com.sp.app.register;

import java.io.File;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;





@Controller("register.registerController")
@RequestMapping("/register/*")
public class RegisterController {

	
	@Autowired
	private RegisterService service;
	
	@RequestMapping(value = "main")
	public String main() {
		return ".register.main";
	}
	
	@RequestMapping(value = "main2")
	public String main2() {
		return ".register.main2";
	}
	
	@RequestMapping(value = "main3")
	public String main3() {
		return ".register.main3";
	}
	
	
	
	@PostMapping("write")
	public String writeSubmit(Register dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			service.insertstation(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/stationmanage/main";
	}
	
	@PostMapping("chwrite")
	public String chwriteSubmit(Register dto,HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			
			service.insertchargestation(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/stationmanage/main";
	}
	
	@PostMapping("kwrite")
	public String kwriteSubmit(Register dto,HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			
			service.insertkickboard(dto,path);
		} catch (Exception e) {
		}

		return "redirect:/kickmanage/main";
	}
	
}
