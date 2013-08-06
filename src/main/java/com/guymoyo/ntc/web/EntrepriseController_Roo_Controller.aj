// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Entreprise;
import com.guymoyo.ntc.domain.Pays;
import com.guymoyo.ntc.domain.SecteurActivite;
import com.guymoyo.ntc.domain.SousSecteurActivite;
import com.guymoyo.ntc.domain.UserAccount;
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

privileged aspect EntrepriseController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String EntrepriseController.create(@Valid Entreprise entreprise, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("entreprise", entreprise);
            addDateTimeFormatPatterns(uiModel);
            return "entreprises/create";
        }
        uiModel.asMap().clear();
        entreprise.persist();
        return "redirect:/entreprises/" + encodeUrlPathSegment(entreprise.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String EntrepriseController.createForm(Model uiModel) {
        uiModel.addAttribute("entreprise", new Entreprise());
        addDateTimeFormatPatterns(uiModel);
        return "entreprises/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String EntrepriseController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("entreprise", Entreprise.findEntreprise(id));
        uiModel.addAttribute("itemId", id);
        return "entreprises/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String EntrepriseController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("entreprises", Entreprise.findEntrepriseEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Entreprise.countEntreprises() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("entreprises", Entreprise.findAllEntreprises());
        }
        addDateTimeFormatPatterns(uiModel);
        return "entreprises/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String EntrepriseController.update(@Valid Entreprise entreprise, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("entreprise", entreprise);
            addDateTimeFormatPatterns(uiModel);
            return "entreprises/update";
        }
        uiModel.asMap().clear();
        entreprise.merge();
        return "redirect:/entreprises/" + encodeUrlPathSegment(entreprise.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String EntrepriseController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("entreprise", Entreprise.findEntreprise(id));
        addDateTimeFormatPatterns(uiModel);
        return "entreprises/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String EntrepriseController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Entreprise.findEntreprise(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/entreprises";
    }
    
    @ModelAttribute("entreprises")
    public Collection<Entreprise> EntrepriseController.populateEntreprises() {
        return Entreprise.findAllEntreprises();
    }
    
    @ModelAttribute("payses")
    public Collection<Pays> EntrepriseController.populatePayses() {
        return Pays.findAllPayses();
    }
    
    @ModelAttribute("secteuractivites")
    public Collection<SecteurActivite> EntrepriseController.populateSecteurActivites() {
        return SecteurActivite.findAllSecteurActivites();
    }
    
    @ModelAttribute("soussecteuractivites")
    public Collection<SousSecteurActivite> EntrepriseController.populateSousSecteurActivites() {
        return SousSecteurActivite.findAllSousSecteurActivites();
    }
    
    @ModelAttribute("useraccounts")
    public Collection<UserAccount> EntrepriseController.populateUserAccounts() {
        return UserAccount.findAllUserAccounts();
    }
    
    void EntrepriseController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("entreprise_createdat_date_format", "dd-MM-yyyy hh:mm:ss");
    }
    
    String EntrepriseController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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