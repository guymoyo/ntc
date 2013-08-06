package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Arrondissement;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "arrondissements", formBackingObject = Arrondissement.class)
@RequestMapping("/arrondissements")
@Controller
public class ArrondissementController {
}
