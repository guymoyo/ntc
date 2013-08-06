package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Entreprise;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "entreprises", formBackingObject = Entreprise.class)
@RequestMapping("/entreprises")
@Controller
public class EntrepriseController {
}
