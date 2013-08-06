// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Pays;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
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

privileged aspect PaysController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PaysController.create(@Valid Pays pays, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pays", pays);
            return "payses/create";
        }
        uiModel.asMap().clear();
        pays.persist();
        return "redirect:/payses/" + encodeUrlPathSegment(pays.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PaysController.createForm(Model uiModel) {
        uiModel.addAttribute("pays", new Pays());
        return "payses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PaysController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("pays", Pays.findPays(id));
        uiModel.addAttribute("itemId", id);
        return "payses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PaysController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("payses", Pays.findPaysEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Pays.countPayses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("payses", Pays.findAllPayses());
        }
        return "payses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PaysController.update(@Valid Pays pays, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pays", pays);
            return "payses/update";
        }
        uiModel.asMap().clear();
        pays.merge();
        return "redirect:/payses/" + encodeUrlPathSegment(pays.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PaysController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("pays", Pays.findPays(id));
        return "payses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PaysController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Pays.findPays(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/payses";
    }
    
    @ModelAttribute("payses")
    public Collection<Pays> PaysController.populatePayses() {
        return Pays.findAllPayses();
    }
    
    String PaysController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
