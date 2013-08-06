// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.web;

import com.guymoyo.ntc.domain.Departement;
import com.guymoyo.ntc.domain.Region;
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

privileged aspect DepartementController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String DepartementController.create(@Valid Departement departement, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("departement", departement);
            return "departements/create";
        }
        uiModel.asMap().clear();
        departement.persist();
        return "redirect:/departements/" + encodeUrlPathSegment(departement.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String DepartementController.createForm(Model uiModel) {
        uiModel.addAttribute("departement", new Departement());
        return "departements/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DepartementController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("departement", Departement.findDepartement(id));
        uiModel.addAttribute("itemId", id);
        return "departements/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DepartementController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("departements", Departement.findDepartementEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Departement.countDepartements() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("departements", Departement.findAllDepartements());
        }
        return "departements/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DepartementController.update(@Valid Departement departement, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("departement", departement);
            return "departements/update";
        }
        uiModel.asMap().clear();
        departement.merge();
        return "redirect:/departements/" + encodeUrlPathSegment(departement.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DepartementController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("departement", Departement.findDepartement(id));
        return "departements/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String DepartementController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Departement.findDepartement(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/departements";
    }
    
    @ModelAttribute("departements")
    public Collection<Departement> DepartementController.populateDepartements() {
        return Departement.findAllDepartements();
    }
    
    @ModelAttribute("regions")
    public Collection<Region> DepartementController.populateRegions() {
        return Region.findAllRegions();
    }
    
    String DepartementController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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