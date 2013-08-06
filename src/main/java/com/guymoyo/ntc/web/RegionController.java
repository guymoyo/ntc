package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Region;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "regions", formBackingObject = Region.class)
@RequestMapping("/regions")
@Controller
public class RegionController {
}
