package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Pays;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "payses", formBackingObject = Pays.class)
@RequestMapping("/payses")
@Controller
public class PaysController {
}
