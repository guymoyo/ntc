package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Departement;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "departements", formBackingObject = Departement.class)
@RequestMapping("/departements")
@Controller
public class DepartementController {
}
