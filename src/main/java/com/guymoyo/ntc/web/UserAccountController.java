package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.UserAccount;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "useraccounts", formBackingObject = UserAccount.class)
@RequestMapping("/useraccounts")
@Controller
public class UserAccountController {
}
