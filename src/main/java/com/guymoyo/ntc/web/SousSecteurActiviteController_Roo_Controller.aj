// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.SecteurActivite;
import com.guymoyo.ntc.domain.SousSecteurActivite;
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

privileged aspect SousSecteurActiviteController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String SousSecteurActiviteController.create(@Valid SousSecteurActivite sousSecteurActivite, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("sousSecteurActivite", sousSecteurActivite);
            return "soussecteuractivites/create";
        }
        uiModel.asMap().clear();
        sousSecteurActivite.persist();
        return "redirect:/soussecteuractivites/" + encodeUrlPathSegment(sousSecteurActivite.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String SousSecteurActiviteController.createForm(Model uiModel) {
        uiModel.addAttribute("sousSecteurActivite", new SousSecteurActivite());
        return "soussecteuractivites/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String SousSecteurActiviteController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("soussecteuractivite", SousSecteurActivite.findSousSecteurActivite(id));
        uiModel.addAttribute("itemId", id);
        return "soussecteuractivites/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String SousSecteurActiviteController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("soussecteuractivites", SousSecteurActivite.findSousSecteurActiviteEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) SousSecteurActivite.countSousSecteurActivites() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("soussecteuractivites", SousSecteurActivite.findAllSousSecteurActivites());
        }
        return "soussecteuractivites/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String SousSecteurActiviteController.update(@Valid SousSecteurActivite sousSecteurActivite, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("sousSecteurActivite", sousSecteurActivite);
            return "soussecteuractivites/update";
        }
        uiModel.asMap().clear();
        sousSecteurActivite.merge();
        return "redirect:/soussecteuractivites/" + encodeUrlPathSegment(sousSecteurActivite.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String SousSecteurActiviteController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("sousSecteurActivite", SousSecteurActivite.findSousSecteurActivite(id));
        return "soussecteuractivites/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String SousSecteurActiviteController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SousSecteurActivite.findSousSecteurActivite(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/soussecteuractivites";
    }
    
    @ModelAttribute("secteuractivites")
    public Collection<SecteurActivite> SousSecteurActiviteController.populateSecteurActivites() {
        return SecteurActivite.findAllSecteurActivites();
    }
    
    @ModelAttribute("soussecteuractivites")
    public Collection<SousSecteurActivite> SousSecteurActiviteController.populateSousSecteurActivites() {
        return SousSecteurActivite.findAllSousSecteurActivites();
    }
    
    String SousSecteurActiviteController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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