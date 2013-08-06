package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.SecteurActivite;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "secteuractivites", formBackingObject = SecteurActivite.class)
@RequestMapping("/secteuractivites")
@Controller
public class SecteurActiviteController {
}
