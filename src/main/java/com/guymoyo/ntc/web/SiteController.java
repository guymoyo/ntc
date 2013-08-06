package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Site;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "sites", formBackingObject = Site.class)
@RequestMapping("/sites")
@Controller
public class SiteController {
}
