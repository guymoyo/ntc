package com.guymoyo.ntc.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import com.guymoyo.ntc.domain.Region;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Departement {

    @NotNull
    private String nom;

    private String description;

    @ManyToOne
    private Region region;
}
