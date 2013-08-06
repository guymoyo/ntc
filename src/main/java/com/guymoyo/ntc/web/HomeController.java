package com.guymoyo.ntc.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("/")
@Controller
public class HomeController {
	
	
	@RequestMapping(method=RequestMethod.GET)
	public String home(@RequestParam(value="param",required = false)String param, Model uiModel){
		
		if(param == null) return "index";
		if(param == "geo") {
			uiModel.addAttribute("param", "geo");
			return "index";
		}
		if(param == "donne") {
			uiModel.addAttribute("param", "donne");
			return "index";
		}
		if(param == "principal") {
			uiModel.addAttribute("param", "principal");
			return "index";
		}
		
		return "index";
	}

}
