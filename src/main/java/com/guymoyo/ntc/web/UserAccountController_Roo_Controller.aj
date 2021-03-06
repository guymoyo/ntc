// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.RoleName;
import com.guymoyo.ntc.domain.UserAccount;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Arrays;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UserAccountController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String UserAccountController.create(@Valid UserAccount userAccount, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("userAccount", userAccount);
            addDateTimeFormatPatterns(uiModel);
            return "useraccounts/create";
        }
        uiModel.asMap().clear();
        userAccount.persist();
        return "redirect:/useraccounts/" + encodeUrlPathSegment(userAccount.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String UserAccountController.createForm(Model uiModel) {
        uiModel.addAttribute("userAccount", new UserAccount());
        addDateTimeFormatPatterns(uiModel);
        return "useraccounts/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String UserAccountController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("useraccount", UserAccount.findUserAccount(id));
        uiModel.addAttribute("itemId", id);
        return "useraccounts/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String UserAccountController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("useraccounts", UserAccount.findUserAccountEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserAccount.countUserAccounts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("useraccounts", UserAccount.findAllUserAccounts());
        }
        addDateTimeFormatPatterns(uiModel);
        return "useraccounts/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserAccountController.update(@Valid UserAccount userAccount, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("userAccount", userAccount);
            addDateTimeFormatPatterns(uiModel);
            return "useraccounts/update";
        }
        uiModel.asMap().clear();
        userAccount.merge();
        return "redirect:/useraccounts/" + encodeUrlPathSegment(userAccount.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String UserAccountController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("userAccount", UserAccount.findUserAccount(id));
        addDateTimeFormatPatterns(uiModel);
        return "useraccounts/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String UserAccountController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UserAccount.findUserAccount(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/useraccounts";
    }
    
    @ModelAttribute("rolenames")
    public Collection<RoleName> UserAccountController.populateRoleNames() {
        return Arrays.asList(RoleName.class.getEnumConstants());
    }
    
    @ModelAttribute("useraccounts")
    public Collection<UserAccount> UserAccountController.populateUserAccounts() {
        return UserAccount.findAllUserAccounts();
    }
    
    void UserAccountController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("userAccount_createdat_date_format", "dd-MM-yyyy hh:mm:ss");
    }
    
    String UserAccountController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
