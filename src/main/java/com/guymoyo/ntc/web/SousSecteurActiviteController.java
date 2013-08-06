package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.SousSecteurActivite;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "soussecteuractivites", formBackingObject = SousSecteurActivite.class)
@RequestMapping("/soussecteuractivites")
@Controller
public class SousSecteurActiviteController {
}
